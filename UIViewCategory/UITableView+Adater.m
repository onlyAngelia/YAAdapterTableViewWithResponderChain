//
//  UITableView+Adater.m
//  KcalOfDriver
//
//  Created by 关门滢 on 2018/5/28.
//  Copyright © 2018年 liang. All rights reserved.
//

#import "UITableView+Adater.h"

@implementation UITableView (Adater)
- (void)setAdapter:(UITableViewAdapter *)adapter
{
    [self setDelegate:adapter];
    [self setDataSource:adapter];
    [adapter setView:self];
    [self reloadData];
}
@end
