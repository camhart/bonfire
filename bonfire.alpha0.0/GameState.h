//
//  GameState.h
//  bonfire.alpha0.0
//
//  Created by CamHart on 11/3/13.
//  Copyright (c) 2013 CamHart. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Game.h"
#import "GCDAsyncSocket.h"
#import "Sender.h"

@interface GameState : NSObject
@property (strong, nonatomic)Game* game;
@property (strong, nonatomic)GCDAsyncSocket* socket;
@property (strong, nonatomic)NSString* responseString;
@property (nonatomic)BOOL loggedIn;
-(BOOL)createConnection;
+(GameState*)sharedInstance;
-(void)lockInUser;
-(void)updateUI;
@end
