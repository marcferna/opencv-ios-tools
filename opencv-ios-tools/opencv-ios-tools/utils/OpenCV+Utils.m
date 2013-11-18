//
//  OpenCV+Utils.m
//  opencv-ios-tools
//
//  Created by Marc Fernandez on 11/17/13.
//  Copyright (c) 2013 Marc Fernandez. All rights reserved.
//

#import "OpenCV+Utils.h"

@implementation OpenCV (Utils)

+ (UIImage *)drawObjects:(NSArray *)objects inImage:(UIImage *)image {
  
  UIGraphicsBeginImageContext(image.size);
  // draw original image into the context
  [image drawAtPoint:CGPointZero];
  
  for (NSObject * object in objects) {
    CGRect objectFrame = [objects.firstObject CGRectValue];
  
    // get the context for CoreGraphics
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    [UIColor.redColor setStroke];
    CGContextStrokeRect(ctx, objectFrame);
  }
  
  // make image out of bitmap context
  UIImage *resulstImage = UIGraphicsGetImageFromCurrentImageContext();
    
  UIGraphicsEndImageContext();
  
  return resulstImage;
}

@end
