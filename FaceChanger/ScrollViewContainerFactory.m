//
//  ScrollViewContainerFactory.m
//  FaceChanger
//
//  Created by Smith, Benjamin Terry on 1/14/13.
//  Copyright (c) 2013 Ben Smith. All rights reserved.
//

#import "ScrollViewContainerFactory.h"
#import "MouthScroll.h"

@implementation ScrollViewContainerFactory

+(id<ScrollViewProtocol>)createScrollViewWithType:(ScrollType)FeatureType{
    if (FeatureType == mouths) {
        return [MouthScroll new];
    }
    return nil;
}

@end
