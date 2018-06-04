//
//  UIResponder+Rout.m
//  KcalOfDriver
//
//  Created by 关门滢 on 2018/5/28.
//  Copyright © 2018年 liang. All rights reserved.
//

#import "UIResponder+Rout.h"

@implementation UIResponder (Rout)

- (void)rountEvent:(NSString *)eventName userInfo:(NSDictionary *)userInfo
{
    [[self nextResponder] rountEvent:eventName userInfo:userInfo];
}
- (NSInvocation *)createInvocationWithSeletor:(SEL)seletorname
{
    
    NSInvocation *invocaion = [NSInvocation invocationWithMethodSignature:[[self class] instanceMethodSignatureForSelector:seletorname]];
    [invocaion setTarget:self];
    [invocaion setSelector:seletorname];
    return invocaion;
    
}
@end
