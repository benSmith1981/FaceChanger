//
//  MainScreen.h
//  FaceChanger
//
//  Created by Ben on 13/01/2013.
//  Copyright (c) 2013 Ben Smith. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CameraVC.h"

@interface MainScreen : UIViewController <OverlayViewControllerDelegate>
- (IBAction)ScanFace:(id)sender;

@end
