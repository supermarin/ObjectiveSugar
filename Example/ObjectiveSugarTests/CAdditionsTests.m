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
        it(@"executes the body", ^{
            unless(NO) {
                wasExecuted = YES;
            }
            [[@(wasExecuted) should] beYes];
        });
        it(@"works with inline conditions", ^{
            unless((1 == 4)) {
                wasExecuted = YES;
            }
            [[@(wasExecuted) should] beYes];
        });
        it(@"works with inline conditions without extra parenthesies", ^{
            unless(1 == 4) {
                wasExecuted = YES;
            }
            [[@(wasExecuted) should] beYes];
        });
		it(@"works with the comma operator", ^{
			int i = 1;
			unless(i++, 1 == 4) {
				wasExecuted = YES;
			}
			[[@(i) should] equal:@2];
			[[@(wasExecuted) should] beYes];
		});
    });
    
    context(@"condition is true", ^{
        it(@"doesn't execute the body", ^{
            unless(YES) {
                [[@(YES) should] beNo];
            }
        });
    });
});

describe(@"until", ^{
	__block int condCount;
	__block int bodyCount;
	
	beforeEach(^{
		condCount = 0;
		bodyCount = 0;
	});
	
	context(@"In an until loop", ^{
		context(@"condition is true", ^{
			it(@"evaluates the condition once", ^{
				int i = 1;
				until(--i == 0) {
					[[@(YES) should] beNo];
				}
				[[@(i) should] equal:@0];
			});
			it(@"doesn't execute the body", ^{
				until(YES) {
					[[@(YES) should] beNo];
				}
			});
			it(@"works with the comma operator", ^{
				BOOL didEval = NO;
				until(didEval = YES, YES) {
					[[@(YES) should] beNo];
				}
				[[@(didEval) should] beYes];
			});
		});
		
		context(@"condition starts false and later changes to true", ^{
			it(@"evaluates the condition one fewer time than the body", ^{
				int iterations = 10;
				until(condCount++, iterations == 0) {
					bodyCount++;
					iterations--;
				}
				[[@(iterations) should] equal:@0];
				[[@(bodyCount) should] equal:@10];
				[[@(condCount) should] equal:@(bodyCount + 1)];
			});
			it(@"allows early breaking out of the loop", ^{
				until(condCount++, bodyCount == 100) {
					bodyCount++;
					unless(bodyCount < 50)
					break;
				}
				[[@(bodyCount) should] equal:@50];
				[[@(condCount) should] equal:@(bodyCount)];
			});
		});
	});
	
	context(@"In a do-until loop", ^{
		context(@"condition is true", ^{
			it(@"both evaluates the condition and executes the body exactly once", ^{
				do {
					bodyCount++;
				} until(condCount++, YES);
				[[@(bodyCount) should] equal:@1];
				[[@(condCount) should] equal:@(bodyCount)];
			});
			it(@"allows breaking out of the loop without ever evaluating the condition", ^{
				do {
					bodyCount++;
					break;
				} until(condCount++, YES);
				[[@(bodyCount) should] equal:@1];
				[[@(condCount) should] equal:@0];
			});
		});
		
		context(@"condition starts false and later changes to true", ^{
			it(@"evaluates the condition and the body the same number of times", ^{
				int iterations = 10;
				do {
					bodyCount++;
					iterations--;
				} until(condCount++, iterations == 0);
				[[@(iterations) should] equal:@0];
				[[@(bodyCount) should] equal:@10];
				[[@(condCount) should] equal:@(bodyCount)];
			});
			it(@"allows breaking out of the loop early without evaluating the condition again", ^{
				do {
					bodyCount++;
					if(bodyCount == 50)
						break;
				} until(condCount++, bodyCount == 100);
				[[@(bodyCount) should] equal:@50];
				[[@(condCount) should] equal:@(bodyCount - 1)];
			});
			it(@"allows continuing to next loop iteration", ^{
				int a = 2, b = 3;
				do {
					bodyCount++;
					a++;
					unless(a - b >= 4)
					continue;
					b += a;
				} until(condCount++, a == 13);
				[[@(a) should] equal:@13];
				[[@(b) should] equal:@10];
				[[@(bodyCount) should] equal:@11];
				[[@(condCount) should] equal:@(bodyCount)];
			});
		});
		
		context(@"condition is always false", ^{
			it(@"allows breaking out of the loop to avoid an infinite loop", ^{
				do {
					bodyCount++;
					unless(bodyCount < 42)
					break;
				} until(condCount++, NO);
				[[@(bodyCount) should] equal:@42];
				[[@(condCount) should] equal:@(bodyCount - 1)];
			});
		});
	});
});

SPEC_END
