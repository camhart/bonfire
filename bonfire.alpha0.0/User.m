//
//  User.m
//  bonfire.alpha0.0
//
//  Created by CamHart on 11/1/13.
//  Copyright (c) 2013 CamHart. All rights reserved.
//

#import "User.h"

@interface User()
@property (strong, nonatomic) NSMutableDictionary* answers;
@end

@implementation User


-(instancetype) init:(NSString*)userName andId:(NSUInteger)userId{
    self = [super init];
    if(self) {
        self.username = userName;
        self.id = userId;
        self.answers = [[NSMutableDictionary alloc] init];
    }
    return self;
}

-(void) addAnswer:(Answer *)answer{
    [self.answers setObject:answer forKey:[NSNumber numberWithInteger:answer.questionId]];
}
@end
