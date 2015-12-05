#
# Be sure to run `pod lib lint GTNetInfo.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "GTNetInfo"
  s.version          = "0.3.0"
  s.summary          = "GTNetInfo provides a fast way to check your connection type."
  s.description      = <<-DESC
                       Use GTNetInfo to know if you're connected, what's the SSID of WiFi network or the type of cellular connection.
                       DESC
  s.homepage         = "https://github.com/neobeppe/GTNetInfo"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "Giuseppe Travasoni" => "giuseppe.travasoni@gmail.com" }
  s.source           = { :git => "https://github.com/neobeppe/GTNetInfo.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/neobeppe'

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
  s.resource_bundles = {
    'GTNetInfo' => ['Pod/Assets/*.png']
  }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'CoreTelephony', 'SystemConfiguration'
  s.dependency 'Reachability'
end
