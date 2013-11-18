//
//  OCVRootViewController.m
//  opencv-ios-tools
//
//  Created by Marc Fernandez on 11/10/13.
//  Copyright (c) 2013 Marc Fernandez. All rights reserved.
//

#import "OCVRootViewController.h"
#import "OpenCV.h"
#import "OpenCV+Utils.h"

@interface OCVRootViewController ()

@end

@implementation OCVRootViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
  self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
  if (self) {
    // Custom initialization
  }
  return self;
}

- (void)viewDidLoad {
  [super viewDidLoad];
}

- (void)didReceiveMemoryWarning{
  [super didReceiveMemoryWarning];
}

#pragma mark - IBActions

- (IBAction)detectFaces:(id)sender {
  UIImage *image = [UIImage imageNamed:@"lena.jpg"];
  OpenCV *opencv = [[OpenCV alloc] initWithImage:image];
  NSArray *faces = [opencv detectFacesFromOriginalImage];
  imageView.image = [OpenCV drawObjects:faces inImage:image];
}

@end
