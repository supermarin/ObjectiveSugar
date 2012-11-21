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
    return [self objectAtIndex:0];
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

@end
