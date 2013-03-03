//
//  MainScreen.m
//  FaceChanger
//
//  Created by Ben on 13/01/2013.
//  Copyright (c) 2013 Ben Smith. All rights reserved.
//

#import "MainScreen.h"
#import "FaceFeatureVC.h"

@interface MainScreen ()

@end

@implementation MainScreen

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)ScanFace:(id)sender {
    FaceFeatureVC *faceVC = [[FaceFeatureVC alloc]initWithNibName:@"FaceFeatureVC" bundle:nil];
    faceVC.view.frame = self.view.frame;
    faceVC.faceImageToScan = [UIImage imageNamed:@"face.jpg"];
    [self presentViewController:faceVC animated:YES completion:nil];
}

#pragma mark - OverlayViewControllerDelegate

// as a delegate we are being told a picture was taken
- (void)didTakePicture:(UIImage *)picture
{
    FaceFeatureVC *faceVC = [[FaceFeatureVC alloc]initWithNibName:@"FaceFeatureVC" bundle:nil];
    faceVC.faceImageToScan = picture; //does this copy the address? if Picture is nilled will it invaludate faceImageToScane Var?
    [self presentViewController:faceVC animated:YES completion:nil];
}

// as a delegate we are told to finished with the camera
- (void)didFinishWithCamera
{
    [self dismissViewControllerAnimated:YES completion:nil];

}
@end
