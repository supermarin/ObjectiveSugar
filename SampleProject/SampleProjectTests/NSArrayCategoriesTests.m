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

SPEC_BEGIN(ArrayAdditions)

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
            NSMutableArray *duplicate = [sampleArray mutableCopy];
            
            [sampleArray eachWithIndex:^(id object, int index) {
                [[object should] equal:[sampleArray objectAtIndex:index]];
                [duplicate removeObject:object];
            }];
            [[duplicate should] beEmpty];
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
            [[[sampleArray takeWhile:^BOOL(id object) {
                
                return ![object isEqualToString:@"third"];
                
            }] should] equal:@[ @"first", @"second" ]];
        });
        
    });
    
});


describe(@"Set operations", ^{
    
    NSArray *a = @[ @1, @2 ];
    NSArray *b = @[ @2, @3 ];
    
    it(@"return the elements common to both arrays ", ^{
        [[[a intersectionWithArray:b] should] equal:@[ @2 ]];
    });
    
    it(@"combine the two arrays, removing duplicate elements", ^{
        [[[a unionWithArray:b] should] equal:@[ @1, @2, @3 ]];
    });
    
    it(@"return the elements in a that are not in b", ^{
        [[[a relativeComplement:b] should] equal:@[ @1 ]];
    });
    
    it(@"return the elements in b that are not in a", ^{
        [[[b relativeComplement:a] should] equal:@[ @3 ]];
    });
    
    it(@"return the elements unique to both arrays", ^{
        [[[a symmetricDifference:b] should] equal:@[ @1, @3 ]];
    });
});


SPEC_END


