//
//  NSString+ObjectiveSugar.m
//  SampleProject
//
//  Created by Neil on 05/12/2012.
//  Copyright (c) 2012 @mneorr | mneorr.com. All rights reserved.
//

#import "NSString+ObjectiveSugar.h"
#import "NSArray+ObjectiveSugar.h"

NSString *NSStringWithFormat(NSString *formatString, ...) {
    va_list args;
    va_start(args, formatString);
    
    NSString *string = [[NSString alloc] initWithFormat:formatString arguments:args];
    
    va_end(args);
    
#if defined(__has_feature) && __has_feature(objc_arc)
    return string;
#else 
    return [string autorelease];
#endif
}


@implementation NSString(Additions)

- (NSArray *)split {
    return [self split:@" "];
}

- (NSArray *)split:(NSString *)delimiter {
    NSArray *result = [self componentsSeparatedByCharactersInSet:
                            [NSCharacterSet characterSetWithCharactersInString:delimiter]];

    return [result select:^BOOL(NSString *string) {
        return string.length > 0;
    }];
}

@end
