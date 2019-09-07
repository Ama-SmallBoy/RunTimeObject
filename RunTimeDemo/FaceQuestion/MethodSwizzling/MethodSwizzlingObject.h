//
//  MethodSwizzlingObject.h
//  RunTimeDemo
//
//  Created by a on 2019/9/6.
//  Copyright © 2019 TeenageBeaconFireGroup. All rights reserved.
//

#import <Foundation/Foundation.h>
NS_ASSUME_NONNULL_BEGIN
@interface MethodSwizzlingObject : NSObject
+(void)testClassMethod;
+(void)otherClassMethod;
-(void)testINstanceMethod;
-(void)otherInstanceMethod;
@end

NS_ASSUME_NONNULL_END
