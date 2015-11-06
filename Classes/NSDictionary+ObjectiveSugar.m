//
//  NSDictionary+ObjectiveSugar.m
//  SampleProject
//
//  Created by Marin Usalj on 11/23/12.
//  Copyright (c) 2012 @supermarin | supermar.in. All rights reserved.
//

#import "NSDictionary+ObjectiveSugar.h"

#import "NSArray+ObjectiveSugar.h"

@implementation NSDictionary (Rubyfy)

- (void)each:(void (^)(id k, id v))block {
    [self enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        block(key, obj);
    }];
}

- (void)eachKey:(void (^)(id k))block {
    [self enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        block(key);
    }];
}

- (void)eachValue:(void (^)(id v))block {
    [self enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        block(obj);
    }];
}

- (NSArray *)map:(id (^)(id key, id value))block {
    NSMutableArray *array = [NSMutableArray array];

    [self enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        id object = block(key, obj);
        if (object) {
          [array addObject:object];
        }
    }];

    return array;
}

- (BOOL)hasKey:(id)key {
    return !!self[key];
}

- (NSDictionary *)pick:(NSArray *)keys {
    NSMutableDictionary *picked = [[NSMutableDictionary alloc] initWithCapacity:keys.count];

    [self enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        if ([keys containsObject:key]) {
            picked[key] = obj;
        }
    }];

    return picked;
}

- (NSDictionary *)omit:(NSArray *)keys {
    NSMutableDictionary *omitted = [[NSMutableDictionary alloc] initWithCapacity:([self allKeys].count - keys.count)];

    [self enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        if (![keys containsObject:key]) {
            omitted[key] = obj;
        }
    }];

    return omitted;
}

- (NSDictionary *)merge:(NSDictionary *)dictionary {
    NSMutableDictionary *merged = [NSMutableDictionary dictionaryWithDictionary:self];
    [merged addEntriesFromDictionary:dictionary];
    return merged;
}

- (NSDictionary *)merge:(NSDictionary *)dictionary block:(id(^)(id key, id oldVal, id newVal))block {
    NSMutableDictionary *merged = [NSMutableDictionary dictionary];
    [[[self allKeys] relativeComplement:[dictionary allKeys]] each:^(id key) {
        merged[key] = self[key];
    }];

    [[[dictionary allKeys] relativeComplement:[self allKeys]] each:^(id key) {
        merged[key] = dictionary[key];
    }];

    [[[self allKeys] intersectionWithArray:[dictionary allKeys]] each:^(id key) {
        merged[key] = block(key, self[key], dictionary[key]);
    }];
    return merged;
}

- (NSDictionary *)invert {
    NSMutableDictionary *inverted = [NSMutableDictionary dictionary];
    for (id key in [self allKeys]) {
        inverted[self[key]] = key;
    }
    return inverted;
}

@end
