//
//  NSNumber+Rubyfy.h
//  Domainchy
//
//  Created by Marin Usalj on 11/15/12.
//  Copyright (c) 2012 mneorr.com | @mneorr | mneorr@gmail.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSNumber (ObjectiveSugar)

- (void)times:(void(^)(void))block;
- (void)timesWithIndex:(void(^)(NSUInteger index))block;

- (void)upto:(int)number do:(void(^)(NSInteger number))block;
- (void)downto:(int)number do:(void(^)(NSInteger number))block;

// Numeric inflections
- (NSNumber *)seconds;
- (NSNumber *)minutes;
- (NSNumber *)hours;
- (NSNumber *)days;
- (NSNumber *)weeks;
- (NSNumber *)fortnights;
- (NSNumber *)months;
- (NSNumber *)years;

// There are singular aliases for the above methods
- (NSNumber *)second;
- (NSNumber *)minute;
- (NSNumber *)hour;
- (NSNumber *)day;
- (NSNumber *)week;
- (NSNumber *)fortnight;
- (NSNumber *)month;
- (NSNumber *)year;

- (NSDate *)ago;
- (NSDate *)ago:(NSDate *)time;
- (NSDate *)since:(NSDate *)time;
- (NSDate *)until:(NSDate *)time;
- (NSDate *)fromNow;

@end
