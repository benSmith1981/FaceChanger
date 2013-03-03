//
//  NSObject_Constants.h
//  Wiggers
//
//  Created by Ben Smith on 9/17/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#define OVERLAY_ALPHA 1.0f
#define SPIN_CLOCK_WISE 1
#define SPIN_COUNTERCLOCK_WISE -1

#define kInAppPurchaseProductID @"com.BenSmithInc.CHRISTMASIFY.CHRISTMASIFYPACK"

#define kHairKey 1
#define krightSBKey 2
#define kleftSBKey 3

#define TAG_GRAYVIEW 5671263 // for overlay on selected buttons

#define TITLE_FONT_SIZE 27.0f
#define threeButtonsTextSize 20
#define fourButtonsTextSize 15
#define buttonTitleTextSize 25
#define infoTextSize 20
#define restoreButtonTextSize 15

#define timeToShowText 2
#define buttonTextColour @"redColor"

#define FONT_TYPE @"SantasBigSecretBB"//@"Xmas Dad"
#define MAIN_TITLE_FONT @"Xmas Dad"//@"Santa'sSleighFull 'Deluxe'"//@"Xmas Dad" Christmas On Crack


#define KEY_CHAIN_USERNAME @"CHRISTMASIFY"
#define KEY_CHAIN_PASSWORD @"CHRISTMASIFY_PASSWORD"
#define KEY_SERVICE_NAME @"CHRISTMASIFY_PACK"

#define KEY_CHAIN_USERNAME_2 @"Facebook"
#define KEY_CHAIN_PASSWORD_2 @"FACEBOOK_PASSWORD"
#define KEY_SERVICE_NAME_2 @"FACEBOOK_PAGE"

#define AdID @"a150abdf7fe3612"

#define twitterName @"Christmasify1"
#define twitterText @"Christmasify yourself and get in the holiday mood!"

#define LOADING_TEXT_STRINGS {@"Chistmasifying", @"Growing Beard", @"Eatiing Mince Pies", @"Donning Antlers", @"Wrapping presents",@"Drinking Wine!!",@"Singing Carols",@"Fake Snowing!",nil}

#define SHARE_TEXT @"Christmasify, on app store now "
#define SHARE_URL @"http://bit.ly/Ug36M8" //www.wigtastic.com/Christmasify/index.html , this is so we can redirect the user to appstore when product is launched

#define APP_NAME @"Christmasify"

#define FACEBOOK_PAGE_URL @"http://www.facebook.com/pages/Christmasify/383096075098399"
#define FACEBOOK_PAGE_NUMBER @"383096075098399"

#define NOTIFICATION_PLIST_PATH @"http://wigtastic.com/notifications.plist"

#define IMG(name) [UIImage imageNamed:name]

#define SELECTED_IMAGE IMG(@"Green_tick.png")
#define PADLOCK_IMAGE IMG(@"padlock.png")
#define SOUNDBUTTONIMAGE IMG(@"X.png")

#define NUM_FREE_FEATURES 3
//,@"rightElfEar1.png"  @"leftElfEar1.png",

#define MOUTH_PARTS [NSArray arrayWithObjects:@"beard1.png",@"beard2.png", nil]
#define firstMouthName @"beard1.png"
//#define MOUTH_PARTS [NSArray arrayWithObjects:@"square.jpg",@"square.jpg", nil]
//#define firstMouthName @"square.jpg"

#define LEFTEYE_PARTS [NSArray arrayWithObjects:@"leftAntler1.png",@"leftAntler2.png", nil]
#define RIGHTEYE_PARTS [NSArray arrayWithObjects:@"rightAntler1.png",@"rightAntler2.png",nil]
#define EYE_PARTS [NSArray arrayWithObjects:@"leftAntler1.png", @"rightAntler1.png",@"leftAntler2.png", @"rightAntler2.png", nil]
#define leftFeatureName1 @"leftAntler"
#define rightFeatureName1 @"rightAntler"

#define SCAR_PARTS [NSArray arrayWithObjects:@"santaHat1",@"leopardSantaHat",@"elfHat2", nil]
#define firstScarName @"santaHat1"
//#define SCAR_PARTS [NSArray arrayWithObjects:@"square.jpg",@"square.jpg", nil]
//#define firstScarName @"square.jpg"


#define REINDEER_NOSE [NSArray arrayWithObjects:@"redNose1.png", nil]
#define nosesName @"redNose1"


//#define ELF_HATS [NSArray arrayWithObjects:@"elfHat", nil]
//#define ELF_EARS [NSArray arrayWithObjects:@"rightElfEar1.png",@"leftElfEar1.png", nil]
//
//#define REINDEER_NOSE [NSArray arrayWithObjects:@"redNose1.png", nil]
//#define REINDEER_ANTLERS [NSArray arrayWithObjects:@"leftAntler1.png", @"rightAntler1.png", nil]
//
//#define SANTA_BEARD [NSArray arrayWithObjects:@"beard1.png",nil]
//#define SANTA_HAT [NSArray arrayWithObjects:@"santaHat1",nil]

#define sounds [NSArray arrayWithObjects:@"JingleBells.mp3",@"santaHOHO.mp3", nil]

typedef enum {
    mouthContainer = 1,
    scarContainer = 2,
    eyeContainer = 3
    
} containerType;


