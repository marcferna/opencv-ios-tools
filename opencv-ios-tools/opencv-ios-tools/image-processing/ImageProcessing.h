//
//  ImageProcessing.h
//  opencv-ios-tools
//
//  Created by Marc Fernandez on 11/16/13.
//  Copyright (c) 2013 Marc Fernandez. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <opencv2/opencv.hpp>

@interface ImageProcessing : NSObject

/**
 *
 *
 *
 */
+ (IplImage *)createIplImageFromUIImage:(UIImage *)image;

/**
 *
 *
 *
 */
+ (UIImage *)createUIImageFromIplImage:(IplImage *)image;

@end
