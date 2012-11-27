//
//  NSMutableArray+Rubyfy.h
//  SampleProject
//
//  Created by Marin Usalj on 11/23/12.
//  Copyright (c) 2012 @mneorr | mneorr.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableArray (Rubyfy)

- (void)push:(id)object;
- (id)pop;
- (NSArray *)pop:(NSUInteger)numberOfElements;
- (void)concat:(NSArray *)array;

@end
