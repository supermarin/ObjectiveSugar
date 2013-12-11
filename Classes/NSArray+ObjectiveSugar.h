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

- (id) first;

/**
 The last item in the array, or nil.

 @return  The last item in the array, or nil.
 */

- (id) last;


/**
 A random element in the array, or nil.

 @return  A random element in the array, or nil.
 */

- (id) sample;


/**
 Allow subscripting to fetch elements within the specified range
 
 @param An NSValue wrapping an NSRange struct or an NSString with valid range components. If it is an NSString, it will be parsed to an NSRange. eg. @"1..3" specifying the range from 1 to 3. @"1...3" specifying the range from 1 to 2 (exclude the end value 3). Other strinig which contains two int values (@"1,3") will be parsed as range's location and length.
 
 @return An array with all the elements within the specified range
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
- (NSArray *)sortBy:(NSString*)key;

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

@end
