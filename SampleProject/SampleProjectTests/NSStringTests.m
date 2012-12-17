//
//  NSStringTests.m
//  SampleProject
//
//  Created by Neil on 05/12/2012.
//  Copyright (c) 2012 @mneorr | mneorr.com. All rights reserved.
//

#import "Kiwi.h"
#import "NSString+ObjectiveSugar.h"

SPEC_BEGIN(StringAdditions)

describe(@"Foundation-style functions", ^{

    it(@"NSStringWithFormat makes NSString -stringWithFormat", ^{
        
        [[NSStringWithFormat(@"This is %@", @1) should] equal:@"This is 1"];
    });

});

describe(@"Ruby-style additions", ^{
    NSString *sentence = @"Jane Doe's going    in a shop,and,yeah;";

    it(@"-split splits by whitespace", ^{
        [[[sentence split] should] equal:@[@"Jane", @"Doe's", @"going", @"in", @"a", @"shop,and,yeah;"]];
    });
    
    it(@"-split: splits with given delimiter", ^{
        [[[sentence split:@","] should] equal:@[@"Jane Doe's going    in a shop", @"and", @"yeah;"]];
    });
});

SPEC_END
