//
//  NSMutableArray+ObjectiveSugar.m
//  SampleProject
//
//  Created by Marin Usalj on 11/23/12.
//  Copyright (c) 2012 @mneorr | mneorr.com. All rights reserved.
//

#import "NSMutableArray+ObjectiveSugar.h"
#import "NSArray+ObjectiveSugar.h"

@implementation NSMutableArray (ObjectiveSugar)

- (void)push:(id)object {
    [self addObject:object];
}

- (id)pop {
    id object = [self lastObject];
    [self removeLastObject];
    
    return object;
}

- (NSArray *)pop:(NSUInteger)numberOfElements {
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:numberOfElements];
    
    for (NSUInteger i = 0; i < numberOfElements; i++)
        [array insertObject:[self pop] atIndex:0];
    
    return array;
}

- (void)concat:(NSArray *)array {
    [self addObjectsFromArray:array];
}

- (id)shift {
    NSArray *result = [self shift:1];
    return [result first];
}

- (NSArray *)shift:(NSUInteger)numberOfElements {
    NSUInteger shiftLength = MIN(numberOfElements, [self count]);
    
    NSRange range = NSMakeRange(0, shiftLength);
    NSArray *result = [self subarrayWithRange:range];
    [self removeObjectsInRange:range];
    
    return result;
}

- (NSArray *)keepIf:(BOOL (^)(id object))block {
    for (NSUInteger i = 0; i < self.count; i++) {
        id object = self[i];
        if (block(object) == NO) {
            [self removeObject:object];
        }
    }
    
    return self;
}

@end
