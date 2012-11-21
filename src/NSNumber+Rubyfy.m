//
//  NSNumber+Rubyfy.m
//  Domainchy
//
//  Created by Marin Usalj on 11/15/12.
//  Copyright (c) 2012 mneorr.com | @mneorr | mneorr@gmail.com. All rights reserved.
//

#import "NSNumber+Rubyfy.h"

@implementation NSNumber (Rubyfy)

- (void)times:(void (^)(void))block {
    for (int i = 0; i < self.intValue; i++)
        block();
}

- (void)timesWithIndex:(void (^)(int))block {
    for (int i = 0; i < self.intValue; i++)
        block(i);
}

- (void)upto:(int)number do:(void (^)(int))block {
    for (int i = self.intValue; i <= number; i++)
        block(i);
}

- (void)downto:(int)number do:(void (^)(int))block {
    for (int i = self.intValue; i >= number; i--)
        block(i);
}

@end
