# ARTableView.podspec

[![CI Status](https://img.shields.io/travis/onlyAngelia/ARTableView.podspec.svg?style=flat)](https://travis-ci.org/onlyAngelia/ARTableView)
[![Version](https://img.shields.io/cocoapods/v/ARTableView.podspec.svg?style=flat)](https://cocoapods.org/pods/ARTableView)
[![License](https://img.shields.io/cocoapods/l/ARTableView.podspec.svg?style=flat)](https://cocoapods.org/pods/ARTableView)
[![Platform](https://img.shields.io/cocoapods/p/ARTableView.podspec.svg?style=flat)](https://cocoapods.org/pods/ARTableView)

## Example

1.create an adapter extends UITableViewAdapter,overwrite the delegate that you will use

2.Then setting UITableView 
```ruby
 [_tableView setAdapter:[self adapter]]
```
3.Next overwriting the func in tableView's superclass
```ruby
- (void)rountEvent:(NSString *)eventName userInfo:(NSDictionary *)userInfo
```

4.Last create NSInvocation according to eventName
```ruby
- (void)rountEvent:(NSString *)eventName userInfo:(NSDictionary *)userInfo
{
    NSInvocation *invocation = [self strategyDictionary][eventName];
    [invocation setArgument:&userInfo atIndex:2];
    [invocation invoke];
}
```

```ruby
- (NSDictionary *)strategyDictionary{
    
    NSDictionary *strategyDictionary = @{kCCellSeletedEventName:[self createInvocationWithSeletor:@selector(jumpToController:)]};
    return strategyDictionary;
    
}
```

1.创建一个adapter 继承自UITableViewAdapter，在新创建的adapter中重写可能会用到的类
2.设置tableView和adapter关联一起
```ruby
 [_tableView setAdapter:[self adapter]]
```
3.接收tableView的点击事件以及滑动事件，因这里是基于ResponderChain传递，所以只要在tableview的super中实现
```ruby
- (void)rountEvent:(NSString *)eventName userInfo:(NSDictionary *)userInfo
```
该方法即可监听tableView的事件。
好处:避免了大量的`block`和`delegate`

4.采用strategy模式避免n多if-else

每个点击事件最终要执行不同的`@selector`,所以我们可以采用策略模式，直接取消`[self performSelector:<#(nonnull SEL)#> withObject:<#(nullable id)#>]`将`@selector`定义为更深一层`NSInvocation`,用NSDictionary存储

```ruby
- (void)rountEvent:(NSString *)eventName userInfo:(NSDictionary *)userInfo
{
    NSInvocation *invocation = [self strategyDictionary][eventName];
    [invocation setArgument:&userInfo atIndex:2];
    [invocation invoke];
}
```

```ruby
- (NSDictionary *)strategyDictionary{
    
    NSDictionary *strategyDictionary = @{kCCellSeletedEventName:[self createInvocationWithSeletor:@selector(jumpToController:)]};
    return strategyDictionary;
    
}
```

## Requirements

you need to import"UITableView+adapter"

## Installation

ARTableView.podspec is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'ARTableView', '~> 1.0.2'
```
Then run a pod install inside your terminal

## Author

onlyAngelia, [关门滢](https://m.weibo.cn/p/1005052683037683)

## License

ARTableView.podspec is available under the MIT license. See the LICENSE file for more info.
