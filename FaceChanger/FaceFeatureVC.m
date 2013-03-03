//
//  ViewController.m
//  FaceFeatureFactory
//
//  Created by Ben on 21/12/2012.
//  Copyright (c) 2012 Ben. All rights reserved.
//

#import "FaceFeatureVC.h"
#import "faceFeatureFactory.h"
#import "UIImage+ImageProcessing.h"
#import "ScrollContainer.h"
#import "ScrollViewContainerFactory.h"
#import "ScrollView.h"

@interface FaceFeatureVC ()
@property(nonatomic,strong)NSArray *FaceFeatures;
@property(nonatomic,strong)NSArray *scrollMenus;
@end

@implementation FaceFeatureVC
@synthesize canvas = _canvas;
@synthesize FaceFeatures = _FaceFeatures;
@synthesize faceImageToScan = _faceImageToScan;
@synthesize scrollMenus = _scrollMenus;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        NSMutableArray *localFaceFeatures = [[NSMutableArray alloc]initWithCapacity:totalTypes];
        for (int i = 0; i < totalTypes; i++) {
            [localFaceFeatures insertObject:[faceFeatureFactory createFaceFeatureWithType:i] atIndex:i];
        }
        _FaceFeatures = localFaceFeatures;
        
        NSMutableArray *localScrollMenus = [[NSMutableArray alloc]initWithCapacity:totalScrollTypes];
        for (int i = 0; i < totalScrollTypes; i++) {
            [localScrollMenus insertObject:[ScrollViewContainerFactory createScrollViewWithType:i] atIndex:i];
        }
        _scrollMenus = localScrollMenus;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receiveImagefeatures:) name:@"featuresNotification" object:nil];
    
    //Calls category on UIImage used to process the face image to detect features
    [[UIImage imageNamed:@"face.jpg"] processFace];
    
    NSLog(@"%f",_canvas.frame.size.height+_canvas.frame.origin.y);
    ScrollContainer *scrollContainer = [[ScrollContainer alloc]initWithFrame:CGRectMake(0,_canvas.bounds.size.height, self.view.frame.size.width, 50)];
    
    [[_scrollMenus objectAtIndex:0] setFrame:CGRectMake(0, 0, scrollContainer.frame.size.width, scrollContainer.frame.size.height)];

    [[_scrollMenus objectAtIndex:0]addButtonWithCallback:[_FaceFeatures objectAtIndex:0]];
    [[_scrollMenus objectAtIndex:0]addButtonWithCallback:[_FaceFeatures objectAtIndex:0]];
    [[_scrollMenus objectAtIndex:0]addButtonWithCallback:[_FaceFeatures objectAtIndex:0]];
    [[_scrollMenus objectAtIndex:0]addButtonWithCallback:[_FaceFeatures objectAtIndex:0]];
    [[_scrollMenus objectAtIndex:0]addButtonWithCallback:[_FaceFeatures objectAtIndex:0]];
    [[_scrollMenus objectAtIndex:0]addButtonWithCallback:[_FaceFeatures objectAtIndex:0]];
    [[_scrollMenus objectAtIndex:0]addButtonWithCallback:[_FaceFeatures objectAtIndex:0]];
    [[_scrollMenus objectAtIndex:0]addButtonWithCallback:[_FaceFeatures objectAtIndex:0]];
    [[_scrollMenus objectAtIndex:0]addButtonWithCallback:[_FaceFeatures objectAtIndex:0]];

    [scrollContainer addSubview:[_scrollMenus objectAtIndex:0]];
    [self.view addSubview:scrollContainer];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Image features Notification
- (void) receiveImagefeatures:(NSNotification *) notification
{
    // [notification name] should always be @"TestNotification"
    // unless you use this method for observation of other notifications
    // as well.
    
    //features detected from the face image
    NSArray *features = [notification.userInfo objectForKey:@"features"];
    
    UIImageView *imageToDisplay = [[UIImageView alloc]initWithImage:_faceImageToScan];
    [imageToDisplay setFrame:CGRectMake(_canvas.frame.origin.x, _canvas.frame.origin.y, _canvas.frame.size.width, _canvas.frame.size.height)];
    [_canvas addSubview:imageToDisplay];
    
    for (int i = 0; i < totalTypes; i++)
    {
        //set frame of sharer button
        [_canvas addSubview:[[_FaceFeatures objectAtIndex:0] drawFaceFeatures:(NSArray*)features onCanvas:_canvas withFeatureName:@"LeftEye" andFeatureType:0]];
    }
}

@end
