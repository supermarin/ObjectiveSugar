Pod::Spec.new do |s|
  s.name         = 'ObjectiveSugar'
  s.version      = '1.1.1'
  s.summary      = 'Objective C additions for humans. Write ObjC _like a boss_.'
  s.description  = '-map, -each, -select, unless(true){}, -includes, -upto, -downto, and many more!'
  s.homepage     = 'https://github.com/supermarin/ObjectiveSugar'
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.authors      = { 'Marin Usalj' => "marin2211@gmail.com",'Neil Cowburn' => 'git@neilcowburn.com'}
  s.source       = { :git => 'https://github.com/supermarin/ObjectiveSugar.git', :tag => s.version.to_s }
  s.social_media_url = "https://twitter.com/_supermarin"

  s.ios.deployment_target = '4.0'
  s.osx.deployment_target = '10.6'

  s.requires_arc = true

  s.source_files = 'Classes', 'Classes/**/*.{h,m}'
end

