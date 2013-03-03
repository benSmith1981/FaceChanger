//
//  Ears.m
//  FaceFeatureFactory
//
//  Created by Ben on 23/12/2012.
//  Copyright (c) 2012 Ben. All rights reserved.
//

#import "LeftEye.h"

@implementation LeftEye


-(void)featureButtonPressed{
    NSLog(@"Feature button pressed");
}


-(NSString*)name
{
    return NSStringFromClass([self class]);
}
@end
