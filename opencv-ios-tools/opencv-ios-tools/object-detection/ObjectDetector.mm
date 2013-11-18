//
//  ObjectDetector.m
//  opencv-ios-tools
//
//  Created by Marc Fernandez on 11/10/13.
//  Copyright (c) 2013 Marc Fernandez. All rights reserved.
//

#import "ObjectDetector.h"
#import <opencv2/opencv.hpp>
// Libraries
#import "Classifier.h"
#import "ImageProcessing.h"

@implementation ObjectDetector

- (void) dealloc {
  _classifiers = nil;
}

- (id) init {
  return [self initWithMaximumProcessingSize:0];
}

- (id) initWithMaximumProcessingSize:(NSUInteger)maxProcessingSize {
  if ((self = [super init])) {
    _maxProcessingSize = maxProcessingSize;
    _classifiers = [[NSMutableArray alloc] init];
  }
  return self;
}

# pragma mark - Instance methods

- (void) loadClassifierFromPath:(NSString*)classifierPath minimumObjectSize:(NSUInteger)minSize {
  Classifier* classifier = [[Classifier alloc] initWithPath:classifierPath andMininumObjectSize:minSize];
  if (classifier) {
    [_classifiers addObject:classifier];
  }
}

- (NSArray *) detectObjectsInImage:(UIImage*)image {
  return [self detectObjectsInImage:image withClassifiers:nil];
}

- (NSArray *) detectObjectsInImage:(UIImage*)image withClassifiers:(NSArray *)classifiersArray {
  if (classifiersArray && classifiersArray.count > 0) {
   _classifiers = [[NSMutableArray alloc] initWithArray:classifiersArray];
  }
  return image ? [self _detectObjectsInImage:image] : nil;
}

# pragma mark - Private methods

- (NSArray*) _detectObjectsInImage:(UIImage *)image {
  NSMutableArray* results = [NSMutableArray array];
  if (_classifiers.count) {
    // Compute processing dimensions
    CGFloat imageWidth = CGImageGetWidth(image.CGImage);
    CGFloat imageHeight = CGImageGetHeight(image.CGImage);
    size_t contextWidth;
    size_t contextHeight;
    CGFloat scale;
    if ((_maxProcessingSize > 0) && ((imageWidth > _maxProcessingSize) || (imageHeight > _maxProcessingSize))) {
      CGSize size = CGSizeMake(_maxProcessingSize, _maxProcessingSize);
      if (imageWidth / size.width >= imageHeight / size.height) {
        scale = ((CGFloat)imageWidth / size.width);
        contextHeight = (CGFloat)imageHeight / scale;
        contextWidth = size.width;
      } else {
        scale = ((CGFloat)imageHeight / size.height);
        contextWidth = (CGFloat)imageWidth / scale;
        contextHeight = size.height;
      }
    } else {
      contextWidth = imageWidth;
      contextHeight = imageHeight;
      scale = 1.0;
    }
    
    // Create BGR IplImage from rendered CGImage
    IplImage * iplImage = [ImageProcessing createIplImageFromUIImage:image];
    
    // Find objects
    for (Classifier* classifier in _classifiers) {
      CvMemStorage* storage = cvCreateMemStorage(0);
      CvSize minSize = cvSize(classifier.mininumObjectSize, classifier.mininumObjectSize);
      CvSeq* objects = cvHaarDetectObjects(iplImage,
                                           classifier.classifier,
                                           storage,
                                           1.1,
                                           3,
                                           CV_HAAR_DO_CANNY_PRUNING,
                                           minSize,
                                           cvSize(0, 0));
      
      for (int i = 0; i < objects->total; ++i) {
        CvRect* objectRect = (CvRect*)cvGetSeqElem(objects, i);
        [results addObject:[NSValue valueWithCGRect:CGRectMake((CGFloat)objectRect->x * scale,
                                                             (CGFloat)objectRect->y * scale,
                                                             (CGFloat)objectRect->width * scale,
                                                             (CGFloat)objectRect->height * scale)]];
      }
      cvReleaseMemStorage(&storage);
    }
    
    // Clean up
    cvReleaseImage(&iplImage);
  }
  return results;
}

@end