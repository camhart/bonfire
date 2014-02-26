//
//  GameState.m
//  bonfire.alpha0.0
//
//  Created by CamHart on 11/3/13.
//  Copyright (c) 2013 CamHart. All rights reserved.
//

#import "GameState.h"
#import "SocketDelegate.h"
#import "Utilities.h"

@interface GameState()
@property (strong, nonatomic)SocketDelegate* sDelegate;

@end

@implementation GameState

-(instancetype)init{
    self = [super init];
    if(self) {
        self.game = [[Game alloc] init];
        self.sDelegate = [[SocketDelegate alloc] init];
        self.socket = [[GCDAsyncSocket alloc] initWithDelegate:self.sDelegate delegateQueue:dispatch_get_main_queue()];
    }
    return self;
}

-(void)lockInUser{
    self.loggedIn = YES;
}

-(void)updateUI {
    UIViewController* cont = [Utilities getRootViewController];
    if([cont conformsToProtocol:@protocol(UIUpdater)]) {
        dispatch_async(dispatch_get_main_queue(), ^{
            UIViewController <UIUpdater> *uiu = (UIViewController <UIUpdater>*)cont;
            [uiu updateUI];
        });
    }
}

+(GameState*)sharedInstance {
    static GameState* instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[GameState alloc] init];
        [instance initVars];
    });
    return instance;
}

-(void)initVars{
    self.game = [[Game alloc] init];
    //    [self.game addObserver:self forKeyPath:@"curLabel" options:NSKeyValueObservingOptionNew context:NULL];
    self.sDelegate = [[SocketDelegate alloc] init];
    self.socket = [[GCDAsyncSocket alloc] initWithDelegate:self.sDelegate delegateQueue:dispatch_get_main_queue()];
}

-(BOOL)createConnection {
    NSError *err = nil;
    uint16_t thePort = 1234;

    if(![self.socket connectToHost:@"192.168.2.14" onPort:thePort error:&err]) {
        NSLog(@"Failed to connect %@", err);
        return NO;
    }
    [self.socket readDataWithTimeout:-1 tag:0];
    return YES;
}
@end
