//
//  NSSet+ObjectiveSugar.m
//  SampleProject
//
//  Created by Marin Usalj on 11/23/12.
//  Copyright (c) 2012 @supermarin | supermar.in. All rights reserved.
//

#import "NSSet+ObjectiveSugar.h"
#import "NSArray+ObjectiveSugar.h"

@implementation NSSet (ObjectiveSugar)

- (id)firstObject {
    NSArray *allObjects = self.allObjects;

    if (allObjects.count > 0)
        return allObjects[0];
    return nil;
}

- (id)lastObject {
    return self.allObjects.lastObject;
}

- (id)sample {
    return [self anyObject];
}

- (void)each:(void (^)(id))block {
    [self enumerateObjectsUsingBlock:^(id obj, BOOL *stop) {
        block(obj);
    }];
}

- (void)eachWithIndex:(void (^)(id, int))block {
    __block int counter = 0;
    [self enumerateObjectsUsingBlock:^(id obj, BOOL *stop) {
        block(obj, counter);
        counter ++;
    }];
}

- (NSArray *)map:(id (^)(id object))block {
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:self.count];


    for (id object in self) {
        id mappedObject = block(object);
        if(mappedObject) {
            [array addObject:mappedObject];
        }
    }

    return array;
}

- (NSArray *)select:(BOOL (^)(id object))block {
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:self.count];

    for (id object in self) {
        if (block(object)) {
            [array addObject:object];
        }
    }

    return array;
}

- (NSArray *)reject:(BOOL (^)(id object))block {
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:self.count];

    for (id object in self) {
        if (block(object) == NO) {
            [array addObject:object];
        }
    }

    return array;
}

- (NSArray *)sort {
    NSSortDescriptor *sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:nil ascending:YES];
    return [self sortedArrayUsingDescriptors:@[sortDescriptor]];
}

- (id)reduce:(id(^)(id accumulator, id object))block {
    return [self reduce:nil withBlock:block];
}

- (id)reduce:(id)initial withBlock:(id(^)(id accumulator, id object))block {
	id accumulator = initial;

	for(id object in self)
		accumulator = accumulator ? block(accumulator, object) : object;

	return accumulator;
}


#pragma mark - Deprecations

- (id)first DEPRECATED_ATTRIBUTE {
    return [self firstObject];
}

- (id)last DEPRECATED_ATTRIBUTE {
    return [self lastObject];
}

@end

