//
//  OpenCV.m
//  opencv-ios-tools
//
//  Created by Marc Fernandez on 11/10/13.
//  Copyright (c) 2013 Marc Fernandez. All rights reserved.
//

#import "OpenCV.h"
#import <opencv2/opencv.hpp>
#import "FaceDetector.h"


@implementation OpenCV

@synthesize originalImage;

- (id) initWithImage:(UIImage *)image {
  self = [super init];
  if (self) {
    originalImage = image;
  }
  return self;
}

- (NSArray *) detectFacesFromOriginalImage {
  return [FaceDetector detectFacesInImage:originalImage];
}

@end
