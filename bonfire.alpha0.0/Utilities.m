//
//  Utilities.m
//  bonfire.alpha0.0
//
//  Created by CamHart on 11/4/13.
//  Copyright (c) 2013 CamHart. All rights reserved.
//

#import "Utilities.h"

@implementation Utilities
+(NSString*)getVendorId {
    //if(SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"6.0"))
        return [UIDevice currentDevice].identifierForVendor.UUIDString;
    //else
    //    return [UIDevice currentDevice].uniqueIdentifier;
}

+(UIView*)getRootView {
    return [Utilities getRootViewController].view;
}

+(UIViewController*)getRootViewController {
    UIWindow* window = [[UIApplication sharedApplication] keyWindow];
    return window.rootViewController;
}

+(UIActivityIndicatorView *)getActivityIndicatorView {
    //only called once since it's static... perks of objective C
    static UIActivityIndicatorView* ai = nil;
   // UIWindow* window = [[UIApplication sharedApplication] keyWindow];
    UIView* curView = [Utilities getRootView];
    if(ai == nil) {
        ai = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    }
    
    if(!(ai.center.x == curView.center.x && ai.center.y == curView.center.y))
        ai.center = curView.center;
    if(![curView.subviews containsObject:ai])
        [curView addSubview:ai];
    return ai;
}

+(void)showActivityIndicator{
    dispatch_async(dispatch_get_main_queue(), ^{
        [[Utilities getActivityIndicatorView] startAnimating];
        [[UIApplication sharedApplication] beginIgnoringInteractionEvents];
    });
}

+(void)hideActivityIndicator{
    dispatch_async(dispatch_get_main_queue(), ^{
        [[UIApplication sharedApplication] endIgnoringInteractionEvents];
        [[Utilities getActivityIndicatorView] stopAnimating];
    });
}

+(void)showAlert:(NSString *)str andTitle:(NSString*)title{
    dispatch_async(dispatch_get_main_queue(), ^{
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title message:str delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    });
    //[alert release];
}


@end