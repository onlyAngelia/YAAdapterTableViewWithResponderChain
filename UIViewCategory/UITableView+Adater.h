//
//  UITableView+Adater.h
//  KcalOfDriver
//
//  Created by 关门滢 on 2018/5/28.
//  Copyright © 2018年 liang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UITableViewAdapter.h"
#import "UIResponder+Rout.h"
@interface UITableView (Adater)

- (void)setAdapter:(UITableViewAdapter *)adapter;//将TableView和Adapter关联起来

@end
