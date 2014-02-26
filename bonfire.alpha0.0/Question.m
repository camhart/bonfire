//
//  Question.m
//  bonfire.alpha0.0
//
//  Created by CamHart on 11/1/13.
//  Copyright (c) 2013 CamHart. All rights reserved.
//

#import "Question.h"

@interface Question()
@property (strong, nonatomic) NSDictionary* highGuess; //map from user to high guess
@property (strong, nonatomic) NSDictionary* lowGuess; //map from user to low guess
@end

@implementation Question

-(instancetype)init:(NSString *)question andQuestionId:(NSUInteger) qId {
    self = [super init];
    if(self) {
        self.highGuess = [[NSDictionary alloc] init];
        self.lowGuess = [[NSDictionary alloc] init];
    }
    return self;
}

-(void) addAnswer:(Answer*)answer {
    [self.answers addObject:answer];
}

@end
