//
//  BeeSwizzling.h
//  BeeHookSimpleDemo
//
//  Created by Ji_YuFeng on 2018/1/15.
//  Copyright © 2018年 GD_Bee. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BeeSwizzling : NSObject

+ (void)swizzingWithTheClass:(Class)class andSEL_Name:(SEL)sel_1 andEx_SEL_Name:(SEL)sel_2;

@end
