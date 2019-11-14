//
//  ViewController.m
//  iOS9-ReviewMemory-Objc
//
//  Created by Paul Solt on 11/14/19.
//  Copyright © 2019 Lambda, Inc. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];

    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"November-APOD" ofType:@"json"];
    NSString *json = [NSString stringWithContentsOfFile:filePath
													 encoding:NSUTF8StringEncoding
														error:nil];

	// Loop through each dictionary
		// Create an object
		// Store in an array
}


@end
