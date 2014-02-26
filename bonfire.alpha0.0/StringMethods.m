//
//  StringMethods.m
//  bonfire.alpha0.0
//
//  Created by CamHart on 11/4/13.
//  Copyright (c) 2013 CamHart. All rights reserved.
//

#import "StringMethods.h"

@implementation StringMethods
+(BOOL)contains:(NSString *)source andSearch:(NSString *)search{
    if([source rangeOfString:search].location == NSNotFound) {
        return NO;
    }
    return YES;
}

+(NSInteger)find:(NSString *)source andSearch:(NSString *)search{
    NSUInteger ret = [source rangeOfString:search].location;
    if(ret == NSNotFound)
        return -1;
    return ret;
}

+(NSString*)trimBeginning:(NSString *)str{
    NSRange range = [str rangeOfCharacterFromSet:[NSCharacterSet whitespaceAndNewlineCharacterSet] options:NSAnchoredSearch];
    if(range.location == NSNotFound) {
        return nil;
    } else {
        return [str substringFromIndex:range.location];
    }
}
@end
