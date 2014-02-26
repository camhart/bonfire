//
//  Sender.m
//  bonfire.alpha0.0
//
//  Created by CamHart on 11/3/13.
//  Copyright (c) 2013 CamHart. All rights reserved.
//

#import "Sender.h"
#import "GameState.h"
#import "Utilities.h"
#import <CommonCrypto/CommonDigest.h>

@implementation Sender
+(void)sendMessage:(NSString *)msg {
    NSData* data = [msg dataUsingEncoding:NSUTF8StringEncoding];
    [[[GameState sharedInstance] socket] writeData:data withTimeout:-1 tag:0];
}

+(void)reOpen {
    if(![[[GameState sharedInstance] socket] isConnected]) {
        
        [[GameState sharedInstance] createConnection];
    }
}


+(void)sendLoginUser:(NSString *)username andPassword:(NSString *)password{
    NSMutableString* sendMsg = [[NSMutableString alloc] init];
    [sendMsg appendString:@"LOGINUSER "];
    [sendMsg appendString:username];
    [sendMsg appendString:@" "];
    [sendMsg appendString:password];
//    [sendMsg appendString:@" "];
//    [sendMsg appendString:firstName];
//    [sendMsg appendString:@" "];
//    [sendMsg appendString:lastName];
//    [sendMsg appendString:@" "];
//    [sendMsg appendString:email];
    //[sendMsg appendString:@" "];
    //[sendMsg appendString:[Utilities getVendorId]];
    [sendMsg appendString:@"\r\n\r\n"];
    NSData* data = [sendMsg dataUsingEncoding:NSUTF8StringEncoding];
    [Utilities showActivityIndicator];
    [Sender reOpen];
    [[[GameState sharedInstance] socket] writeData:data withTimeout:15 tag:0];
}


+(void)sendCreateUser:(NSString *)username andPassword:(NSString *)password{
    NSMutableString* sendMsg = [[NSMutableString alloc] init];
    NSString* firstName = @"test_firstName";
    NSString* lastName = @"test_lastName";
    NSString* email = @"test@test.net";
    [sendMsg appendString:@"CREATEUSER "];
    [sendMsg appendString:username];
    [sendMsg appendString:@" "];
    [sendMsg appendString:password];
    [sendMsg appendString:@" "];
    [sendMsg appendString:firstName];
    [sendMsg appendString:@" "];
    [sendMsg appendString:lastName];
    [sendMsg appendString:@" "];
    [sendMsg appendString:email];
    [sendMsg appendString:@" "];
    [sendMsg appendString:[Utilities getVendorId]];
    [sendMsg appendString:@"\r\n\r\n"];
    NSData* data = [sendMsg dataUsingEncoding:NSUTF8StringEncoding];
    [Utilities showActivityIndicator];
    [Sender reOpen];
    [[[GameState sharedInstance] socket] writeData:data withTimeout:15 tag:0];
}

@end
