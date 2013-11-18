//
//  Classifier.m
//  opencv-ios-tools
//
//  Created by Marc Fernandez on 11/17/13.
//  Copyright (c) 2013 Marc Fernandez. All rights reserved.
//

#import "Classifier.h"

@implementation Classifier

@synthesize classifier = _classifier, mininumObjectSize = _mininumObjectSize;

- (void) dealloc {
  if (_classifier) {
    cvReleaseHaarClassifierCascade(&_classifier);
  }
}

- (id) initWithPath:(NSString*)path andMininumObjectSize:(NSUInteger)minimumSize {
  if ((self = [super init])) {
    _classifier = (CvHaarClassifierCascade*)cvLoad([path fileSystemRepresentation], NULL, NULL, NULL);
    if (_classifier == NULL) {
      return nil;
    }
    _mininumObjectSize = minimumSize;
  }
  return self;
}

@end