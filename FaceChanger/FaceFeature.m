//
//  FaceFeature.m
//  FaceFeatureFactory
//
//  Created by Ben on 23/12/2012.
//  Copyright (c) 2012 Ben. All rights reserved.
//

#import "FaceFeature.h"

@interface FaceFeature ()
-(void)showOverlayWithFrame:(CGRect)frame withMarque:(CAShapeLayer*)_marque;
-(void)scale:(id)sender;
-(void)rotate:(id)sender;
-(void)move:(id)sender;
-(void)createGestureRecogniserForView;
-(void)createPinchRecogniserForView;
-(void)createRotateRecogniserForView;

@property (nonatomic) CGFloat lastScale;
@property (nonatomic) CGFloat lastRotation;
@property (nonatomic) CGFloat firstX;
@property (nonatomic) CGFloat firstY;

@end


@implementation FaceFeature
@synthesize lastScale = _lastScale;
@synthesize lastRotation = _lastRotation;
@synthesize firstX = _firstX;
@synthesize firstY = _firstY;

//- (id)initWithFrame:(CGRect)frame
//{
//    self = [super initWithFrame:frame];
//    if (self) {
//        // Initialization code
//
//    }
//    return self;
//}

- (UIView*)drawFaceFeatures:(NSArray*)features
                   onCanvas:(UIView*)canvas
            withFeatureName:(NSString*)featureName
             andFeatureType:(FeatureType)typeOfFeature
{
    NSLog(@"Name %@",[NSString stringWithFormat:@"%@%i.png",featureName,typeOfFeature]);
    UIImageView *faceFeatureImageView = [[UIImageView alloc]initWithImage:
                                         [UIImage imageNamed:[NSString
                                                              stringWithFormat:@"%@%i.png",
                                                              featureName,
                                                              typeOfFeature]]];

    // CoreImage coordinate system origin is at the bottom left corner and UIKit's
    // is at the top left corner. So we need to translate features positions before
    // drawing them to screen. In order to do so we make an affine transform
    CGAffineTransform transform = CGAffineTransformMakeScale(1.0f, -1.0f);
    transform = CGAffineTransformTranslate(transform, 0, -canvas.bounds.size.height);
    
    for (CIFaceFeature *feature in features)
    {
        CGPoint leftEyePoint = CGPointApplyAffineTransform(feature.leftEyePosition, transform);
        CGPoint rightEyePoint = CGPointApplyAffineTransform(feature.rightEyePosition, transform);
        CGPoint mouthPoint = CGPointApplyAffineTransform(feature.mouthPosition, transform);
        
        //if no features detected
        if(feature == nil)
        {
            leftEyePoint = CGPointMake(feature.bounds.origin.x + feature.bounds.size.width/3, feature.bounds.origin.y + feature.bounds.size.height/1.5);
            rightEyePoint = CGPointMake(feature.bounds.origin.x + feature.bounds.size.width - feature.bounds.size.width/3, feature.bounds.origin.y + feature.bounds.size.height/1.5);
            mouthPoint = CGPointMake(feature.bounds.origin.x + feature.bounds.size.width/2, feature.bounds.origin.y + feature.bounds.size.height/3);
        }
  
        //draw feature
        switch (typeOfFeature)
        {
            case leftEye:
                if (feature.hasLeftEyePosition)
                {
                    [faceFeatureImageView setCenter:CGPointMake(leftEyePoint.x,leftEyePoint.y)];
                }
                break;
            case rightEye:
                if (feature.hasRightEyePosition)
                {
                    [faceFeatureImageView setCenter:CGPointMake(rightEyePoint.x,rightEyePoint.y)];
                }
                break;
            case scar:
                
                break;
            case mouth:
                if (feature.hasMouthPosition)
                {
                    [faceFeatureImageView setCenter:CGPointMake(mouthPoint.x,mouthPoint.y)];
                }
                break;
            default:
                break;
        }
    }
    
    NSLog(@"%f %f",faceFeatureImageView.frame.origin.x,faceFeatureImageView.frame.origin.y);
    
    CGPoint temp = CGPointApplyAffineTransform(CGPointMake(faceFeatureImageView.frame.origin.x,faceFeatureImageView.frame.origin.y),transform);
    [self createGestureRecognisers];
    self.frame = CGRectMake(temp.x, temp.y, faceFeatureImageView.frame.size.width, faceFeatureImageView.frame.size.height);
    self.userInteractionEnabled = YES;
    canvas.userInteractionEnabled = YES;
    faceFeatureImageView.userInteractionEnabled = YES;
    [canvas addSubview:faceFeatureImageView];
    return self;
}

