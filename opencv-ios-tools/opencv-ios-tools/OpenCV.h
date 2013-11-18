//
//  OpenCV.h
//  opencv-ios-tools
//
//  Created by Marc Fernandez on 11/10/13.
//  Copyright (c) 2013 Marc Fernandez. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OpenCV : NSObject

@property (nonatomic, strong) UIImage * originalImage;

- (id) initWithImage:(UIImage *)image;

- (NSArray *) detectFacesFromOriginalImage;

@end
