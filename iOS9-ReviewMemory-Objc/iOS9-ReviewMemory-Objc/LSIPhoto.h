//
//  LSIPhoto.h
//  iOS9-ReviewMemory-Objc
//
//  Created by Paul Solt on 11/14/19.
//  Copyright © 2019 Lambda, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LSIPhoto : NSObject

@property NSString *explanation;
@property NSString *title;
@property NSString *hdURL;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END
