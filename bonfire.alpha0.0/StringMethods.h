//
//  StringMethods.h
//  bonfire.alpha0.0
//
//  Created by CamHart on 11/4/13.
//  Copyright (c) 2013 CamHart. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface StringMethods : NSObject
+(BOOL)contains:(NSString*)source andSearch:(NSString*)search;
+(NSInteger)find:(NSString*)source andSearch:(NSString*)search;
+(NSString*)trimBeginning:(NSString*)str;
@end
