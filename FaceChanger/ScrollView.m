//
//  ScrollView.m
//  FaceChanger
//
//  Created by Ben on 02/02/2013.
//  Copyright (c) 2013 Ben Smith. All rights reserved.
//

#import "ScrollView.h"
#import "FaceFeatureButton.h"

@implementation ScrollView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self setFrame:CGRectMake(0, 0, self.superview.bounds.size.width, 100)];
        [self setBackgroundColor:[UIColor clearColor]];
        [self setScrollEnabled:YES];
    }
    return self;
}

-(void)addButtonWithCallback:(id<FaceFeatureProtocol>) delegate
{
    CGRect frame = CGRectZero; // First Button Position
    frame.size = CGSizeMake(54,50);
    if([self.subviews count] > 0)
    {
        // Calc Height Of New Button
        UIView* lastView = [self.subviews lastObject];
        frame.origin.x = CGRectGetMaxX(lastView.frame);
        frame.origin.x += 1;
        [self setContentSize:CGSizeMake(CGRectGetMaxX(lastView.frame)+frame.size.width, frame.size.height)];

    }
    
    FaceFeatureButton *tempButton = [[FaceFeatureButton alloc] initWithFrame:frame];
    [tempButton createButton:[self.subviews count] ForFeatureWithCallback:delegate];
    [self addSubview:tempButton];

}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
