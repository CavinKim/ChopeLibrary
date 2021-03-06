Pod::Spec.new do |s|
  s.ios.deployment_target = '7.0'
  
  s.author      = { 'Chope' => 'yoonhg2002@gmail.com' }
  s.name        = 'ChopeLibrary'
  s.version     = '0.1'
  s.license     = { :type => 'MIT' }
  s.homepage    = 'https://github.com/chope-yoonhg84/ChopeLibrary'
  s.summary     = 'Simple application library for iOS'

  s.source      = { :git => 'git@github.com:chope-yoonhg84/ChopeLibrary.git'}
  s.source_files = 'Classes/**/*.{h,m}'
  s.framework   = 'AudioToolbox', 'CFNetwork', 'CoreGraphics', 'CoreLocation', 'MobileCoreServices', 'QuartzCore', 'Security', 'StoreKit', 'SystemConfiguration'
  s.libraries   = 'z'
  s.requires_arc = true

  s.vendored_frameworks = 'Framework/*.framework'

  s.dependency 'AFNetworking', '~> 2.2'
  s.dependency 'StackBluriOS', '~> 0.0.1'
  s.dependency 'SDWebImage', '~> 3.6'

  s.dependency 'Facebook-iOS-SDK', '~> 3.10'

end