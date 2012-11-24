//
//  NSSetTests.m
//  SampleProject
//
//  Created by Marin Usalj on 11/23/12.
//  Copyright (c) 2012 @mneorr | mneorr.com. All rights reserved.
//

#import "NSSetTests.h"
#import "Kiwi.h"
#import "NSSet+Accessors.h"

@implementation NSSetTests
@end

SPEC_BEGIN(Rubyfy)

describe(@"Iterators", ^{
   
    NSSet *sampleSet = [NSSet setWithObjects:@"first", @"second", @"third", nil];
    
    
    context(@"Iterating using block", ^{
        
        it(@"iterates using -each:^", ^{
            NSMutableArray *duplicate = [sampleSet.allObjects mutableCopy];
            
            [sampleSet each:^(id object) {
                [[duplicate should] contain:object];
                [duplicate removeObject:object];
            }];
            [[duplicate should] beEmpty];
        });
        
        it(@"iterates using -eachWithIndex:^", ^{
            NSMutableArray *duplicate = [sampleSet.allObjects mutableCopy];
            
            [sampleSet eachWithIndex:^(id object, int index) {
                [[object should] equal:sampleSet.allObjects[index]];
                [duplicate removeObject:object];
            }];
            [[duplicate should] beEmpty];
        });
        
    });
    
    context(@"first, last", ^{
       
        it(@"-first returns object at index 0", ^{
            [[sampleSet.first should] equal:sampleSet.allObjects[0]];
        });

        it(@"-last returns the last object", ^{
            [[sampleSet.last should] equal:sampleSet.allObjects.lastObject];
        });
        
    });
    
});

SPEC_END
