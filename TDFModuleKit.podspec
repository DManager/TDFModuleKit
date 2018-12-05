#
# Be sure to run `pod lib lint TDFModuleKit.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'TDFModuleKit'
  s.version      = "1.0.4"
  s.summary          = 'basic TDFModuleKit 模块抽象类，可以提供模块生命周期回调.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TDFModuleKit 模块抽象类，可以提供模块生命周期回调.
                       DESC

  s.homepage         = 'https://github.com/tripleCC/TDFModuleKit'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'tripleCC' => 'triplec.linux@gmail.com' }
  s.source           = { :git => 'git@git.2dfire.net:ios/TDFModuleKit.git', :tag => s.version.to_s }
  s.ios.deployment_target = '8.0'

  tdfire_source_proc = lambda do |s|
    s.source_files = 'TDFModuleKit/Classes/**/*'
    s.public_header_files = ['TDFModuleKit/Classes/TDFModuleKit.h', 'TDFModuleKit/Classes/TDFModule.h']  
  end

  unless %w[tdfire_set_binary_download_configurations tdfire_source tdfire_binary].reduce(true) { |r, m| s.respond_to?(m) & r }
    tdfire_source_proc.call s
  else
    s.tdfire_source tdfire_source_proc
    s.tdfire_binary tdfire_source_proc
    s.tdfire_set_binary_download_configurations
  end
end
