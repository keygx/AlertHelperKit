Pod::Spec.new do |s|
  s.name = "AlertHelperKit"
  s.version = "1.7.1"
  s.summary = "UIAlertController helper library in Swift"
  s.homepage = "https://github.com/keygx/AlertHelperKit"
  s.license = { :type => "MIT", :file => "LICENSE" }
  s.author = { "keygx" => "y.kagiyama@gmail.com" }
  s.social_media_url = "http://twitter.com/keygx"
  s.platform = :ios
  s.ios.deployment_target = '8.0'
  s.source = { :git => "https://github.com/keygx/AlertHelperKit.git", :tag => "#{s.version}" }
  s.source_files  = "source/**/*"
  s.requires_arc = true
end
