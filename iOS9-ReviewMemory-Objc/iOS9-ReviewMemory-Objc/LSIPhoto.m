//
//  LSIPhoto.m
//  iOS9-ReviewMemory-Objc
//
//  Created by Paul Solt on 11/14/19.
//  Copyright © 2019 Lambda, Inc. All rights reserved.
//

#import "LSIPhoto.h"

@implementation LSIPhoto

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
	if (self = [super init]) {
		
		_title = dictionary[@"title"];
		_explanation = dictionary[@"explanation"];
		_hdURL = dictionary[@"hdurl"];
		
	}
	return self;
	
}

- (NSString *)description {
	return [NSString stringWithFormat:@"%@", self.title];
}

@end
