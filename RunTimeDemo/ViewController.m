//
//  ViewController.m
//  RunTimeDemo
//
//  Created by a on 2019/9/3.
//  Copyright © 2019年 TeenageBeaconFireGroup. All rights reserved.
//

#import "ViewController.h"
#import "Phone.h"
#import "RuntimeObject.h"
#import "MethodSwizzlingObject.h"
#import "DynamicAddMethod.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //TODO:消息传递流程
    Phone * phone = [[Phone alloc]init];
    //TODO:调用RuntimeObject,印证消息转发的流程。
    RuntimeObject * runtimeObject = [[RuntimeObject alloc] init];
    [runtimeObject sendMessage:@"我的名称是什么鬼"];
    [RuntimeObject recieveMessage:@"家乡的名称是什么鬼"];
    
    //TODO:测试方法交换
    MethodSwizzlingObject * methodSwizzlingObject = [[MethodSwizzlingObject alloc]init];
    //类方法
    [MethodSwizzlingObject testClassMethod];
    [MethodSwizzlingObject otherClassMethod];
    //实例方法：
    [methodSwizzlingObject testINstanceMethod];
    [methodSwizzlingObject otherInstanceMethod];
    //TODO:练习，1.处理字典、数组为nil && 数组越界的问题
    
    //================数组
    NSMutableArray * testArray = [NSMutableArray arrayWithArray:@[@"dha",@"323"]];
    [testArray addObject:@"123456"];
    [testArray addObject:nil];
    NSLog(@"=====%@",[testArray objectAtIndex:3]);
    //这种方式不会出问题：
    NSString * name =nil;
   __unused NSMutableArray * testArray2 = [[NSMutableArray alloc]initWithObjects:@"12", @"21",name,nil];
    //会 Crash
   __unused NSArray * testA = @[@"123",@"31",name];
    
     //================字典数据
     //================数组
    __unused NSString * value = nil;
    __unused NSString * key = nil;
    NSDictionary * testDic = @{@"21312":@"1231",key:@"123"};
    NSLog(@"=====%@",testDic);
  
    //TODO:练习，2.添加页面记录问题
    
    
//========================= 动态添加方法 ========
    
    DynamicAddMethod * dynamicAddMethod = [[DynamicAddMethod alloc]init];
    [dynamicAddMethod testInstanceMethodDemo];
 //========================= 动态添加类方法暂时还有问题，待以后更新 ========
   // [DynamicAddMethod testClassMethodDemo];
    
    
//备用接收者
    [dynamicAddMethod testPerformSelector];
    //完整的消息转发
    [dynamicAddMethod testMethodSignature];
    
    
}


@end
