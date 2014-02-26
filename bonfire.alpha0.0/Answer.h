//
//  Answer.h
//  bonfire.alpha0.0
//
//  Created by CamHart on 11/1/13.
//  Copyright (c) 2013 CamHart. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Sendable.h"

@interface Answer : NSObject <Sendable>
@property (nonatomic) NSUInteger questionId;
@property (nonatomic) NSUInteger userId;
@property (nonatomic) NSInteger answer;
@end