//
//  ViewController.h
//  FaceFeatureFactory
//
//  Created by Ben on 21/12/2012.
//  Copyright (c) 2012 Ben. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FaceFeatureVC : UIViewController
@property(nonatomic,strong)UIImage *faceImageToScan;

@property (strong, nonatomic) IBOutlet UIView *canvas;
@end
