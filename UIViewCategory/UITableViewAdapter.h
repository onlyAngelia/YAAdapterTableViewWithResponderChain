//
//  UITableViewAdapter.h
//  KcalOfDriver
//
//  Created by 关门滢 on 2018/5/28.
//  Copyright © 2018年 liang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

static NSString *kCCellSeletedEventName = @"TableViewAdapterDidSeletedCellEvent";
static NSString *kCTableViewDidSrollEventName = @"TableViewAdapterDidSrollEvent";

@interface UITableViewAdapter : NSObject<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic, strong)NSMutableArray *sourceArray;//数据源
@property(nonatomic, strong)UITableView *tableView;//所用控件

+ (instancetype)instance;
- (void)appendSourceArray:(NSArray *)array;
- (void)setView:(UITableView*)tableView;

@end
