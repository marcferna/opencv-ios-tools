//
//  Classifier.h
//  opencv-ios-tools
//
//  Created by Marc Fernandez on 11/17/13.
//  Copyright (c) 2013 Marc Fernandez. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <opencv2/opencv.hpp>

@interface Classifier : NSObject {
@private
  CvHaarClassifierCascade* _classifier;
  NSUInteger _minSize;
}
@property(nonatomic, readonly) CvHaarClassifierCascade* classifier;
@property(nonatomic, readonly) NSUInteger mininumObjectSize;

- (id) initWithPath:(NSString*)path andMininumObjectSize:(NSUInteger)minimumSize;

@end