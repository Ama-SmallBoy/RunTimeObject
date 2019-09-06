//
//  RuntimeObject.m
//  RunTimeDemo
//
//  Created by a on 2019/9/5.
//  Copyright © 2019 TeenageBeaconFireGroup. All rights reserved.
//

#import "RuntimeObject.h"
#import <objc/runtime.h>
@implementation RuntimeObject

//================类方法==============
+(BOOL)resolveClassMethod:(SEL)sel{
    if (sel == @selector(recieveMessage:)) {
        NSLog(@"++++%s",__func__);
        return NO;//YES，说明找到了对应的方法体的实现，故结束此次的消息传递，NO 说明没有找到方法体的实现，向下传递，调用 forwardingTargetForSelector:
    }
    return [super resolveClassMethod:sel];
}

//返回参数是一个对象，消息转发对象，告诉系统，该由谁处理该消息。
+ (id)forwardingTargetForSelector:(SEL)aSelector{
    if (aSelector == @selector(recieveMessage:)) {
        NSLog(@"++++%s",__func__);
        return nil;//如果没有给出转发的m目标或者对象，返回nil ,系统会再次调用methodSignatureForSelector：返回一个函数签名
    }
    return [super forwardingTargetForSelector:aSelector];
}

//如果没有给出转发的m目标或者对象 消息返回方法的签名
+ (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector{
    
    if (aSelector == @selector(recieveMessage:)) {
        NSLog(@"++++%s",__func__);
        NSMethodSignature * methodSignature = [NSMethodSignature signatureWithObjCTypes:"v@:@"];
        
        return methodSignature;//如果返回了一个方法签名的话，就调用forwardInvocation ,进行消息处理，如果没有（返回为nil）则标记为消息无法处理。调用doesNotRecognizeSelector
    }
    return [super methodSignatureForSelector:aSelector];
}
//如果forwardInvocation 仍然无法处理该消息，则标记为消息无法处理，如果可以处理，就进行消息的处理，结束转发流程。
+ (void)forwardInvocation:(NSInvocation *)anInvocation
{
     NSLog(@"++++%s",__func__);
}

+ (void)doesNotRecognizeSelector:(SEL)aSelector{
    NSLog(@"++++%s",__func__);
}


//================实例方法==============
+ (BOOL)resolveInstanceMethod:(SEL)sel{
    
    if (sel == @selector(sendMessage:)) {
       NSLog(@"------%s",__func__);
       return NO;//YES，说明找到了对应的方法体的实现，故结束此次的消息传递，NO 说明没有找到方法体的实现，向下传递，调用 forwardingTargetForSelector:
   }
   return [super resolveInstanceMethod:sel];
}

//返回参数是一个对象，消息转发对象，告诉系统，该由谁处理该消息。
- (id)forwardingTargetForSelector:(SEL)aSelector{
    if (aSelector == @selector(sendMessage:)) {
        NSLog(@"------%s",__func__);
        return nil;//如果没有给出转发的m目标或者对象，返回nil ,系统会再次调用methodSignatureForSelector：返回一个函数签名
    }
    return [super forwardingTargetForSelector:aSelector];
}

//如果没有给出转发的m目标或者对象 消息返回方法的签名
- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector{
    
    if (aSelector == @selector(sendMessage:)) {
        NSLog(@"------%s",__func__);
        NSMethodSignature * methodSignature = [NSMethodSignature signatureWithObjCTypes:"v@:@"];
        
        return methodSignature;//如果返回了一个方法签名的话，就调用forwardInvocation ,进行消息处理，如果没有（返回为nil）则标记为消息无法处理。调用doesNotRecognizeSelector
    }
    return [super methodSignatureForSelector:aSelector];
}
//如果forwardInvocation 仍然无法处理该消息，则标记为消息无法处理，如果可以处理，就进行消息的处理，结束转发流程。
- (void)forwardInvocation:(NSInvocation *)anInvocation
{
    
     NSLog(@"------%s",__func__);
}
-(void)doesNotRecognizeSelector:(SEL)aSelector{
    NSLog(@"------%s",__func__);
}


@end
