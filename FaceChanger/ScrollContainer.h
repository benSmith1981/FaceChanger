//
//  ScrollView.h
//  FaceChanger
//
//  Created by Smith, Benjamin Terry on 1/14/13.
//  Copyright (c) 2013 Ben Smith. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef enum {
    mouths = 0,
    totalScrollTypes = 1,
    
} ScrollType;

@interface ScrollContainer : UIView
{
    
}
@property (nonatomic, strong) UIScrollView *scrollView;

@end


