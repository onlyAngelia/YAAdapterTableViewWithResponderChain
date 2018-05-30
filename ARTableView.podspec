Pod::Spec.new do |s|
s.name         = "ARTableView"
s.version      = "1.0.0"
s.summary      = "Adapter+Responder+Strategy+UITableView"
s.description  = "Adapter模式+基于Responder的Strategy模式封装的UITablView,将UITableView的代理方法交给Adapter管理，避免每次创建时要n多代理方法，在选中cell、滑动代理等方法用ResponderChain进行事件传递，结合Strategy消除了if-else，增加可读性"
s.homepage     = "https://github.com/onlyAngelia/YAAdapterTableViewWithResponderChain"
s.license      = 'MIT'
s.author             = "onlyAngelia"
s.social_media_url   = "https://m.weibo.cn/p/1005052683037683"
s.ios.deployment_target = '8.0'
s.source       = { :git => "https://github.com/onlyAngelia/YAAdapterTableViewWithResponderChain.git", :tag => s.version }
s.source_files  = "UIViewCategory/**/*.{h,m}"
s.framework  = "UIKit"
s.requires_arc = true
end
