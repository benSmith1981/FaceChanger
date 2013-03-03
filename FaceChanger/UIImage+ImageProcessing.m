//
//  NSObject+UIImage_ImageProcessing.m
//  FaceChanger
//
//  Created by Smith, Benjamin Terry on 1/6/13.
//  Copyright (c) 2013 Ben Smith. All rights reserved.
//
#import "UIImage+ImageProcessing.h"

@implementation UIImage (ImageProcessing)

-(void)processFace{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        
        CIImage *imageToScan = [[CIImage alloc]initWithImage:self];
        
        //NSString *accuracy = CIDetectorAccuracyHigh;
        NSNumber *orientation = [NSNumber numberWithInt:[self imageOrientation]+1];
        NSDictionary *options = [NSDictionary dictionaryWithObject:orientation forKey: CIDetectorImageOrientation];
        //NSDictionary *options = [NSDictionary dictionaryWithObject:accuracy forKey:CIDetectorAccuracy];
        CIDetector *detector = [CIDetector detectorOfType:CIDetectorTypeFace context:nil options:options];
        
        
        NSArray *features = [detector featuresInImage:imageToScan];
        
        
        dispatch_async(dispatch_get_main_queue(), ^{
            NSDictionary *dict = [NSDictionary dictionaryWithObject:features forKey:@"features"];
            [[NSNotificationCenter defaultCenter]
             postNotificationName:@"featuresNotification"
             object:self userInfo:dict];
        });
        
    });
}

#pragma mark - Dump Image
/*To add an overlay image to the camera image you must specify the overlay image here
 */
- (UIImage*)dumpOverlayViewToImageWithTargetSize:(CGSize)targetSize {
    CGSize imageSize;
    imageSize = CGSizeMake(targetSize.width, targetSize.height);
	UIGraphicsBeginImageContext(imageSize);
	//[cameraImageView.layer renderInContext:UIGraphicsGetCurrentContext()];
	UIImage *viewImage = UIGraphicsGetImageFromCurrentImageContext();
	UIGraphicsEndImageContext();
	
	return viewImage;
}

/*Pass in the base image from the camera here
 */
- (UIImage*)addOverlayToBaseImageForTargetSize:(CGSize)imageSize {
    UIImage* result;

    //UIImage *overlayImageLocal = [self dumpOverlayViewToImageWithTargetSize:imageSize];
    CGPoint topCorner = CGPointMake(0, 0);
    CGSize targetSize = CGSizeMake(imageSize.width, imageSize.height);
    CGRect scaledRect = CGRectZero;
    
    CGFloat scaledX = imageSize.height * self.size.width / self.size.height;
    CGFloat offsetX = (scaledX - imageSize.width) / -2;
    
    scaledRect.origin = CGPointMake(offsetX, 0.0);
    scaledRect.size.width  = scaledX;
    scaledRect.size.height = imageSize.height;
    
    UIGraphicsBeginImageContext(targetSize);
    [self drawInRect:scaledRect];
    //[overlayImageLocal drawAtPoint:topCorner];
    result = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

	
	return result;
}


@end
