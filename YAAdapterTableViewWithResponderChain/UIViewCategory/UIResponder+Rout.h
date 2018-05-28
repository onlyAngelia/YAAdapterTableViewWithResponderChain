//
//  UIResponder+Rout.h
//  KcalOfDriver
//
//  Created by 关门滢 on 2018/5/28.
//  Copyright © 2018年 liang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIResponder (Rout)

- (void)rountEvent:(NSString *)eventName userInfo:(NSDictionary *)userInfo;
- (NSInvocation *)createInvocationWithSeletor:(SEL)seletorname;

@end
