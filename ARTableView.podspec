Pod::Spec.new do |s|

s.name         = "ARTableView"
s.version      = "1.0.0"
s.summary      = "Adapter+Responder+Strategy+UITableView"
s.description  = "Adapter模式+基于Responder的Strategy模式封装的UITablView,将UITableView的代理方法交给Adapter管理，避免每次创建时要n多代理方法，在选中cell、滑动代理等方法用ResponderChain进行事件传递，结合Strategy消除了if-else，增加可读性"

s.homepage     = "https://github.com/onlyAngelia/YAAdapterTableViewWithResponderChain"
s.license      = { :type => 'Apache License, Version 2.0', :text => <<-LICENSE
Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at
http://www.apache.org/licenses/LICENSE-2.0
Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
LICENSE
}

s.author             = "onlyAngelia"
s.social_media_url   = "https://m.weibo.cn/p/1005052683037683"
s.platform     = :ios, "8.0"
s.source       = { :git => "https://github.com/onlyAngelia/YAAdapterTableViewWithResponderChain.git", :tag => "1.0.0" }

s.source_files  = "UIViewCategory/**/*.{h,m}"
s.framework  = "UIKit"
s.requires_arc = true

end
