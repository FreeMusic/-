//
//  Person.h
//  对象等同性
//
//  Created by apple on 2018/6/6.
//  Copyright © 2018年 橘子Star. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

@property (nonatomic, copy) NSString *name;//

@property (nonatomic, copy) NSString *age;

@property (nonatomic, copy) NSString *address;
/**
 校验等同性
 */
- (BOOL)compareTheEqualityOfPerson:(Person *)person;

@end
