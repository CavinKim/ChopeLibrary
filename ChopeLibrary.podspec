Pod::Spec.new do |s|
  s.ios.deployment_target = '7.0'
  s.author   = { 'Chope' => 'yoonhg2002@gmail.com' }
  s.name         = 'ChopeLibrary'
  s.version      = '0.1'
  s.homepage     = 'https://github.com/chope-yoonhg84/ChopeLibrary'
  s.source   = { :git => 'git@github.com:chope-yoonhg84/ChopeLibrary.git'}
  s.requires_arc  = true

  s.dependency 'AFNetworking', '~>2.0.0'
  s.dependency 'StackBluriOS', '~>0.0.1'

end