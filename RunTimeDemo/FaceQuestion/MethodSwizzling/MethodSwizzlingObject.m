//
//  MethodSwizzlingObject.m
//  RunTimeDemo
//
//  Created by a on 2019/9/6.
//  Copyright © 2019 TeenageBeaconFireGroup. All rights reserved.
//

#import "MethodSwizzlingObject.h"
#import <objc/runtime.h>
@implementation MethodSwizzlingObject

+(void)load{
    //=======================类方法交换==================
    //获取相应的类
    Class methodChange = NSClassFromString(@"MethodSwizzlingObject");
    //获取相应的类
    Method testClassMethod = class_getClassMethod(methodChange, @selector(testClassMethod));
    
    Method otherClassMethod = class_getClassMethod(methodChange, @selector(otherClassMethod));
    
    method_exchangeImplementations(testClassMethod, otherClassMethod);
   
    //=======================实例方法交换==================
      //获取相应的类
      Method testINstanceMethod = class_getInstanceMethod(methodChange, @selector(testINstanceMethod));
      
      Method otherInstanceMethod = class_getInstanceMethod(methodChange, @selector(otherInstanceMethod));
      
      method_exchangeImplementations(testINstanceMethod, otherInstanceMethod);
}

+(void)testClassMethod{
    NSLog(@"==testClassMethod==%s",__func__);
}
+(void)otherClassMethod{
     NSLog(@"==otherClassMethod==%s",__func__);
}
-(void)testINstanceMethod{
    NSLog(@"==testINstanceMethod==%s",__func__);
}
-(void)otherInstanceMethod{
    NSLog(@"==otherInstanceMethod==%s",__func__);
}
@end
