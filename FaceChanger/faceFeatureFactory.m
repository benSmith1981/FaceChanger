//
//  faceFeatureFactory.m
//  FaceFeatureFactory
//
//  Created by Ben on 23/12/2012.
//  Copyright (c) 2012 Ben. All rights reserved.
//

#import "faceFeatureFactory.h"

@implementation faceFeatureFactory

+(id<FaceFeatureProtocol>)createFaceFeatureWithType:(FeatureType)FeatureType{
    switch (FeatureType) {
        case rightEye:
            
            NSLog(@"Eyes Type");
            return [[RightEye alloc] init];
            
            break;
        case leftEye:
            
            NSLog(@"Eyes Type");
            return [[LeftEye alloc] init];
            
            break;
        case scar:
            
            NSLog(@"Eyes Type");
            return [[Scar alloc] init];
            
            break;
        case mouth:
            
            NSLog(@"Eyes Type");
            return [[Mouth alloc] init];
            
            break;
        default:
            NSLog(@"Not a face feature type");
            return nil;
            break;
    }
}
@end
