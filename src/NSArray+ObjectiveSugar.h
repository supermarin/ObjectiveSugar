//
//  NSArray+ObjectiveSugar.h
//  WidgetPush
//
//  Created by Marin Usalj on 5/7/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//



@interface NSArray (ObjectiveSugar)

@property(readonly) id first;
@property(readonly) id last;

- (void)each:(void (^)(id object))block;
- (void)eachWithIndex:(void (^)(id object, int index))block;
- (BOOL)includes:(id)object;

- (NSArray *)take:(NSUInteger)numberOfElements;
- (NSArray *)takeWhile:(BOOL (^)(id object))block;

- (NSArray *)map:(id (^)(id object))block;
- (NSArray *)select:(BOOL (^)(id object))block;
- (NSArray *)reject:(BOOL (^)(id object))block;
- (NSArray *)flatten;
- (NSString *)join;
- (NSString *)join:(NSString *)separator;

// Alias for Ruby's & operator
- (NSArray *)intersectionWithArray:(NSArray *)array;
// Alias for Ruby's | operator
- (NSArray *)unionWithArray:(NSArray *)array;
// Alias for Ruby's - operator
- (NSArray *)relativeComplement:(NSArray *)array;
// Alias for Ruby's ^ operator. Equivalent of a - b | b - a
- (NSArray *)symmetricDifference:(NSArray *)array;

@end