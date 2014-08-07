//
//  Ears.m
//  FaceFeatureFactory
//
//  Created by Ben on 23/12/2012.
//  Copyright (c) 2012 Ben. All rights reserved.
//

#import "Mouth.h"
#define NUM_OF_EYES 2

@implementation Mouth

//- (UIView*)drawFaceFeatures:(NSArray*)features onCanvas:(UIView*)canvas withFeatureName:(NSString*)featureName andFeatureType:(int)typeOfFeature
//{
//    return nil;
//}

-(void)featureButtonPressed{
    NSLog(@"Feature button pressed");
}


-(NSString*)name
{
    return NSStringFromClass([self class]);
}
@end
