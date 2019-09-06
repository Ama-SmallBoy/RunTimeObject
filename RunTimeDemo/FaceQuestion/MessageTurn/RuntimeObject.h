//
//  RuntimeObject.h
//  RunTimeDemo
//
//  Created by a on 2019/9/5.
//  Copyright © 2019 TeenageBeaconFireGroup. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface RuntimeObject : NSObject
-(void)sendMessage:(NSString *)messsage;
+(void)recieveMessage:(NSString *)messsage;
@end

NS_ASSUME_NONNULL_END
