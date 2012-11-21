//
//  NSNumber+Rubyfy.h
//  Domainchy
//
//  Created by Marin Usalj on 11/15/12.
//  Copyright (c) 2012 mneorr.com | @mneorr | mneorr@gmail.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSNumber (Rubyfy)

- (void)times:(void(^)(void))block;
- (void)timesWithIndex:(void(^)(int index))block;

- (void)upto:(int)number do:(void(^)(int number))block;
- (void)downto:(int)number do:(void(^)(int number))block;

@end