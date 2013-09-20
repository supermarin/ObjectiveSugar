//
//  NSMutableArray+ObjectiveSugar.h
//  SampleProject
//
//  Created by Marin Usalj on 11/23/12.
//  Copyright (c) 2012 @mneorr | mneorr.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableArray (ObjectiveSugar)

- (void)push:(id)object;
- (id)pop;
- (NSArray *)pop:(NSUInteger)numberOfElements;
- (void)concat:(NSArray *)array;

/**
 method removes the first item of an array, and returns that item
 Note: This method changes the length of an array!
 
 @return First array item or nil.
 */
- (id)shift;


/**
 method removes N first items of an array, and returns that items
 Note: This method changes the length of an array!
 
 @return Array of first N items or empty array.
 */
- (NSArray *)shift:(NSUInteger)numberOfElements;

@end
