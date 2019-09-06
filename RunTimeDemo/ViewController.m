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
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    Phone * phone = [[Phone alloc]init];
    //调用RuntimeObject,印证消息转发的流程。
    RuntimeObject * runtimeObject = [[RuntimeObject alloc] init];
    [runtimeObject sendMessage:@"我的名称是什么鬼"];
    [RuntimeObject recieveMessage:@"家乡的名称是什么鬼"];
    
}


@end
