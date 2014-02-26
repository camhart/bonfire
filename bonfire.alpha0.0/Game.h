//
//  Game.h
//  bonfire.alpha0.0
//
//  Created by CamHart on 11/1/13.
//  Copyright (c) 2013 CamHart. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"
#import "Question.h"
#import "Answer.h"
#import "UIUpdater.h"
#import "Sendable.h"

@interface Game : NSObject
@property (strong, nonatomic)NSString* username;
@property (strong, nonatomic)NSString* password;
@property (nonatomic, getter=getQuestionState, setter = setQuestionState:) BOOL questionOpen;
@property (nonatomic, getter=getQuestionCounterEndTime, setter=setQuestionCounterEndTime:) long questionCounterEndTime; //-1 if no endtime
@property (strong, nonatomic) NSObject<UIUpdater>* curView;
//test

//Adding values will be done when the server sends data down to the client
-(void) addUser:(User*)user;
-(void) addQuestion:(Question*)question;
-(void) addAnswer:(Answer*)answer;
-(void) closeCurrentQuestion;

//
-(void) setQuestionCounterEndTime:(long)questionCounterEndTime;
-(void) setQuestionOpen:(BOOL)questionOpen;
-(BOOL) getQuestionState;
-(long) getQuestionCounterEndTime;
-(void) setCurrentLabel:(NSString *)newLabel;
-(NSString*) getCurrentLabel;

//Getting values will be done when the GUI requests them
//-(NSMutableArray*) getAnswersForQuestion:(Question*) question;
-(NSMutableArray*) getAnswers; //for currentQuestion, return a list of Answer Objects
-(NSString*) getQuestion; //gets the current/last question
//-(NSMutableArray*) getAnswersForUser:(User*) user;
-(NSMutableArray*) getUsers;
//-(NSMutableArray*) getQuestions;
-(NSDictionary*) getGuessResults; //for current question

@end
