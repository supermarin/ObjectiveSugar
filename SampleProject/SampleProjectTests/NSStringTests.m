//
//  NSStringTests.m
//  SampleProject
//
//  Created by Neil on 05/12/2012.
//  Copyright (c) 2012 @mneorr | mneorr.com. All rights reserved.
//

#import "Kiwi.h"
#import "NSString+Sweetner.h"

SPEC_BEGIN(StringAdditions)

describe(@"Foundation-style functions", ^{

    it(@"NSStringWithFormat makes NSString -stringWithFormat", ^{
        
        [[NSStringWithFormat(@"This is %@", @1) should] equal:@"This is 1"];
    });

});

SPEC_END
