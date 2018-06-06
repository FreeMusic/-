//
//  ViewController.m
//  对象等同性
//
//  Created by apple on 2018/6/6.
//  Copyright © 2018年 橘子Star. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //校验指针的等同性
    [self checkTheEqualityOfThePointer];
    //校验实例变量的等同性
    [self verifyTheEqualityOfInstanceVariables];
    //hash方法  两个哈希码完全相同的对象 却未必相等
    [self hashEquality];
    //校验自定义对象的等同性
    [self verifyTheEqualityOfCustomObjects];
    //容器中可变类的等同性
    [self equalityOfVariableClassesInContainer];
}
/**
 校验指针的等同性
 */
- (void)checkTheEqualityOfThePointer{
    NSString *name = @"七七七123";
    NSString *otherName = @"七七七123";
    NSString *anOtherName = [NSString stringWithFormat:@"七七七%d", 123];
    if (name == otherName) {
        NSLog(@"指针等同 name的指针%p    otherName的指针%p", name, otherName);
    }else{
        NSLog(@"指针 不等同 name的指针%p    otherName的指针%p", name, otherName);
    }
    if (name == anOtherName) {
        NSLog(@"指针等同");
    }else{
        NSLog(@"指针 不等同 name的指针%p    anOtherName的指针%p", name, anOtherName);
    }
}
/**
 校验实例变量的等同性
 */
- (void)verifyTheEqualityOfInstanceVariables{
    NSString *name = @"七七七123";
    NSString *otherName = @"七七七123";
    NSString *anOtherName = [NSString stringWithFormat:@"七七七%d", 123];
    if ([name isEqual:otherName]) {
        NSLog(@"变量等同");
    }else{
        NSLog(@"变量 不等同");
    }
    if ([name isEqual:anOtherName]) {
        NSLog(@"变量等同");
    }else{
        NSLog(@"变量 不等同");
    }
}
/**
 hash方法  两个哈希码完全相同的对象 却未必相等
 */
- (void)hashEquality{
    NSString *name = @"七七七123";
    NSString *otherName = @"七七七123";
    NSString *anOtherName = [NSString stringWithFormat:@"七七七%d", 123];
    
    NSUInteger nameHash = [name hash];
    NSUInteger otherNameHash = [otherName hash];
    NSUInteger anOtherNameHash = [anOtherName hash];
    
    NSLog(@"hash方法 nameHash = %lu  otherName = %lu anOtherNameHash = %lu", (unsigned long)nameHash, (unsigned long)otherNameHash, (unsigned long)anOtherNameHash);
}
/**
 校验自定义对象的等同性
 */
- (void)verifyTheEqualityOfCustomObjects{
    Person *youngPerson = [[Person alloc] init];
    youngPerson.age = @"18";
    youngPerson.name = @"小汉";
    youngPerson.address = @"杭州";
    Person *oldPerson = [[Person alloc] init];
    oldPerson.age = @"81";
    oldPerson.name = @"老汉";
    oldPerson.address = @"日本";
    
    if ([youngPerson compareTheEqualityOfPerson:oldPerson]) {
        NSLog(@"同一个人");
    }else{
        NSLog(@"不是同一个人");
    }
}
/**
 容器中可变类的等同性
 */
- (void)equalityOfVariableClassesInContainer{
    NSMutableSet *set = [NSMutableSet set];//set集合是无序的
    NSMutableArray *arrayFirst = [NSMutableArray arrayWithArray:@[@4, @8]];
    
    [set addObject:arrayFirst];
    
    NSMutableArray *arraySecond = [NSMutableArray arrayWithArray:@[@4, @8]];
    
    [set addObject:arraySecond];
    //向set中加入两个相等的对象 set中仍然只有一个对象
    
    NSMutableArray *arrayThird = [NSMutableArray arrayWithArray:@[@4]];
    
    [set addObject:arrayThird];
    
    [arrayThird addObject:@8];
    
    //拷贝一个set
    NSMutableSet *copySet = [set copy];
    
    NSLog(@"\nset == %@ \n copySet == %@ ", set, copySet);
}
@end
