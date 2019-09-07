//
//  DynamicAddMethod.h
//  RunTimeDemo
//
//  Created by a on 2019/9/6.
//  Copyright © 2019 TeenageBeaconFireGroup. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DynamicAddMethod : NSObject
+(void)testClassMethodDemo;
-(void)testInstanceMethodDemo;
-(void)testPerformSelector;
- (void)testMethodSignature;
@end

NS_ASSUME_NONNULL_END
