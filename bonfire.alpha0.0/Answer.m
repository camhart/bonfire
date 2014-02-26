//
//  Answer.m
//  bonfire.alpha0.0
//
//  Created by CamHart on 11/1/13.
//  Copyright (c) 2013 CamHart. All rights reserved.
//

#import "Answer.h"

@implementation Answer

-(instancetype)init {
    self = [super init];
//    if (self) {
//        
//    }
    return self;
}

-(instancetype) initWithQuestionId:(NSUInteger) questionId  andUserId:(NSUInteger)userId andAnswer:(NSInteger)answerVal {
    self = [super init];
    if(self) {
        //[self setUserId:userId];
        //[self setQuestionId:questionId];
        //[self setAnswer:answerVal];
        self.userId = userId;
        self.answer = answerVal;
        self.questionId = questionId;
    }
    return self;
}

@end
