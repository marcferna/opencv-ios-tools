//
//  OCVRootViewController.h
//  opencv-ios-tools
//
//  Created by Marc Fernandez on 11/10/13.
//  Copyright (c) 2013 Marc Fernandez. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OCVRootViewController : UIViewController {
  IBOutlet UIImageView * __weak imageView;
}

- (IBAction)detectFaces:(id)sender;

@end
