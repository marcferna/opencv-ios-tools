//
//  ImageProcessing.m
//  opencv-ios-tools
//
//  Created by Marc Fernandez on 11/16/13.
//  Copyright (c) 2013 Marc Fernandez. All rights reserved.
//

#import "ImageProcessing.h"

@implementation ImageProcessing

+ (IplImage *)createIplImageFromUIImage:(UIImage *)image {
  // Getting CGImage from UIImage
  CGImageRef imageRef = image.CGImage;
  
  CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
  // Creating temporal IplImage for drawing
  IplImage *iplimage = cvCreateImage(cvSize(image.size.width, image.size.height),
                                     IPL_DEPTH_8U,
                                     4);
  
  // Creating CGContext for temporal IplImage
  CGContextRef contextRef = CGBitmapContextCreate(iplimage->imageData,
                                                  iplimage->width, iplimage->height,
                                                  iplimage->depth, iplimage->widthStep,
                                                  colorSpace,
                                                  kCGImageAlphaPremultipliedLast | kCGBitmapByteOrderDefault
                                                  );
  // Drawing CGImage to CGContext
  CGContextDrawImage(contextRef,
                     CGRectMake(0, 0, image.size.width, image.size.height),
                     imageRef);
  CGContextRelease(contextRef);
  CGColorSpaceRelease(colorSpace);
  
  // Creating result IplImage
  IplImage *resultImage = cvCreateImage(cvGetSize(iplimage), IPL_DEPTH_8U, 3);
  cvCvtColor(iplimage, resultImage, CV_RGBA2BGR);
  cvReleaseImage(&iplimage);
  
  return resultImage;
}

+ (UIImage *)createUIImageFromIplImage:(IplImage *)image {
  CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
  // Allocating the buffer for CGImage
  NSData *data =
  [NSData dataWithBytes:image->imageData length:image->imageSize];
  CGDataProviderRef provider =
  CGDataProviderCreateWithCFData((CFDataRef)data);
  // Creating CGImage from chunk of IplImage
  CGImageRef imageRef = CGImageCreate(
                                      image->width, image->height,
                                      image->depth, image->depth * image->nChannels, image->widthStep,
                                      colorSpace, kCGImageAlphaNone|kCGBitmapByteOrderDefault,
                                      provider, NULL, false, kCGRenderingIntentDefault
                                      );
  // Getting UIImage from CGImage
  UIImage *resultImage = [UIImage imageWithCGImage:imageRef];
  CGImageRelease(imageRef);
  CGDataProviderRelease(provider);
  CGColorSpaceRelease(colorSpace);
  return resultImage;
}

@end
