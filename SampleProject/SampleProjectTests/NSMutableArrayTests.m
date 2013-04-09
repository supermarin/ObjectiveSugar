//
//  NSMutableArrayTests.m
//  SampleProject
//
//  Created by Marin Usalj on 11/23/12.
//  Copyright (c) 2012 @mneorr | mneorr.com. All rights reserved.
//

#import "ObjectiveSugar.h"
#import "Kiwi.h"

SPEC_BEGIN(MutableArrayAdditions)

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
    
    it(@"aliases addObjectsFromArray:", ^{
        [mutableArray concat:@[ @7, @8, @9 ]];
        [[mutableArray should] equal:@[ @1, @2, @3, @7, @8, @9 ]];
    });
    
});

SPEC_END
