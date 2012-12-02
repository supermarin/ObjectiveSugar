//
//  NSNumberTests.m
//  SampleProject
//
//  Created by Marin Usalj on 11/21/12.
//  Copyright (c) 2012 @mneorr | mneorr.com. All rights reserved.
//

#import "ObjectiveSugar.h"
#import "Kiwi.h"

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

});

SPEC_END

