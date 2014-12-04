//
//  NSMutableArrayTests.m
//  SampleProject
//
//  Created by Marin Usalj on 11/23/12.
//  Copyright (c) 2012 @supermarin | supermar.in. All rights reserved.
//

#import "ObjectiveSugar.h"
#import "Kiwi.h"

SPEC_BEGIN(MutableArrayAdditions)

describe(@"NSMutableArray categories", ^{

    let(mutableArray, ^{ return [NSMutableArray arrayWithObjects:@1, @2, @3, @4, @5, nil]; });

    it(@"-push aliases addObject", ^{
        [mutableArray push:@6];
        [[mutableArray should] equal:@[ @1, @2, @3, @4, @5, @6 ]];
    });

    it(@"-pop removes and returns the last element of the array", ^{
        [[[mutableArray pop] should] equal:@5];
        [[mutableArray should] equal:@[ @1, @2, @3, @4 ]];
    });

    it(@"-pop with parameter removes and returns the last n elements of the array", ^{
        [[[mutableArray pop:2] should] equal:@[ @4, @5 ]];
        [[mutableArray should] equal:@[ @1, @2, @3 ]];
    });

    it(@"-concat aliases addObjectsFromArray:", ^{
        [mutableArray concat:@[ @7, @8, @9 ]];
        [[mutableArray should] equal:@[ @1, @2, @3, @4, @5, @7, @8, @9 ]];
    });

    it(@"-shift removes and returns the first element of the array", ^{
        [[[mutableArray shift] should] equal:@1];
        [[mutableArray should] equal:@[ @2, @3, @4, @5 ]];
    });

    it(@"-shift with parameter removes and returns n elements of the array", ^{
        [[[mutableArray shift:2] should] equal:@[ @1, @2 ]];
        [[mutableArray should] equal:@[ @3, @4, @5 ]];
    });

    it(@"-shift with 0 returns an empty array and doesn't change original mutable array", ^{
        [[[mutableArray shift:0] should] equal:@[]];
        [[mutableArray should] equal:@[ @1, @2, @3, @4, @5 ]];
    });

    it(@"-keepIf keeps the objects passing the block", ^{
        NSMutableArray *array = @[@8, @5, @9, @1, @7, @14, @17, @87, @64].mutableCopy;

        [array keepIf:^BOOL(id object) {
            return [object intValue] % 2 == 0;
        }];

        [[array should] equal:@[ @8, @14, @64 ]];
    });

});

SPEC_END
