//
//  Utilities.h
//  bonfire.alpha0.0
//
//  Created by CamHart on 11/4/13.
//  Copyright (c) 2013 CamHart. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Utilities : NSObject
+(NSString*)getVendorId;
+(void)showActivityIndicator;
+(void)hideActivityIndicator;
+(void)showAlert:(NSString *)str andTitle:(NSString*)title;
+(UIView*)getRootView;
+(UIViewController*)getRootViewController;
@end
