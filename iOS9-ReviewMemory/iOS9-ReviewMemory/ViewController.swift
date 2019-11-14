//
//  ViewController.swift
//  iOS9-ReviewMemory
//
//  Created by Paul Solt on 11/14/19.
//  Copyright © 2019 Lambda, Inc. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

	override func viewDidLoad() {
		super.viewDidLoad()
		
		
		
		NSURL *baseURL = [NSURL URLWithString:@"https://www."];
		NSURLComponents *components = [NSURLComponents componentsWithURL:baseURL resolvingAgainstBaseURL:true];
		NSURLQueryItem *artistItem = [NSURLQueryItem queryItemWithName:@"s" value:name];
		components.queryItems = @[artistItem];
		
		NSURL *requestURL = components.URL;
		NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:requestURL];
		
		[[[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
			
			if (error) {
				NSLog(@"Error fetching artist: %@.", error);
				completion(nil);
				return;
			}
			
			if (!data) {
				NSLog(@"No data returned from data task");
				completion(nil);
				return;
			}
			
			error = nil;
			NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
			if (error) {
				NSLog(@"Error decoding JSON from data: %@", error);
				completion(nil);
				return;
			}
			
			if (!dictionary || ![dictionary isKindOfClass:[NSDictionary class]]) {
				NSLog(@"Error: Expected top level dictionary in JSON result: %@", error);
				completion(nil);
				return;
			}

	}


}

