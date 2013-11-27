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

    it(@"removes and returns the first element of the array", ^{
        [[[mutableArray shift] should] equal:@1];
        [[mutableArray should] equal:@[ @2, @3, @7, @8, @9 ]];
    });

    it(@"removes and returns first two elements of the array", ^{
        [[[mutableArray shift:2] should] equal:@[ @2, @3 ]];
        [[mutableArray should] equal:@[ @7, @8, @9 ]];
    });

    it(@"returns empty array and don't change original mutable array", ^{
        [[[mutableArray shift:0] should] equal:@[]];
        [[mutableArray should] equal:@[ @7, @8, @9 ]];
    });
    
    it(@"creates subset of array by removing the last object", ^{
        [[[mutableArray keepIf:^BOOL(id object) {
            return (![object isEqual: @9]);
        }] should] equal:@[ @7, @8 ]];
    });
    
    it(@"creates subset of array removing the first object", ^{
        [[[mutableArray keepIf:^BOOL(id object) {
            return (![object isEqual: @7]);
        }] should] equal:@[ @8 ]];
    });
    
});

SPEC_END
