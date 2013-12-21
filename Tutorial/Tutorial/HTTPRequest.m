//
//  HTTPRequest.m
//  Tutorial
//
//  Created by Rheno  Budiasa on 12/21/13.
//  Copyright (c) 2013 Rheno Budiasa. All rights reserved.
//

#import "HTTPRequest.h"

@implementation HTTPRequest

-(id)init{
    self = [super init];
    if(self){
        
    }
    return self;
}

+(HTTPRequest *)httpRequest:(id<HTTPRequestDelegate>)delegate{
    return [[HTTPRequest alloc] initWithHTTPRequest:delegate];
}



-(id)initWithHTTPRequest:(id<HTTPRequestDelegate>)delegate{

    if(self = [super init]){
        [self sendRequestUrl:@"[THE_URL]" param:@"[KEY] = [VALUE]" delegate:delegate];
    }
    return self;
}

-(void)sendRequestUrl:(NSString*)urls param:(NSString*)par delegate:(id<HTTPRequestDelegate>)requestDelegate{
    NSOperationQueue *mainQueue = [[NSOperationQueue alloc] init];
    [mainQueue setMaxConcurrentOperationCount:5];
    
    NSURL *url = [NSURL URLWithString:urls];
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
    
    [request setHTTPMethod:@"POST"];
    [request setAllHTTPHeaderFields:@{@"Accepts-Encoding": @"gzip", @"Accept": @"application/json"}];
    
    //NSString *myString = [NSString stringWithFormat:par];
    [request setHTTPBody:[par dataUsingEncoding:NSUTF8StringEncoding]];
    
    
    [NSURLConnection sendAsynchronousRequest:request queue:mainQueue completionHandler:^(NSURLResponse *response, NSData *responseData, NSError *error) {
        NSHTTPURLResponse *urlResponse = (NSHTTPURLResponse *)response;
        if (!error) {
            /*
             NSLog(@"Status Code: %li %@", (long)urlResponse.statusCode, [NSHTTPURLResponse localizedStringForStatusCode:urlResponse.statusCode]);
             NSLog(@"Response Body: %@", [[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding]);
             
             */
            //            NSLog(@"Response Body: %@", [[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding]);
            NSDictionary *results = [NSJSONSerialization JSONObjectWithData:responseData options:NSJSONReadingMutableContainers error:nil];
            //NSLog(@"liat %@",[results objectForKey:@"message"]);
            [requestDelegate theObjectValues:results];
            
        }
        else {
            
            NSLog(@"An error occured, Status Code: %i", urlResponse.statusCode);
            NSLog(@"Description: %@", [error localizedDescription]);
            NSLog(@"Response Body: %@", [[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding]);
        }
    }];
}



@end
