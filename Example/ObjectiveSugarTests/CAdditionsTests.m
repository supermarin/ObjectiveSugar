//
//  CAdditionsTests.m
//  SampleProject
//
//  Created by Marin Usalj on 1/15/13.
//  Copyright 2013 @mneorr | mneorr.com. All rights reserved.
//

#import <Kiwi/Kiwi.h>
#import "ObjectiveSugar.h"

SPEC_BEGIN(c_additions_tests)

describe(@"unless", ^{
    __block BOOL wasExecuted;
    beforeEach(^{
        wasExecuted = NO;
    });
    
    context(@"condition is false", ^{
        it(@"runs the block", ^{
            unless(NO) {
                wasExecuted = YES;
            }
            [[@(wasExecuted) should] beYes];
        });
        it(@"Works with inline conditions", ^{
            unless((1 == 4)) {
                wasExecuted = YES;
            }
            [[@(wasExecuted) should] beYes];
        });
        it(@"Works with inline conditions without extra parenthesies", ^{
            unless(1 == 4) {
                wasExecuted = YES;
            }
            [[@(wasExecuted) should] beYes];
        });
    });
    
    context(@"condition is true", ^{
        it(@"doesn't run a block", ^{
            unless(YES) {
                [[@(YES) should] beNo];
            }
        });
    });
    
});

SPEC_END
