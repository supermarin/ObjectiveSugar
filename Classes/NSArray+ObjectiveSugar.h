//
//  NSArray+ObjectiveSugar.h
//  Objective Sugar
//
//  Created by Marin Usalj on 5/7/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

// For an overview see http://cocoadocs.org/docsets/ObjectiveSugar/

@interface NSArray (ObjectiveSugar)

/**
 The first item in the array, or nil.

 @return  The first item in the array, or nil.
 */
- (id)first DEPRECATED_MSG_ATTRIBUTE("Please use -firstObject instead");

/**
 The last item in the array, or nil.

 @return  The last item in the array, or nil.
 */
- (id)last DEPRECATED_MSG_ATTRIBUTE("Please use -lastObject instead");

/**
 A random element in the array, or nil.

 @return  A random element in the array, or nil.
 */
- (id)sample;

/// Alias for -sample
- (id)anyObject;


/**
 Allow subscripting to fetch elements within the specified range

 @param An NSString or NSValue wrapping an NSRange. It's intended to behave like Ruby's array range accessors.

        Given array of 10 elements, e.g. [1, 2, 3, 4, 5, 6, 7, 8, 9, 10], you can perform these operations:
        array[@"1..3"] will give you [2, 3, 4]
        array[@"1...3"] will give you [2, 3] (last value excluded)
        array[@"1,3"] implies NSRange(location: 1, length: 3), and gives you [2, 3, 4]


 @return An array with elements within the specified range
 */
- (id)objectForKeyedSubscript:(id <NSCopying>)key;


/**
 A simpler alias for `enumerateObjectsUsingBlock`

 @param A block with the object in its arguments.
 */
- (void)each:(void (^)(id object))block;

/**
 A simpler alias for `enumerateObjectsUsingBlock` which also passes in an index

 @param A block with the object in its arguments.
 */
- (void)eachWithIndex:(void (^)(id object, NSUInteger index))block;

/**
 A simpler alias for `enumerateObjectsWithOptions:usingBlock:`

 @param A block with the object in its arguments.
 @param Enumerating options.
 */

- (void)each:(void (^)(id object))block options:(NSEnumerationOptions)options;

/**
 A simpler alias for `enumerateObjectsWithOptions:usingBlock:` which also passes in an index

 @param A block with the object in its arguments.
 @param Enumerating options.
 */

- (void)eachWithIndex:(void (^)(id object, NSUInteger index))block options:(NSEnumerationOptions)options;


/**
 An alias for `containsObject`

 @param An object that the array may or may not contain.
 */
- (BOOL)includes:(id)object;

/**
 Take the first `numberOfElements` out of the array, or the maximum amount of
 elements if it is less.

 @param Number of elements to take from array
 @return An array of elements
 */
- (NSArray *)take:(NSUInteger)numberOfElements;

/**
 Passes elements to the `block` until the block returns NO,
 then stops iterating and returns an array of all prior elements.

 @param A block that returns YES/NO
 @return An array of elements
 */
- (NSArray *)takeWhile:(BOOL (^)(id object))block;

/**
 Iterate through the current array running the block on each object and
 returning an array of the changed objects.

 @param A block that passes in each object and returns a modified object
 @return An array of modified elements
 */
- (NSArray *)map:(id (^)(id object))block;

/**
 Iterate through current array asking whether to keep each element.

 @param A block that returns YES/NO for whether the object should stay
 @return An array of elements selected
 */
- (NSArray *)select:(BOOL (^)(id object))block;

/**
 Iterate through current array returning the first element meeting a criteria.

 @param A block that returns YES/NO
 @return The first matching element
 */
- (id)detect:(BOOL (^)(id object))block;


/**
 Alias for `detect`. Iterate through current array returning the first element
 meeting a criteria.

 @param A block that returns YES/NO
 @return The first matching element
 */
- (id)find:(BOOL (^)(id object))block;

/**
 Iterate through current array asking whether to remove each element.

 @param A block that returns YES/NO for whether the object should be removed
 @return An array of elements not rejected
 */
- (NSArray *)reject:(BOOL (^)(id object))block;

/**
 Recurse through self checking for NSArrays and extract all elements into one single array

 @return An array of all held arrays merged
 */
- (NSArray *)flatten;

/**
 Remove all the nulls from array

 @return A copy of the given array without NSNulls
 */
- (NSArray *)compact;

/**
 Alias for `componentsJoinedByString` with a default of no seperator

 @return A string of all objects joined with an empty string
 */
- (NSString *)join;

/**
 Alias for `componentsJoinedByString`

 @return A string of all objects joined with the `seperator` string
 */
- (NSString *)join:(NSString *)separator;

/**
 Run the default comparator on each object in the array

 @return A sorted copy of the array
 */
- (NSArray *)sort;

/**
 Sorts the array using the the default comparator on the given key

 @return A sorted copy of the array
 */
- (NSArray *)sortBy:(NSString *)key;

/**
 Alias for reverseObjectEnumerator.allObjects

 Returns a reversed array
 */
- (NSArray *)reverse;

/**
 Return all the objects that are in both self and `array`.
 Alias for Ruby's & operator

 @return An array of objects common to both arrays
 */
- (NSArray *)intersectionWithArray:(NSArray *)array;

/**
 Return all the objects that in both self and `array` combined.
 Alias for Ruby's | operator

 @return An array of the two arrays combined
 */

- (NSArray *)unionWithArray:(NSArray *)array;

/**
 Return all the objects in self that are not in `array`.
 Alias for Ruby's - operator

 @return An array of the self without objects in `array`
 */

- (NSArray *)relativeComplement:(NSArray *)array;

/**
 Return all the objects that are unique to each array individually
 Alias for Ruby's ^ operator. Equivalent of a - b | b - a

 @return An array of elements which are in either of the arrays and not in their intersection.
 */
- (NSArray *)symmetricDifference:(NSArray *)array;

/**
 Return a single value from an array by iterating through the elements and transforming a running total.

 @return A single value that is the end result of apply the block function to each element successively.
 **/
- (id)reduce:(id (^)(id accumulator, id object))block;

/**
 Same as -reduce, with initial value provided by yourself
 **/
- (id)reduce:(id)initial withBlock:(id (^)(id accumulator, id object))block;

/**
 Produces a duplicate-free version of the array
 
 @return a new array with all unique elements
 **/
- (NSArray *)unique;

@end

