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

SPEC_BEGIN(SetAdditions)

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
        
        it(@"-first does not crash if there's no objects in set", ^{
            KWBlock *block = [[KWBlock alloc] initWithBlock:^{
                NSSet *empty = [NSSet set];
                [empty.first description];
            }];
            [[block shouldNot] raise];
        });

        it(@"-last returns the last object", ^{
            [[sampleSet.last should] equal:sampleSet.allObjects.lastObject];
        });
        
    });
    
    context(@"map", ^{
        
        NSSet *sampleSet = [NSSet setWithObjects:@"first", @"second", @"third", nil];
        NSSet *cars = [NSSet setWithObjects:@"Testarossa", @"F50", @"F458 Italia", nil];
        
        it(@"returns an array of objects returned by the block", ^{
            [[[sampleSet map:^id(id object) {
                return [NSNumber numberWithBool:[object isEqualToString:@"third"]];
            }] should] equal:@[ @(NO), @(YES), @(NO) ]]; // Order of NSSet is not guaranteed
            
            [[[cars map:^id(id car){
                return @([[car substringToIndex:1] isEqualToString:@"F"]);
            }] should] equal:@[ @(YES), @(YES), @(NO) ]]; // Order of NSSet is not guaranteed
        });
        
    });
    
});

SPEC_END
