Pod::Spec.new do |s|
  s.name             = "binChecker"
  s.version          = "0.1.0"
  s.summary          = "Pod to validate creditcard"

  s.homepage         = "https://github.com/thiagolioy/binChecker.git"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "Thiago Lioy" => "lioyufrj@gmail.com" }
  s.source           = { :git => "https://github.com/thiagolioy/binChecker.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/tplioy'

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
  s.resource_bundles = {
    'binChecker' => ['Pod/Assets/*.png']
  }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
