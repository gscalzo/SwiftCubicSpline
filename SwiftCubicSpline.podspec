Pod::Spec.new do |s|
  s.name             = "SwiftCubicSpline"
  s.version          = "0.1.0"
  s.summary          = "Cubic Spline in Swift."
  s.description      = <<-DESC
                       An simple cubic spline engine in Swift
                       DESC
  s.homepage         = "https://github.com/gscalzo/SwiftCubicSpline"
  s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "giordano scalzo" => "giordano.scalzo@gmail.com" }
  s.source           = { :git => "https://github.com/gscalzo/SwiftCubicSpline.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/giordanoscalzo'

  s.platform     = :ios, '8.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
  s.resource_bundles = {
    'SwiftCubicSpline' => ['Pod/Assets/*.png']
  }

  s.frameworks = 'Foundation', 'CoreGraphics'
  s.dependency 'SAMCubicSpline', '~> 0.1.1'
end
