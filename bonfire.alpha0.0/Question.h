//
//  Question.h
//  bonfire.alpha0.0
//
//  Created by CamHart on 11/1/13.
//  Copyright (c) 2013 CamHart. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Answer.h"
#import "Sendable.h"

@interface Question : NSObject <Sendable>
@property (strong, nonatomic) NSString* question;
@property (nonatomic) NSInteger questionId;
@property (strong, nonatomic, readonly) NSMutableArray* answers; //array of answers for this question
-(void) addAnswer:(Answer*)answer;
@end
