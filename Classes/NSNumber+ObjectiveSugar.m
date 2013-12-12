//
//  NSNumber+Rubyfy.m
//  Domainchy
//
//  Created by Marin Usalj on 11/15/12.
//  Copyright (c) 2012 mneorr.com | @mneorr | mneorr@gmail.com. All rights reserved.
//

#import "NSNumber+ObjectiveSugar.h"

@implementation NSNumber (ObjectiveSugar)

- (void)times:(void (^)(void))block {
    for (int i = 0; i < self.integerValue; i++)
        block();
}

- (void)timesWithIndex:(void (^)(NSUInteger))block {
    for (int i = 0; i < self.unsignedIntegerValue; i++)
        block(i);
}

- (void)upto:(int)number do:(void (^)(NSInteger))block {
    for (NSInteger i = self.integerValue; i <= number; i++)
        block(i);
}

- (void)downto:(int)number do:(void (^)(NSInteger))block {
    for (NSInteger i = self.integerValue; i >= number; i--)
        block(i);
}

- (NSNumber *)second {
    return self.seconds;
}

- (NSNumber *)seconds {
    return self;
}

- (NSNumber *)minute {
    return self.minutes;
}

- (NSNumber *)minutes {
    return @(self.floatValue * 60);
}

- (NSNumber *)hour {
    return self.hours;
}

- (NSNumber *)hours {
    return @(self.floatValue * [@60 minutes].integerValue);
}

- (NSNumber *)day {
    return self.days;
}

- (NSNumber *)days {
    return @(self.floatValue * [@24 hours].integerValue);
}

- (NSNumber *)week {
    return self.weeks;
}

- (NSNumber *)weeks {
    return @(self.floatValue * [@7 days].integerValue);
}

- (NSNumber *)fortnight {
    return self.fortnights;
}

- (NSNumber *)fortnights {
    return @(self.floatValue * [@2 weeks].integerValue);
}

- (NSNumber *)month {
    return self.months;
}

- (NSNumber *)months {
    return @(self.floatValue * [@30 days].integerValue);
}

- (NSNumber *)year {
    return self.years;
}

- (NSNumber *)years {
    return @(self.floatValue * [@(365.25) days].integerValue);
}

- (NSDate *)ago {
    return [self ago:[NSDate date]];
}

- (NSDate *)ago:(NSDate *)time {
    return [NSDate dateWithTimeIntervalSince1970:([time timeIntervalSince1970] - self.floatValue)];
}

- (NSDate *)since:(NSDate *)time {
    return [NSDate dateWithTimeIntervalSince1970:([time timeIntervalSince1970] + self.floatValue)];
}

- (NSDate *)until:(NSDate *)time {
    return [self ago:time];
}

- (NSDate *)fromNow {
    return [self since:[NSDate date]];
}

@end
