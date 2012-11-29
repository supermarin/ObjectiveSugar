//
//  NSArray+Accessors.m
//  WidgetPush
//
//  Created by Marin Usalj on 5/7/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "NSArray+Accessors.h"

@implementation NSArray (Accessors)
@dynamic first, last;

- (id)first {
    if (self.count > 0) {
        return self[0];
    }
    return nil;
}

- (id)last {
    return [self lastObject];
}

- (void)each:(void (^)(id object))block {
    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        block(obj); 
    }];
}

- (void)eachWithIndex:(void (^)(id object, int index))block {
    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        block(obj, idx); 
    }];
}

- (BOOL)includes:(id)object {
    return [self containsObject:object];
}

- (NSArray *)take:(NSUInteger)numberOfElements {
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:numberOfElements];
    
    for (NSUInteger i = 0; i < numberOfElements; i++) {
        [array addObject:self[i]];
    }
    
    return array;
}

- (NSArray *)takeWhile:(BOOL (^)(id object))block {
    NSMutableArray *array = [NSMutableArray array];
    
    for (id arrayObject in self) {
        if (block(arrayObject))
            [array addObject:arrayObject];

        else break;
    }
    
    return array;
}

#pragma mark - Set operations

- (NSArray *)intersectionWithArray:(NSArray *)array {
    NSPredicate *intersectPredicate = [NSPredicate predicateWithFormat:@"SELF IN %@", array];
    return [self filteredArrayUsingPredicate:intersectPredicate];
}

- (NSArray *)unionWithArray:(NSArray *)array {
    NSArray *complement = [self relativeComplement:array];
    return [complement arrayByAddingObjectsFromArray:array];
}

- (NSArray *)relativeComplement:(NSArray *)array {
    NSPredicate *relativeComplementPredicate = [NSPredicate predicateWithFormat:@"NOT SELF IN %@", array];
    return [self filteredArrayUsingPredicate:relativeComplementPredicate];
}

- (NSArray *)symmetricDifference:(NSArray *)array {
    NSArray *a_subtract_b = [self relativeComplement:array];
    NSArray *b_subtract_a = [array relativeComplement:self];
    return [a_subtract_b unionWithArray:b_subtract_a];
}

@end
