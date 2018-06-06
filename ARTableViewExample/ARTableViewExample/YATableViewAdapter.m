//
//  YATableViewAdapter.m
//  ARTableViewExample
//
//  Created by lanjiying on 2018/6/4.
//  Copyright © 2018年 lanjiying. All rights reserved.
//

#import "YATableViewAdapter.h"

static NSString *kCCellIdentifier = @"YATableViewAdapterCell";

@implementation YATableViewAdapter

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCCellIdentifier];
    if (!cell) {

        cell = [self createTableViewCell:indexPath.row];
        
    }
    return cell;
}

- (UITableViewCell *)createTableViewCell:(NSInteger)row
{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kCCellIdentifier];
    cell.textLabel.text = self.sourceArray[row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}
@end
