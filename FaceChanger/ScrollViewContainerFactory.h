//
//  ScrollViewContainerFactory.h
//  FaceChanger
//
//  Created by Smith, Benjamin Terry on 1/14/13.
//  Copyright (c) 2013 Ben Smith. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ScrollViewProtocol.h"
#import "ScrollContainer.h"

@interface ScrollViewContainerFactory : NSObject

+(id<ScrollViewProtocol>)createScrollViewWithType:(ScrollType)FeatureType;

@end
