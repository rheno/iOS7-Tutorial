//
//  HTTPRequest.h
//  Tutorial
//
//  Created by Rheno  Budiasa on 12/21/13.
//  Copyright (c) 2013 Rheno Budiasa. All rights reserved.

//  Class for HTTPRequest

#import <Foundation/Foundation.h>

#import "HTTPRequestDelegate.h"



@interface HTTPRequest : NSObject

-(id)init;

//initilize method with delegate

-(id)initWithHTTPRequest:(id<HTTPRequestDelegate>)delegate;

//Instance Method

+(HTTPRequest*)httpRequest:(id<HTTPRequestDelegate>)delegate;

@end
