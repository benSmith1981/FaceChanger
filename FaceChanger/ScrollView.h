//
//  ScrollView.h
//  FaceChanger
//
//  Created by Ben on 02/02/2013.
//  Copyright (c) 2013 Ben Smith. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ScrollViewProtocol.h"

@interface ScrollView : UIScrollView
-(void)addButtonWithCallback:(id<ScrollViewProtocol>) delegate;

@end
