//
//  NSNumberTests.m
//  SampleProject
//
//  Created by Marin Usalj on 11/21/12.
//  Copyright (c) 2012 @mneorr | mneorr.com. All rights reserved.
//

#import "NSNumberTests.h"
#import "ObjectiveSugar.h"
#import "Kiwi.h"

@implementation NSNumberTests
@end


SPEC_BEGIN(NumberAdditions)

describe(@"Iterators", ^{
    
        __block int counter;

        beforeEach(^{
            counter = 0;
        });
       
        it(@"-upto iterates inclusively", ^{
            __block int startingPoint = 5;
            
            [@(startingPoint) upto:8 do:^(int number) {
                [[@(number) should] equal:@(startingPoint + counter)];
                counter ++;
            }];
            
            [[@(counter) should] equal:@(4)];
        });

        it(@"-downto iterates inclusively", ^{
            __block int startingPoint = 8;
            
            [@(startingPoint) downto:4 do:^(int number) {
                [[@(number) should] equal:@(startingPoint - counter)];
                counter ++;
            }];
            
            [[@(counter) should] equal:@(5)];
        });
    
    
        it(@"times: iterates the exact number of times", ^{
            [@5 times:^{
                counter ++;
            }];
            [[@(counter) should] equal:@5];
        });
    
        it(@"timesWithIndex: iterates with the right index", ^{
            [@5 timesWithIndex:^(int index) {
                [[@(index) should] equal:@(counter)];
                counter ++;
            }];
            [[@(counter) should] equal:@5];
        });
    
        it(@"tests singular date inflections", ^{
            [[[@1 second] should] equal:@1];
            [[[@1 minute] should] equal:@60];
            [[[@1 hour] should] equal:@3600];
            [[[@1 day] should] equal:@86400];
            [[[@1 week] should] equal:@604800];
            [[[@1 fortnight] should] equal:@1209600];
            [[[@1 month] should] equal:@2592000];
            [[[@1 year] should] equal:@31557600];
        });
        
        it(@"tests plural date inflections", ^{
            [[@(2).seconds should] equal:@2];
            [[@(2).minutes should] equal:@120];
            [[@(2).hours should] equal:@7200];
            [[@(2).days should] equal:@172800];
            [[@(2).weeks should] equal:@1209600];
            [[@(2).fortnights should] equal:@2419200];
            [[@(2).months should] equal:@5184000];
            [[@(2).years should] equal:@63115200];
        });
    
        it(@"tests ago inflection", ^{
            NSDate *testValue = @(30).seconds.ago;
            NSDate *compareValue = [NSDate dateWithTimeIntervalSinceNow:-30];
            
            [[@([@([testValue timeIntervalSince1970]) intValue]) should] equal:@([@([compareValue timeIntervalSince1970]) intValue])];
        });
        
        it(@"tests since inflection", ^{
            NSDate *now = [NSDate date];
            NSDate *testValue = [@(10).minutes since:now];
            NSDate *compareValue = [NSDate dateWithTimeInterval:600 sinceDate:now];
            
            [[@([@([testValue timeIntervalSince1970]) intValue]) should] equal:@([@([compareValue timeIntervalSince1970]) intValue])];
        });
        
        it(@"tests until inflection", ^{
            NSDate *now = [NSDate date];
            NSDate *testValue = [@(10).minutes until:now];
            NSDate *compareValue = [NSDate dateWithTimeInterval:-600 sinceDate:now];
            
            [[@([@([testValue timeIntervalSince1970]) intValue]) should] equal:@([@([compareValue timeIntervalSince1970]) intValue])];
        });
    
        it(@"tests from_now inflection", ^{
            NSDate *testValue = @(30).minutes.from_now;
            NSDate *compareValue = [NSDate dateWithTimeIntervalSinceNow:(30 * 60)];
            
            [[@([@([testValue timeIntervalSince1970]) intValue]) should] equal:@([@([compareValue timeIntervalSince1970]) intValue])];
        });

});

SPEC_END

