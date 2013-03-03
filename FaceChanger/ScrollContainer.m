//
//  ScrollView.m
//  FaceChanger
//
//  Created by Smith, Benjamin Terry on 1/14/13.
//  Copyright (c) 2013 Ben Smith. All rights reserved.
//

#import "ScrollContainer.h"

@implementation ScrollContainer
@synthesize scrollView = _scrollView;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self setBackgroundColor:[UIColor clearColor]];
    }
    return self;
}
@end
