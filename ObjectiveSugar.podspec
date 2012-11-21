Pod::Spec.new do |s|
  s.name         = "ObjectiveSugar"
  s.version      = "0.0.1"
  s.summary      = "ObjectiveC additions for humans. Ruby style."
  s.homepage     = "https://github.com/mneorr/ObjectiveSugar"
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author       = { "Marin Usalj" => "mneorr@gmail.com" }
  s.source       = { :git => "https://github.com/mneorr/ObjectiveSugar.git", :commit => "cd7bc11e5eb8cc417185cec2d219fa52c39a2a38" }

  s.ios.deployment_target = '5.0'
  s.osx.deployment_target = '10.7'

  s.source_files = 'Classes', 'src/**/*.{h,m}'
end
