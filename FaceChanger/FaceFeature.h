//
//  FaceFeature.h
//  FaceFeatureFactory
//
//  Created by Ben on 23/12/2012.
//  Copyright (c) 2012 Ben. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

typedef enum {
    leftEye = 0,
    rightEye = 1,
    mouth = 2,
    scar = 3,
    totalTypes = 4,
    
} FeatureType;

@protocol FaceFeatureProtocol;

@interface FaceFeature : UIView <UIGestureRecognizerDelegate>

-(void)createGestureRecognisers;
- (UIView*)drawFaceFeatures:(NSArray*)features onCanvas:(UIView*)canvas withFeatureName:(NSString*)featureName andFeatureType:(int)typeOfFeature;

@end

@protocol FaceFeatureProtocol <NSObject>
- (void)featureButtonPressed;
- (NSString*)name;


@end

