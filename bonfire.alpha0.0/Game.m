//
//  Game.m
//  bonfire.alpha0.0
//
//  Created by CamHart on 11/1/13.
//  Copyright (c) 2013 CamHart. All rights reserved.
//

#import "Game.h"
#import "ViewController.h"

@interface Game()
    @property (strong, nonatomic) NSMutableDictionary* questions;
    @property (strong, nonatomic, readonly) NSMutableDictionary* users;
    @property (nonatomic) NSUInteger currentQuestionId;
    @property (strong, nonatomic, getter = getCurrentLabel, setter = setCurrentLabel:) NSString* currentLabel;
@end


@implementation Game

@synthesize questionOpen = _questionOpen;
@synthesize questionCounterEndTime = _questionCounterEndTime;
@synthesize currentLabel = _currentLabel;

-(instancetype)init {
    self = [super init];
    if(self) {
        _questions = [[NSMutableDictionary alloc] init];
        _users = [[NSMutableDictionary alloc] init];
    }
    return self;
}

-(void)setCurrentLabel:(NSString *)newLabel{
    @synchronized(self) {
        //self.currentLabel =ƒ newLabel;
        //[self setCurLabel:newLabel];
        //[self setCurrentLabel:newLabel];
        _currentLabel = newLabel;
        
    }
    [self.curView updateUI];
    //updates gui
    //[self performSelectorOnMainThread:@selector(updateLabelText) withObject:NULL waitUntilDone:NO];
}

-(NSString *)getCurrentLabel{
    @synchronized(self) {
        return _currentLabel;
    }
}

-(void)setQuestionOpen:(BOOL)questionOpen {
    @synchronized(self) {
        self.questionOpen = questionOpen;
    }
}

-(void)setQuestionCounterEndTime:(long)questionCounterEndTime {
    @synchronized(self) {
        self.questionCounterEndTime = questionCounterEndTime;
    }
}

-(long)getQuestionCounterEndTime {
    @synchronized(self) {
        return self.questionCounterEndTime;
    }
}

-(BOOL)getQuestionState {
    @synchronized(self) {
        return self.questionOpen;
    }
}

-(void)addAnswer:(Answer *)answer{
    @synchronized(self) {
        Question* question = [self.questions objectForKey:[NSNumber numberWithInteger:answer.questionId]];
        [question addAnswer:answer];
        User* user = [self.users objectForKey:[NSNumber numberWithInteger:answer.userId]];
        [user addAnswer:answer];
    }
}

-(void) addUser:(User*)user {
    @synchronized(self) {
        
    }
}
-(void) addQuestion:(Question*)question {
    @synchronized(self) {
        
    }
}
-(void) closeCurrentQuestion {
    @synchronized(self) {
        
    }
}

//Getting values will be done when the GUI requests them
//-(NSMutableArray*) getAnswersForQuestion:(Question*) question;
-(NSMutableArray*) getAnswers {
    @synchronized(self) {
        return nil;
    }
} //for currentQuestion, return a list of Answer Objects
-(NSString*) getQuestion {
    @synchronized(self) {
        return nil;
    }
} //gets the current/last question
//-(NSMutableArray*) getAnswersForUser:(User*) user;
-(NSMutableArray*) getUsers {
    @synchronized(self) {
        return nil;
    }
}
//-(NSMutableArray*) getQuestions;
-(NSDictionary*) getGuessResults {
    @synchronized(self) {
        return nil;
    }
} //for current question

@end
