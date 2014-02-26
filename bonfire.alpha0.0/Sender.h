//
//  Sender.h
//  bonfire.alpha0.0
//
//  Created by CamHart on 11/3/13.
//  Copyright (c) 2013 CamHart. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Sender : NSObject
+(void)sendMessage:(NSString*)msg;
+(void)sendCreateUser:(NSString*)username andPassword:(NSString *)password;
+(void)sendLoginUser:(NSString*)username andPassword:(NSString *)password;
+(void)sendCreateGame;
@end
