//
//  NSArrayCategoriesTests.m
//  SampleProject
//
//  Created by Marin Usalj on 7/13/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "NSArrayCategoriesTests.h"
#import "ObjectiveSugar.h"
#import "Kiwi.h"

SPEC_BEGIN(ArrayCategories)

describe(@"NSArray categories", ^{
    
    NSArray *sampleArray = [NSArray arrayWithObjects:@"first", @"second", @"third", nil];
    
    it(@"aliases -first to -objectAtIndex:0", ^{
        [[sampleArray.first should] equal:[sampleArray objectAtIndex:0]];
    });
    
    it(@"aliases -last to -lastObject", ^{
        [[sampleArray.last should] equal:[sampleArray lastObject]];        
    });
    
   
    context(@"Iterating using block", ^{
       
        it(@"iterates using -each:^", ^{
            NSMutableArray *duplicate = [sampleArray mutableCopy];
            
            [sampleArray each:^(id object) {
                [[duplicate should] contain:object];
                [duplicate removeObject:object];
            }];
            [[duplicate should] beEmpty];
        });
        
        it(@"iterates using -eachWithIndex:^", ^{
            [sampleArray eachWithIndex:^(id object, int index) {
                [[object should] equal:[sampleArray objectAtIndex:index]];
            }];
        });
        
    });
    
    it(@"alias -containsObject to -includes", ^{
        [[@([sampleArray includes:@"second"]) should] equal:@(YES)];
    });
    
    context(@"array subsets", ^{
    
        it(@"creates subset of array", ^{
            [[[sampleArray take:2] should] equal:@[ @"first", @"second" ]];
        });
        
        it(@"creates subset of array using block", ^{
            [[[sampleArray takeWith:^BOOL(id object) {
                return ![object isEqualToString:@"third"];
            }] should] equal:@[ @"first", @"second" ]];
        });
        
    });
    
});

describe(@"NSMutableArray categories", ^{
    
    NSMutableArray *mutableArray = [NSMutableArray arrayWithObjects:@1, @2, @3, @4, @5, nil];
    
    it(@"aliases addObject", ^{
        [mutableArray push:@6];
        [[mutableArray should] equal:@[ @1, @2, @3, @4, @5, @6 ]];
    });
    
    it(@"removes and returns the last element of the array", ^{
        [[[mutableArray pop] should] equal:@6];
        [[mutableArray should] equal:@[ @1, @2, @3, @4, @5 ]];
    });
    
    it(@"removes and returns the last two elements of the array", ^{
        [[[mutableArray pop:2] should] equal:@[ @4, @5 ]];
        [[mutableArray should] equal:@[ @1, @2, @3 ]];
    });
    
});

SPEC_END


