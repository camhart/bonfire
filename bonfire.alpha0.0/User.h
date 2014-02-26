//
//  User.h
//  bonfire.alpha0.0
//
//  Created by CamHart on 11/1/13.
//  Copyright (c) 2013 CamHart. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Answer.h"
#import "Sendable.h"

@interface User : NSObject <Sendable>
@property (strong, nonatomic) NSString* username;
@property (nonatomic) NSUInteger id;
-(void)addAnswer:(Answer*)answer;
@end
