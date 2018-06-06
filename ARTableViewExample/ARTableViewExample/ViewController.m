//
//  ViewController.m
//  ARTableViewExample
//
//  Created by lanjiying on 2018/6/4.
//  Copyright © 2018年 lanjiying. All rights reserved.
//

#import "ViewController.h"
#import <UITableView+Adater.h>
#import "YATableViewAdapter.h"
#import "YAWebViewController.h"

@interface ViewController ()

@property(nonatomic, strong)UITableView *tableView;
@property(nonatomic, strong)YATableViewAdapter *adapter;
@property(nonatomic, strong)NSArray *htmlUrlArray;

@end

@implementation ViewController
#pragma mark -lifeCycle
- (void)viewDidLoad {
    
    [super viewDidLoad];
    
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self settingProperties];
    [self setupUI];
}
- (void)settingProperties
{
    _htmlUrlArray = @[@"https://github.com/onlyAngelia",@"http://lanjiying.allenqin.com",@"https://m.weibo.cn/p/1005052683037683",@"https://github.com/onlyAngelia/About-me",@"https://github.com/onlyAngelia/Share"];
}
- (void)setupUI
{
    [self.view addSubview:[self tableView]];
    [_adapter.sourceArray removeAllObjects];
    [_adapter appendSourceArray:@[@"Github",@"个人主页",@"微博",@"About-Me",@"Share"]];
}
#pragma mark - lazyLoad
- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        [_tableView setAdapter:[self adapter]];
        _tableView.tableFooterView = [[UIView alloc] init];
    }
    return _tableView;
}
- (YATableViewAdapter *)adapter
{
    if (!_adapter) {
        _adapter = [YATableViewAdapter instance];
    }
    return _adapter;
}
#pragma mark -event
- (void)rountEvent:(NSString *)eventName userInfo:(NSDictionary *)userInfo
{
    NSInvocation *invocation = [self strategyDictionary][eventName];
    [invocation setArgument:&userInfo atIndex:2];
    [invocation invoke];
}
- (NSDictionary *)strategyDictionary{
    
    NSDictionary *strategyDictionary = @{kCCellSeletedEventName:[self createInvocationWithSeletor:@selector(jumpToController:)]};
    return strategyDictionary;
    
}

- (void)jumpToController:(NSDictionary *)dictionary
{
    
    NSIndexPath *indexPath = dictionary[@"indexPath"];
    __weak typeof(&*self)weakself = self;
    dispatch_async(dispatch_get_main_queue(), ^{
        UINavigationController *navagationController = [[UINavigationController alloc] initWithRootViewController:[YAWebViewController showWKWebViewController:weakself.htmlUrlArray[indexPath.row]]];
        [weakself presentViewController:navagationController animated:YES completion:^{
            
        }];
    });
   
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
