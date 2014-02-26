//
//  SocketDelegate.h
//  bonfire.alpha0.0
//
//  Created by CamHart on 11/1/13.
//  Copyright (c) 2013 CamHart. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "GCDAsyncSocket.h"
#import "Game.h"

@interface SocketDelegate : NSObject <GCDAsyncSocketDelegate>
- (void)socket:(GCDAsyncSocket *)sock didConnectToHost:(NSString *)host port:(uint16_t)port;
- (void)socketDidDisconnect:(GCDAsyncSocket *)sock withError:(NSError *)err;
- (void)socket:(GCDAsyncSocket *)sock didReadData:(NSData *)data withTag:(long)tag;
//-(id)initWithGame:(Game*)game;
@end

