//
//  SocketDelegate.m
//  bonfire.alpha0.0
//
//  Created by CamHart on 11/1/13.
//  Copyright (c) 2013 CamHart. All rights reserved.
//

#import "SocketDelegate.h"
#import "GameState.h"
#import "StringMethods.h"
#import "Utilities.h"

@interface SocketDelegate()
@property (strong, nonatomic)NSMutableString* cache;
//@property (strong, nonatomic)Game* game;
@end

@implementation SocketDelegate

//-(instancetype) initWithGame:(Game*)game {
-(instancetype) init{
    self = [super init];
    if(self) {
        self.cache = [[NSMutableString alloc] init];
        //self.game = game;
    }
    return self;
}

- (void)socket:(GCDAsyncSocket *)sock didConnectToHost:(NSString *)host port:(uint16_t)port {
    NSLog(@"Connected to host!!!");
}

- (void)socketDidDisconnect:(GCDAsyncSocket *)sock withError:(NSError *)err {
    NSLog(@"Disconnected...%@", err);
}

-(NSString*)getCompleteMessage {
    NSUInteger pos = [StringMethods find:self.cache andSearch:@"\r\n\r\n"];
    //NSLog(self.cache);
    if((int)pos > -1) {
        //NSLog([NSString stringWithFormat:@"pos:%d",pos]);
        NSString* msg = [self.cache substringToIndex:pos];
//        pos += 8;
        self.cache = [NSMutableString stringWithString:[self.cache substringFromIndex:pos + 4]];
        //NSLog([NSString stringWithFormat:@"self.cache=|%@| (%d)", self.cache, [self.cache length]]);
        return msg;
    }
    //NSLog([NSString stringWithFormat:@"pos %d", pos]);
    return nil;
}

- (void)socket:(GCDAsyncSocket *)sock didReadData:(NSData *)data withTag:(long)tag {

    [self.cache appendString:[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]];
    NSLog(self.cache);
    NSLog(@"didReadData!");
    //NSString* temp = [NSString stringWithString:self.cache];
    NSString* completeMessage = [self getCompleteMessage];
    if(completeMessage != nil) {
        NSLog(@"complete message...");
        [[[GameState sharedInstance] game] setCurrentLabel:[self.cache stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]]];

        NSUInteger posResponse = [StringMethods find:completeMessage andSearch:@"RESPONSE"];
        //NSUInteger posSuccess = [StringMethods find:completeMessage andSearch:@"SUCCESS"];
        NSUInteger posError = [StringMethods find:completeMessage andSearch:@"Error"];
        //NSUInteger posRealTime = [StringMethods find:completeMessage andSearch:@"REALTIME"];
        if((int)posResponse > -1) {
            [self parseRequest:completeMessage];
            [Utilities hideActivityIndicator];
        }
        if((int)posError > -1) {
            //uialert
            NSLog([NSString stringWithFormat:@"%d", posError]);
            [Utilities showAlert:[completeMessage substringFromIndex:posError] andTitle:@"Error"];
        }
        
        //[self.cache setString:@""];
    } else {
        NSLog(@"incomplete message...");
        NSLog(self.cache);
    }
    [sock readDataWithTimeout:-1 tag:0];
}


-(void)parseRequest:(NSString*)msg {
    NSArray* lines = [msg componentsSeparatedByString:@"\n"];
    NSMutableArray* dic = [[NSMutableArray alloc] init];
    //NSArray* protocols = [NSArray arrayWithObjects:@"CREATEUSER", @"LOGINUSER", nil];
    for(int c = 0; c < (int)[lines count]; c++) {
        NSArray* words = [[lines objectAtIndex:c] componentsSeparatedByString:@" "];
        [dic addObject:words];
        //[dic setValue:[lines objectAtIndex:t] forKey:[NSString stringWithFormat:@"%d", t]];
    }
    
    NSString* word_0 =[[dic objectAtIndex:0] objectAtIndex:0 ];
    //[[dic objectAtIndex:0] objectAtIndex:0];
    if([word_0 isEqualToString:@"RESPONSE"]) {
        NSLog(@"RESPONSE_");
        word_0 = [[dic objectAtIndex:0] objectAtIndex:1];
        
        
        if([word_0 isEqualToString:@"CREATEUSER"]) {
            NSLog(@"CREATEUSER");
        } else if([word_0 isEqualToString:@"LOGINUSER"]) {
            NSLog(@"LOGINUSER_");
            word_0 = [[dic objectAtIndex:1] objectAtIndex:0];
            NSLog([NSString stringWithFormat:@"'%@'", word_0]);
            if([word_0 isEqualToString:@"Valid"]) {
                [[GameState sharedInstance] lockInUser];
                [[GameState sharedInstance] updateUI];
            }
            //else {
                //[Utilities showAlert:[NSString stringWithFormat:@"Couldn't login %@", word_0] andTitle:@"Speghettios..."];
            //}
        } else if([word_0 isEqualToString:@"JOINGAME"]) {
            NSLog(@"JOINGAME");
        } else {
            NSLog(@"Unimplemented");
            NSLog(word_0);
        }
    } else if([word_0 isEqualToString:@"REALTIME"]) {
        NSLog(@"REALTIME");
    }
}
@end
