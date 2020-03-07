#
# Be sure to run `pod lib lint SwiftCubicSpline.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'SwiftCubicSpline'
  s.version          = '2.0.0'
  s.summary          = 'Cubic Spline in Swift.'

  s.description      = <<-DESC
  An simple cubic spline engine in Swift
                       DESC

  s.homepage         = 'https://github.com/gscalzo/SwiftCubicSpline'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Giordano Scalzo' => 'giordano.scalzo@effectivecode.co.uk' }
  s.source           = { :git => 'https://github.com/gscalzo/SwiftCubicSpline.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/giordanoscalzo'

  s.ios.deployment_target = '10.0'

  s.source_files = 'SwiftCubicSpline/Classes/**/*'
  s.frameworks = 'Foundation', 'CoreGraphics'
end
