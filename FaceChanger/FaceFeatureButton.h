//
//  SharerButton.h
//  The_Times
//
//  Created by Ben on 24/01/2013.
//
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "FaceFeature.h"

@interface FaceFeatureButton : UIButton

/**
 @param CGRect this is the frame for the button, used to determine the size and position of it on the Sharer view
 @return UIButton Returns the button created to the caller
 */
-(UIButton*)createButton:(int)buttonNum ForFeatureWithCallback:(id<FaceFeatureProtocol>) delegate;
@end
