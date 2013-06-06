//
//  NSString+ObjectiveSugar.h
//  SampleProject
//
//  Created by Neil on 05/12/2012.
//  Copyright (c) 2012 @mneorr | mneorr.com. All rights reserved.
//

#import <Foundation/Foundation.h>

NSString *NSStringWithFormat(NSString *format, ...) NS_FORMAT_FUNCTION(1,2);

@interface NSString(ObjectiveSugar)

- (NSArray *)split;
- (NSArray *)split:(NSString *)delimiter;

- (NSString *)camelCase;
- (BOOL)containsString:(NSString *)string;

@end

