//
//  faceFeatureFactory.h
//  FaceFeatureFactory
//
//  Created by Ben on 23/12/2012.
//  Copyright (c) 2012 Ben. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RightEye.h"
#import "LeftEye.h"
#import "Mouth.h"
#import "Scar.h"
#import "FaceFeature.h"

@interface faceFeatureFactory : NSObject

+(id<FaceFeatureProtocol>)createFaceFeatureWithType:(FeatureType)FeatureType;

@end
