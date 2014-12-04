//
//  NSSet+Accessors.h
//  SampleProject
//
//  Created by Marin Usalj on 11/23/12.
//  Copyright (c) 2012 @supermarin | supermar.in. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSSet (Accessors)

/// Returns the first object of a given set.
/// Note that sets are unordered, so this method won't always return the same thing
@property(readonly) id firstObject;

/// Returns the last object of a given set.
/// Note that sets are unordered, so this method won't always return the same thing
@property(readonly) id lastObject;


/// Alias for -anyObject. Returns a random object from a given set
@property(readonly) id sample;

/// Alias for -anyObject. Returns a random object from a given set
- (void)each:(void (^)(id object))block;
- (void)eachWithIndex:(void (^)(id object, NSUInteger index))block;

/// Filters the given set using provided block, and returns an array copy
- (NSArray *)select:(BOOL (^)(id object))block;

/// Keeps the objects passing the given block, and returns an array copy
- (NSArray *)reject:(BOOL (^)(id object))block;

/// Returns a sorted array copy of the given set
- (NSArray *)sort;

/**
 *  Maps the given NSSet to NSArray.
 *  NOTE: If the block returns `-nil`, values are ignored.
 *        This is intentional to keep the behavior of `-valueForKeyPath`.
 *        This is different from NSArray `-map`, which puts NSNulls in the given case.
 *        If you want to preserve the count and use NSNulls, use `set.allObjects -map:`
 *
 *  @param block - a transform block
 *
 *  @return An NSArray copy of the transformed set.
 */
- (NSArray *)map:(id (^)(id object))block;

/**
 Return a single value from an array by iterating through the elements and transforming a running total.

 @return A single value that is the end result of apply the block function to each element successively.
 **/
- (id)reduce:(id (^)(id accumulator, id object))block;

/**
 Same as -reduce, with initial value provided by yourself
 **/
- (id)reduce:(id)initial withBlock:(id (^)(id accumulator, id object))block;


#pragma mark - Deprecations

@property(readonly) id first DEPRECATED_MSG_ATTRIBUTE("Please use -firstObject");
@property(readonly) id last  DEPRECATED_MSG_ATTRIBUTE("Please use -lastObject");

@end
