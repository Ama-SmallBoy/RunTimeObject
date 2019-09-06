//
//  Phone.m
//  RunTimeDemo
//
//  Created by a on 2019/9/3.
//  Copyright © 2019年 TeenageBeaconFireGroup. All rights reserved.
//

#import "Phone.h"

@implementation Phone
- (instancetype)init
{
    self = [super init];
    if (self) {
        NSLog(@"==========%@",NSStringFromClass([self class]));
        NSLog(@"==========%@",NSStringFromClass([super class]));
    }
    return self;
}

@end
