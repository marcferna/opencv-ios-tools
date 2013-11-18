//
//  FaceDetector.m
//  opencv-ios-tools
//
//  Created by Marc Fernandez on 11/17/13.
//  Copyright (c) 2013 Marc Fernandez. All rights reserved.
//

#import "FaceDetector.h"

@implementation FaceDetector

#pragma mark - Class methods

+ (NSArray *) detectFacesInImage:(UIImage *)image {
  FaceDetector *detector = [[self alloc] init];
  NSString* facePath = [[NSBundle mainBundle] pathForResource:@"haarcascade_frontalface_default" ofType:@"xml"];
  [detector loadClassifierFromPath:facePath minimumObjectSize:1];
  return [detector detectObjectsInImage:image];
}

@end