#pragma mark - Manipulate Image

-(void)showOverlayWithFrame:(CGRect)frame withMarque:(CAShapeLayer*)_marque{
    
    if (![_marque actionForKey:@"linePhase"]) {
        CABasicAnimation *dashAnimation;
        dashAnimation = [CABasicAnimation animationWithKeyPath:@"lineDashPhase"];
        [dashAnimation setFromValue:[NSNumber numberWithFloat:0.0f]];
        [dashAnimation setToValue:[NSNumber numberWithFloat:15.0f]];
        [dashAnimation setDuration:0.5f];
        [dashAnimation setRepeatCount:HUGE_VALF];
        [_marque addAnimation:dashAnimation forKey:@"linePhase"];
    }
    
    _marque.bounds = CGRectMake(frame.origin.x, frame.origin.y, 0, 0);
    _marque.position = CGPointMake(frame.origin.x + self.frame.origin.x, frame.origin.y + self.frame.origin.y);
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathAddRect(path, NULL, frame);
    [_marque setPath:path];
    CGPathRelease(path);
    _marque.hidden = NO;
    
}

-(void)scale:(id)sender{
    
    if([(UIPinchGestureRecognizer*)sender state] == UIGestureRecognizerStateBegan) {
        _lastScale = 1.0;
    }
    
    CGFloat scale = 1.0 - (_lastScale - [(UIPinchGestureRecognizer*)sender scale]);
    
    CGAffineTransform currentTransform = self.transform;
    CGAffineTransform newTransform = CGAffineTransformScale(currentTransform, scale, scale);
    
    [self setTransform:newTransform];
    _lastScale = [(UIPinchGestureRecognizer*)sender scale];
        
}

-(void)rotate:(id)sender{
    
    if([(UIRotationGestureRecognizer*)sender state] == UIGestureRecognizerStateEnded) {
        
        _lastRotation = 0.0;
        return;
    }
    
    CGFloat rotation = 0.0 - (_lastRotation - [(UIRotationGestureRecognizer*)sender rotation]);
    CGAffineTransform currentTransform = self.transform;
    CGAffineTransform newTransform = CGAffineTransformRotate(currentTransform,rotation);
    
    [self setTransform:newTransform];
    
    _lastRotation = [(UIRotationGestureRecognizer*)sender rotation];
}

-(void)move:(id)sender{
    UIPanGestureRecognizer *gestureRecogniser = (UIPanGestureRecognizer*)sender;
    
    [self.superview bringSubviewToFront:gestureRecogniser.view];
    
    
    CGPoint translatedPoint = [(UIPanGestureRecognizer*)sender translationInView:self];
    
    if([(UIPanGestureRecognizer*)sender state] == UIGestureRecognizerStateBegan) {
        _firstX = [gestureRecogniser.view center].x;
        _firstY = [gestureRecogniser.view center].y;
    }
    
    translatedPoint = CGPointMake(_firstX+translatedPoint.x, _firstY+translatedPoint.y);
    [gestureRecogniser.view setCenter:translatedPoint];

    
}

-(void)createGestureRecognisers{
    [self createGestureRecogniserForView];
    [self createPinchRecogniserForView];
    [self createRotateRecogniserForView];
}

-(void)createGestureRecogniserForView{
    UIPanGestureRecognizer *panRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(move:)];
    [panRecognizer setMinimumNumberOfTouches:1];
    [panRecognizer setMaximumNumberOfTouches:1];
    [panRecognizer setDelegate:self];
    
    [self addGestureRecognizer:panRecognizer];
    
}

-(void)createPinchRecogniserForView{
    UIPinchGestureRecognizer *pinchRecognizer = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(scale:)];
    [pinchRecognizer setDelegate:self];
    [self addGestureRecognizer:pinchRecognizer];
}
-(void)createRotateRecogniserForView{
    UIRotationGestureRecognizer *rotationRecognizer = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(rotate:)];
    [rotationRecognizer setDelegate:self];
    [self addGestureRecognizer:rotationRecognizer];
}
@end

