//
//  SharerButton.m
//  The_Times
//
//  Created by Ben on 24/01/2013.
//
//

#import "FaceFeatureButton.h"

@interface FaceFeatureButton ()
{
    NSMutableDictionary *backgroundStates;
}

- (void) setBackgroundColor:(UIColor *) _backgroundColor forState:(UIControlState) _state;
- (UIColor*) backgroundColorForState:(UIControlState) _state;
@end

@implementation FaceFeatureButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(UIButton*)createButton:(int)buttonNum ForFeatureWithCallback:(id<FaceFeatureProtocol>) delegate
{
    NSLog(@"%@",[NSString stringWithFormat:@"%@%i.png", [delegate name],buttonNum]);
    UIImage *test = [UIImage imageNamed:[NSString stringWithFormat:@"%@%i.png", [delegate name],buttonNum]];
    NSAssert(test != nil, @"No image exists with that name");
    
    [self setImage:test forState:UIControlStateNormal];
    [self setBackgroundColor:[UIColor blackColor] forState:UIControlStateHighlighted];
    [self setImage:test forState:UIControlStateHighlighted];
    [self setBackgroundColor:[UIColor clearColor] forState:UIControlStateNormal];
    [self setBackgroundColor:[UIColor clearColor]];
    [self addTarget:delegate action:@selector(featureButtonPressed) forControlEvents:UIControlEventTouchUpInside];
    
    return self;
}

- (void)setBackgroundColor:(UIColor *) _backgroundColor forState:(UIControlState) _state
{
    if (backgroundStates == nil) {
        backgroundStates = [[NSMutableDictionary alloc] init];
    }
    
    [backgroundStates setObject:_backgroundColor forKey:[NSNumber numberWithInt:_state]];
    
    if (self.backgroundColor == nil) {
        [self setBackgroundColor:_backgroundColor];
    }
}

- (UIColor*) backgroundColorForState:(UIControlState) _state
{
    return [backgroundStates objectForKey:[NSNumber numberWithInt:_state]];
}

#pragma mark -
#pragma mark Touches
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
	[super touchesBegan:touches withEvent:event];
    [self animateButtonBackgroundChangeForState:UIControlStateHighlighted];
}

-(void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
	[super touchesCancelled:touches withEvent:event];
    [self animateButtonBackgroundChangeForState:UIControlStateNormal];
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesEnded:touches withEvent:event];
    [self animateButtonBackgroundChangeForState:UIControlStateNormal];
}

-(void)animateButtonBackgroundChangeForState:(UIControlState)state
{
    UIColor *normalColor = [backgroundStates objectForKey:[NSNumber numberWithInt:state]];
    
    if (normalColor) {
        CATransition *animation = [CATransition animation];
        [animation setType:kCATransitionFade];
        [animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
        [self.layer addAnimation:animation forKey:@"EaseOut"];
        self.backgroundColor = normalColor;
    }
}

@end
