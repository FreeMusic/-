//
//  Person.m
//  对象等同性
//
//  Created by apple on 2018/6/6.
//  Copyright © 2018年 橘子Star. All rights reserved.
//

#import "Person.h"
#import <objc/runtime.h>

@implementation Person

- (BOOL)compareTheEqualityOfPerson:(Person *)person{
    ///校验指针等同性
    if (self == person) return YES;
    ///校验是否是同一个类
    if ([self class] != [person class]) return NO;
    //检验是否是同一个类
    unsigned int count = 0;
    
    //获取person类中的所有属性
    objc_property_t *propertis = class_copyPropertyList([Person class], &count);
    
    for (int i = 0; i < count; i++) {
        //属性名称
        objc_property_t property = propertis[i];
        
        NSString *propertyName = [NSString stringWithUTF8String:property_getName(property)];
        //KVC取值
        NSString *firstValue = [self valueForKey:propertyName];
        NSString *secondValue = [person valueForKey:propertyName];
        if (![firstValue isEqualToString:secondValue]) {
            return NO;
        }
    }
    
    return YES;
}

@end
