//
//  NSArray+SwizzlingSafe.m
//  RunTimeDemo
//
//  Created by a on 2019/9/6.
//  Copyright © 2019 TeenageBeaconFireGroup. All rights reserved.


#import "NSArray+SwizzlingSafe.h"
#import <objc/runtime.h>
@implementation NSArray (SwizzlingSafe)
+ (void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        // 类簇：NSString、NSArray、NSDictionary，真实类型是其他类型
        Class clsI = NSClassFromString(@"__NSArrayI");
        
        Method method1 = class_getInstanceMethod(clsI, @selector(objectAtIndex:));
        Method method2 = class_getInstanceMethod(clsI, @selector(mj_objectAtIndex:));
        method_exchangeImplementations(method1, method2);
        
        Class clsM = NSClassFromString(@"__NSArrayM");
        
        Method methodInsertOrigin = class_getInstanceMethod(clsM, @selector(insertObject:atIndex:));
        Method methodInsertCustom = class_getInstanceMethod(clsM, @selector(mj_insertObject:atIndex:));
        method_exchangeImplementations(methodInsertOrigin, methodInsertCustom);
        
        Method methodMOrigin = class_getInstanceMethod(clsM, @selector(objectAtIndex:));
        Method methodMCustom = class_getInstanceMethod(clsM, @selector(mj_M_objectAtIndex:));
        method_exchangeImplementations(methodMOrigin, methodMCustom);
     
        
        Class clsP = NSClassFromString(@"__NSPlaceholderArray");
        
        Method method3 = class_getInstanceMethod(clsP, @selector(initWithObjects:count:));
        Method method4 = class_getInstanceMethod(clsP, @selector(mj_initWithObjects:count:));
        method_exchangeImplementations(method3, method4);
    });
}

//添加元素，nil ,或者越界问题。
- (void)mj_insertObject:(id)anObject atIndex:(NSUInteger)index
{
    if (anObject == nil || index > self.count) return;
    [self mj_insertObject:anObject atIndex:index];
}

//获取
- (id)mj_objectAtIndex:(NSUInteger)index{
    if(index>=self.count) return self.lastObject;
    return [self mj_objectAtIndex:index];
}

//获取
- (id)mj_M_objectAtIndex:(NSUInteger)index{
    if(index>=self.count) return self.lastObject;
    return [self mj_M_objectAtIndex:index];
}

//添加元素
-(instancetype)mj_initWithObjects:(id  _Nonnull const [])objects count:(NSUInteger)cnt{
    for (NSUInteger i = 0; i < cnt; i ++) {
        if (!objects[i])
        {
            return [self init];
        }
    }
    return [self mj_initWithObjects:objects count:cnt];
}

@end
