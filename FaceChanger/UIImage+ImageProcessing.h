//
//  NSObject+UIImage_ImageProcessing.h
//  FaceChanger
//
//  Created by Smith, Benjamin Terry on 1/6/13.
//  Copyright (c) 2013 Ben Smith. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UIImage (ImageProcessing)
-(void)processFace;
- (UIImage*)addOverlayToBaseImageForTargetSize:(CGSize)imageSize;
- (UIImage*)dumpOverlayViewToImageWithTargetSize:(CGSize)targetSize;
@end
