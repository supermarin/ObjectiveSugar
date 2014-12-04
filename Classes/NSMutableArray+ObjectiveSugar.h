//
//  NSMutableArray+ObjectiveSugar.h
//  SampleProject
//
//  Created by Marin Usalj on 11/23/12.
//  Copyright (c) 2012 @supermarin | supermar.in. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableArray (ObjectiveSugar)

/// Alias for -addObject. Appends the given object at the end
- (void)push:(id)object;

/**
 Removes the last item of the array, and returns that item
 Note: This method changes the length of the array!

 @return First array item or nil.
 */
- (id)pop;


/**
 Removes the last n items of the array, and returns that item
 Note: This method changes the length of the array!

 @return First array item or nil.
 */
- (NSArray *)pop:(NSUInteger)numberOfElements;
- (void)concat:(NSArray *)array;


/**
 Removes the first item of the array, and returns that item
 Note: This method changes the length of the array!

 @return First array item or nil.
 */
- (id)shift;


/**
 Removes N first items of the array, and returns that items
 Note: This method changes the length of the array!

 @return Array of first N items or empty array.
 */
- (NSArray *)shift:(NSUInteger)numberOfElements;


/**
 Deletes every element of the array for which the given block evaluates to NO.

 @param A block that returns YES/NO
 @return An array of elements
 */
- (NSArray *)keepIf:(BOOL (^)(id object))block;

@end
