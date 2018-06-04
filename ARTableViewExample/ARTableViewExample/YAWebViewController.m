//
//  YAWebViewController.m
//  ARTableViewExample
//
//  Created by yangxiuying on 2018/6/4.
//  Copyright © 2018年 lanjiying. All rights reserved.
//

#import "YAWebViewController.h"
#import <WebKit/WebKit.h>

@interface YAWebViewController ()<WKNavigationDelegate>

@property(nonatomic,  copy) NSString * url;
@property(nonatomic,strong) WKWebView * webView;
@property(nonatomic,weak) CALayer * progresslayer;
@property(nonatomic,weak) UIView * progress;

@end

@implementation YAWebViewController

+(instancetype)showWKWebViewController:(NSString *)url
{
    YAWebViewController *webViewController = [[YAWebViewController alloc] init];
    webViewController.url = url;
    return webViewController;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
}
- (void)setupUI
{
     self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:[self rightBarItemButton]];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"navigation_Image.png"] forBarMetrics:UIBarMetricsDefault];
    
     _webView = [[WKWebView alloc] initWithFrame:CGRectMake(0, 0,[UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - self.navigationController.navigationBar.bounds.size.height  -[UIApplication sharedApplication].statusBarFrame.size.height)];
    _webView.navigationDelegate = self;
    NSURLRequest * request = [NSURLRequest requestWithURL:[NSURL URLWithString:self.url] cachePolicy:NSURLRequestReloadRevalidatingCacheData timeoutInterval:20.0];
    //    [request setValue: forKey:@"Cookie"];
    [self.webView loadRequest:request];
    
    [self.webView addObserver:self forKeyPath:@"estimatedProgress" options:NSKeyValueObservingOptionNew context:nil];
    
    [self.view addSubview:self.webView];
    [self settingLayer];
    
}
//设置进度条
- (void)settingLayer
{
    UIView *progress = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMinY(self.webView.frame), 0, 3)];
    progress.backgroundColor = [UIColor clearColor];
    self.progress=progress;
    CALayer *layer = [CALayer layer];
    layer.frame = CGRectMake(0, 0,30.0, 3);
    layer.backgroundColor =  [UIColor colorWithRed:255.0/255.0 green:105.0/255.0 blue:105.0/255.0 alpha:1.0].CGColor;
    [progress.layer addSublayer:layer];
     self.progresslayer = layer;
     [self.view addSubview:_progress];
}
- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation
{
    //设置title
    self.title = webView.title;
    
}
-(void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler
{
    if (navigationAction.targetFrame == nil) {  
        [webView loadRequest:navigationAction.request];
    }
    decisionHandler(WKNavigationActionPolicyAllow);
}
-(WKWebView *)webView:(WKWebView *)webView createWebViewWithConfiguration:(WKWebViewConfiguration *)configuration forNavigationAction:(WKNavigationAction *)navigationAction windowFeatures:(WKWindowFeatures *)windowFeatures
{

    if (!navigationAction.targetFrame.isMainFrame) {
        [webView loadRequest:navigationAction.request];
    }
    return nil;
}
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context
{
    if ([keyPath isEqualToString:@"estimatedProgress"]) {
        
        self.progresslayer.opacity = 1;
        if ([change[@"new"] floatValue] < [change[@"old"] floatValue]) {
            return;
        }
        self.progresslayer.frame = CGRectMake(0, 0, self.view.bounds.size.width * [change[@"new"] floatValue], 3);
        if ([change[@"new"] floatValue] == 1) {
            
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(.4 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                
                self.progresslayer.opacity = 0;
                
            });
            
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                
                self.progresslayer.frame = CGRectMake(0, 0, 0, 3);
            });
        }
        
    }else{
        
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
    
}

#pragma mark - 返回按钮
- (UIButton *)rightBarItemButton
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 0, 60.0, 60.0);
    button.titleLabel.font = [UIFont boldSystemFontOfSize:22.0];
    button.titleLabel.textAlignment = NSTextAlignmentRight;
    [button setTitle:@"X" forState:UIControlStateNormal];
    [button setTitle:@"X" forState:UIControlStateSelected];
    [button addTarget:self action:@selector(dissmissCurrentController) forControlEvents:UIControlEventTouchUpInside];
    return button;
}
- (void)dissmissCurrentController
{
    __weak typeof(&*self)weakself = self;
    dispatch_async(dispatch_get_main_queue(), ^{
        [weakself dismissViewControllerAnimated:YES completion:^{
            
        }];
    });
   
}
- (void)dealloc
{
    [_webView removeObserver:self forKeyPath:@"estimatedProgress"];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
