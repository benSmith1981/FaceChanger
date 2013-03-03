//
//  AppDelegate.h
//  FaceChanger
//
//  Created by Smith, Benjamin Terry on 1/6/13.
//  Copyright (c) 2013 Ben Smith. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FaceFeatureVC.h"
#import "MainScreen.h"


@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) UINavigationController *navigationController;


@property (strong, nonatomic) MainScreen *viewController;

@end
