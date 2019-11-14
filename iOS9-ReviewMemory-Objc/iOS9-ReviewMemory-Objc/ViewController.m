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

	// Leaking memory
//	for (NSDictionary *photoDictionary in photoArray) {
//		LSIPhoto *photo = [[LSIPhoto alloc] initWithDictionary:photoDictionary]; // photo: 1
//
//		// store the data
//		[self.apodArray addObject:photo]; // photo: 2
//	}
	// Autorelease handoff
//	for (NSDictionary *photoDictionary in photoArray) {
//		LSIPhoto *photo = [[[LSIPhoto alloc] initWithDictionary:photoDictionary] autorelease]; // photo: ~1
//
//		// store the data
//		[self.apodArray addObject:photo]; // photo: 1
//	}
	
	// Use release to handoff ownership directly
	for (NSDictionary *photoDictionary in photoArray) {
		LSIPhoto *photo = [[LSIPhoto alloc] initWithDictionary:photoDictionary]; // photo: 1
		
		// store the data
		[self.apodArray addObject:photo]; // photo: 2
		[photo release]; // photo: 1
	}
	NSLog(@"Photos: %@", self.apodArray);
	
	
	/// Force a cleanup
	
	[self.apodArray release]; // releasing an array will release each reference count for an object stored
//	self.apodArray = nil;
	
	// there's no reference to our original data, but the memory is somewhere
	
}

- (void)dealloc {
	[self.apodArray release];
	self.apodArray = nil;
	
	[super dealloc];
}

@end
