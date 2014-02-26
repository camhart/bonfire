//
//  Sendable.h
//  bonfire.alpha0.0
//
//  Created by CamHart on 11/3/13.
//  Copyright (c) 2013 CamHart. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol Sendable <NSObject>
@required
-(NSString*)getSendableData;
@end
