//
//  HTTPRequestDelegate.h
//  Tutorial
//
//  Created by Rheno  Budiasa on 12/21/13.
//  Copyright (c) 2013 Rheno Budiasa. All rights reserved.
//

#import <Foundation/Foundation.h>


//HTTPRequestDelegate

@protocol HTTPRequestDelegate <NSObject>

//Method for get Object Values (Dictionary) from request

-(void)theObjectValues:(NSDictionary*) dictionary;

@end
