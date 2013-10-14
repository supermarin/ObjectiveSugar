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

/**
 Returns an array containing substrings from the receiver that have been divided by a whitespace delimiter
 
 @return An array containing substrings that have been divided by a whitespace delimiter
 */
- (NSArray *)split;


/**
 Returns an array containing substrings from the receiver that have been divided by a given delimiter
 
 @param delimiter The delimiter string
 @return An array containing substrings that have been divided by delimiter
 */
- (NSArray *)split:(NSString *)delimiter;


/**
 Returns a new string made by converting a snake_case_string to CamelCaseString
 
 @return A string made by converting a snake_case_string to CamelCaseString
 */
- (NSString *)camelCase;


/**
 Returns a Boolean value that indicates whether a given string is a substring of the receiver
 
 @return YES if 'string' is a substring of the receiver, otherwise NO
 */
- (BOOL)containsString:(NSString *)string;


/**
 Returns a new string made by removing whitespaces and newlines from both ends of the receiver
 
 @return A string without trailing or leading whitespaces and newlines
 */
- (NSString *)strip;

@end

