#
# Be sure to run `pod lib lint TDFModuleKit.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'TDFModuleKit'
  s.version      = "0.1.1"
  s.summary          = 'TDFModuleKit 模块抽象类，可以提供模块生命周期回调.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/tripleCC/TDFModuleKit'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'tripleCC' => 'triplec.linux@gmail.com' }
  s.source           = { :git => 'git@github.com:tripleCC/TDFModuleKit.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.tdfire_source do |s|  
    s.source_files = 'TDFModuleKit/Classes/**/*'
    s.public_header_files = ['TDFModuleKit/Classes/TDFModuleKit.h', 'TDFModuleKit/Classes/TDFModule.h']  
  end

  s.tdfire_binary do |s|
    s.vendored_framework = "#{s.name}.framework"
    s.source_files = "#{s.name}.framework/Headers/*"
    s.public_header_files = "#{s.name}.framework/Headers/*"
  end

  s.tdfire_set_binary_download_configurations_at_last
end
