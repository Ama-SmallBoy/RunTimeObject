//
//  MethodIMPReciever.m
//  RunTimeDemo
//
//  Created by a on 2019/9/7.
//  Copyright © 2019 TeenageBeaconFireGroup. All rights reserved.
//

#import "MethodIMPReciever.h"

@implementation MethodIMPReciever
- (void)justTestForwarding:(NSString *)testStr
{
    NSLog(@"备用接收者收到justTestForwarding:消息转发，参数：%@", testStr);
}

- (void)justTestMethodSignature:(NSString *)testStr
{
    NSLog(@"收到justTestMethodSignature: 完整消息转发，参数：%@", testStr);
}
@end
