//
//  DynamicAddMethod.m
//  RunTimeDemo
//
//  Created by a on 2019/9/6.
//  Copyright © 2019 TeenageBeaconFireGroup. All rights reserved.
//

#import "DynamicAddMethod.h"
#import <objc/runtime.h>
#import "MethodIMPReciever.h"
@implementation DynamicAddMethod

void testClass(void) {
    NSLog(@"----%s",__func__);
}
void testInstance(void){
    NSLog(@"----%s",__func__);
}

#pragma mark ================================PerformSelector

#pragma mark - 备用接受者
- (void)testPerformSelector
{
    [self performSelector:@selector(justTestForwarding:) withObject:@"testStr"];
}

- (id)forwardingTargetForSelector:(SEL)aSelector
{
    if (aSelector == @selector(justTestForwarding:))
    {
        return [[MethodIMPReciever alloc] init];
    }
    
    return [super forwardingTargetForSelector:aSelector];
}

#pragma mark - 完整消息转发
- (void)testMethodSignature
{
    [self performSelector:@selector(justTestMethodSignature:) withObject:@"testMethodSignatureStr"];
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector
{
    if (aSelector == @selector(justTestMethodSignature:))
    {
        return [NSMethodSignature signatureWithObjCTypes:"v@:"];
    }
    
    return [super methodSignatureForSelector:aSelector];
}

- (void)forwardInvocation:(NSInvocation *)anInvocation
{
    SEL sel = anInvocation.selector;
    MethodIMPReciever * methodSignatureTest = [[MethodIMPReciever alloc] init];
    
    if ([methodSignatureTest respondsToSelector:sel])
    {
        [anInvocation invokeWithTarget:methodSignatureTest];
    }
    else
    {
        [anInvocation doesNotRecognizeSelector:sel];
//        [super forwardInvocation:anInvocation];
    }
}






#pragma mark ================================动态添加方法

+(BOOL)resolveClassMethod:(SEL)sel{
    
    if (sel == @selector(testClassMethodDemo)) {
        
        class_addMethod(self,@selector(testClassMethodDemo), testClass, "v@:");
        NSLog(@"==%s",__func__);
        return YES;
        
    }
    return [super resolveClassMethod:sel];
}

//+(id)forwardingTargetForSelector:(SEL)aSelector{
//    if (aSelector == @selector(testClassMethodDemo)) {
//        NSLog(@"==%s",__func__);
//        return nil;
//    }
//    return [super forwardingTargetForSelector:aSelector];
//}
//+(NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector{
//
//    if (aSelector == @selector(testClassMethodDemo)) {
//        NSMethodSignature* methodSignature= [NSMethodSignature signatureWithObjCTypes:"v@:"];
//            NSLog(@"==%s",__func__);
//          return methodSignature;
//
//      }
//      return [super methodSignatureForSelector:aSelector];
//}
//
//+ (void)forwardInvocation:(NSInvocation *)anInvocation{
//    NSLog(@"==%s",__func__);
//}

+(BOOL)resolveInstanceMethod:(SEL)sel{
    
    if (sel == @selector(testInstanceMethodDemo)) {
        
        class_addMethod(self,@selector(testInstanceMethodDemo), testInstance, "v@:");
        return YES;
        
    }
    return [super resolveInstanceMethod:sel];
}


@end
