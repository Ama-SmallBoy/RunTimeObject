//
//  NSDictionary+SwizzlingObject.m
//  RunTimeDemo
//
//  Created by a on 2019/9/6.
//  Copyright © 2019 TeenageBeaconFireGroup. All rights reserved.
//

#import "NSDictionary+SwizzlingObject.h"
#import <objc/runtime.h>
@implementation NSDictionary (SwizzlingObject)
+ (void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        // 类簇：NSString、NSArray、NSDictionary，真实类型是其他类型
        Class clsI = NSClassFromString(@"__NSPlaceholderDictionary");
//
        Method method1 = class_getInstanceMethod(clsI, @selector(initWithObjects:forKeys:count:));
        Method method2 = class_getInstanceMethod(clsI, @selector(mj_initWithObjects:forKeys:count:));
        method_exchangeImplementations(method1, method2);
//
//        Class clsM = NSClassFromString(@"__NSArrayM");
//
//        Method methodInsertOrigin = class_getInstanceMethod(clsM, @selector(insertObject:atIndex:));
//        Method methodInsertCustom = class_getInstanceMethod(clsM, @selector(mj_insertObject:atIndex:));
//        method_exchangeImplementations(methodInsertOrigin, methodInsertCustom);
//
//        Method methodMOrigin = class_getInstanceMethod(clsM, @selector(objectAtIndex:));
//        Method methodMCustom = class_getInstanceMethod(clsM, @selector(mj_M_objectAtIndex:));
//        method_exchangeImplementations(methodMOrigin, methodMCustom);
//
//
//        Class clsP = NSClassFromString(@"__NSPlaceholderArray");
//
//        Method method3 = class_getInstanceMethod(clsP, @selector(initWithObjects:count:));
//        Method method4 = class_getInstanceMethod(clsP, @selector(mj_initWithObjects:count:));
//        method_exchangeImplementations(method3, method4);
    });
}

-(instancetype)mj_initWithObjects:(id  _Nonnull const [])objects forKeys:(id<NSCopying>  _Nonnull const [])keys count:(NSUInteger)cnt{
    
     for (NSUInteger i = 0; i < cnt; i ++) {
         
          if (!objects[i] || !keys[i] )
          {
              return [self init];
          }
      }
     return [self mj_initWithObjects:objects forKeys:keys count:cnt];
}

@end
