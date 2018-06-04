//
//  UITableViewAdapter.m
//  KcalOfDriver
//
//  Created by 关门滢 on 2018/5/28.
//  Copyright © 2018年 liang. All rights reserved.
//   

#import "UITableViewAdapter.h"
#import "UIResponder+Rout.h"

static NSString *cellIdentifier = @"cellIdentifier";

@interface UITableViewAdapter()

@end
@implementation UITableViewAdapter

+ (instancetype)instance
{
    return [[[self class] alloc] initWithSource:@[]];
    
}
- (instancetype)initWithSource:(NSArray *)array
{
    self = [super init];
    if (self) {
        
        self.sourceArray = [[NSMutableArray alloc] initWithArray:array];
        
    }
    return self;
}
- (void)setSourceArray:(NSMutableArray *)sourceArray
{
    _sourceArray = sourceArray;
    [_tableView reloadData];
}
- (void)appendSourceArray:(NSArray *)array
{
    [_sourceArray addObjectsFromArray:array];
    [_tableView reloadData];
    
}
- (void)setView:(UITableView *)tableView
{
    _tableView = tableView;
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellIdentifier];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _sourceArray.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 45.0;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
        
    }
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    [_tableView rountEvent:kCCellSeletedEventName userInfo:@{@"indexPath":indexPath}];
    
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    [_tableView rountEvent:kCTableViewDidSrollEventName userInfo:@{@"scrollView":scrollView}];
}
@end
