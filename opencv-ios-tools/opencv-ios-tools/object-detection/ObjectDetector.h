//
//  ObjectDetection.h
//  opencv-ios-tools
//
//  Created by Marc Fernandez on 11/10/13.
//  Copyright (c) 2013 Marc Fernandez. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ObjectDetector : NSObject {
@private
  NSUInteger _maxProcessingSize;
  NSMutableArray * _classifiers;
}
// Image gets scaled down to "maxProcessingSize" beforehand if necessary
- (id) initWithMaximumProcessingSize:(NSUInteger)maxProcessingSize;

- (void) loadClassifierFromPath:(NSString *)classifierPath minimumObjectSize:(NSUInteger)minSize;

// Returns NSArrays of NSValue / CGRect or nil on failure
- (NSArray*) detectObjectsInImage:(UIImage *)image;
- (NSArray*) detectObjectsInImage:(UIImage *)image withClassifiers:(NSArray *)classifiersArray;
@end