//
//  ViewController.m
//  Tutorial
//
//  Created by Rheno  Budiasa on 12/15/13.
//  Copyright (c) 2013 Rheno Budiasa. All rights reserved.
//

#import "ViewController.h"
#import "HTTPRequest.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [HTTPRequest httpRequest:self];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)theObjectValues:(NSDictionary *)dictionary{
    NSLog(@"results : %@",[dictionary objectForKey:@"[KEY]"]);
}

@end
