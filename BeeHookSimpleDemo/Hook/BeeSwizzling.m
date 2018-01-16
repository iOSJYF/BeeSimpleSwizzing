//
//  BeeSwizzling.m
//  BeeHookSimpleDemo
//
//  Created by Ji_YuFeng on 2018/1/15.
//  Copyright © 2018年 GD_Bee. All rights reserved.
//

#import "BeeSwizzling.h"
#import <objc/message.h>

@implementation BeeSwizzling

+ (void)swizzingWithTheClass:(Class)class andSEL_Name:(SEL)sel_1 andEx_SEL_Name:(SEL)sel_2
{
    
    
    Method method1 = class_getInstanceMethod(class, sel_1);
    Method method2 = class_getInstanceMethod(class, sel_2);
    
    BOOL didAddMethod = class_addMethod(class, sel_2, method_getImplementation(method1), method_getTypeEncoding(method1));
    if (didAddMethod) {
        class_replaceMethod(class, sel_1, method_getImplementation(method2), method_getTypeEncoding(method2));
    }else{
        method_exchangeImplementations(method1, method2);
    }
        
}





@end
