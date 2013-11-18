//
//  FaceDetector.h
//  opencv-ios-tools
//
//  Created by Marc Fernandez on 11/17/13.
//  Copyright (c) 2013 Marc Fernandez. All rights reserved.
//

#import "ObjectDetector.h"

@interface FaceDetector : ObjectDetector

+ (NSArray *)detectFacesInImage:(UIImage *)image;

@end
