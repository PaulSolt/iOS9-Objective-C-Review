//
//  ViewController.m
//  iOS9-ReviewMemory-Objc
//
//  Created by Paul Solt on 11/14/19.
//  Copyright © 2019 Lambda, Inc. All rights reserved.
//

#import "ViewController.h"
#import "LSIPhoto.h"

@interface ViewController ()

@property NSMutableArray *apodArray;

@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];

	_apodArray = [[NSMutableArray alloc] init];
	
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"November-APOD" ofType:@"json"];
	NSData *jsonData = [NSData dataWithContentsOfFile:filePath];
	NSError *error = nil;
	NSArray *photoArray = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:&error];
	
	if (error) {
		NSLog(@"Error: %@", error);
	}
	
	NSLog(@"APOD: %@", photoArray);
	
	// Loop through each dictionary
		// Create an object
		// Store in an array
	
	for (NSDictionary *photoDictionary in photoArray) {
		
		LSIPhoto *photo = [[LSIPhoto alloc] initWithDictionary:photoDictionary];
		
		// store the data
		[self.apodArray addObject:photo];
	}
	
	NSLog(@"Photos: %@", self.apodArray);
}


@end
