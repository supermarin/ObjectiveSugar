//
//  NSDictionaryTests.m
//  SampleProject
//
//  Created by Marin Usalj on 11/23/12.
//  Copyright (c) 2012 @mneorr | mneorr.com. All rights reserved.
//

#import "NSDictionaryTests.h"
#import "Kiwi.h"
#import "NSDictionary+Rubyfy.h"

@implementation NSDictionaryTests
@end

SPEC_BEGIN(DictionaryAdditions)

describe(@"Iterators", ^{
    
    NSDictionary *sampleDict = @{
        @"one" : @1,
        @"two" : @2,
        @"three" : @3
    };
    __block int counter;
    
    beforeEach(^{
        counter = 0;
    });
    
    afterEach(^{
        [[@(counter) should] equal:@(sampleDict.allKeys.count)];
    });
    
    
    it(@"iterates each key and value", ^{
        [sampleDict each:^(id key, id value) {
            [[sampleDict.allKeys[counter] should] equal:key];
            [[sampleDict.allValues[counter] should] equal:value];
            counter ++;
        }];
    });
    
    it(@"iterates all keys", ^{
        [sampleDict eachKey:^(id key){
            [[sampleDict.allKeys[counter] should] equal:key];
            counter ++;
        }];
    });
    
    it(@"iterates all values", ^{ 
        [sampleDict eachValue:^(id value){
            [[sampleDict.allValues[counter] should] equal:value];
            counter ++;
        }];  
    });
    
});

SPEC_END