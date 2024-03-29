Pod::Spec.new do |s|
  s.name             = 'Swin'
  s.version          = '1.1.0'
  s.summary          = 'Litle Service locator in swift.'
  s.swift_version = '5.0'

  s.description      = <<-DESC
Is a Litle Service Locator in swift.
                       DESC

  s.homepage         = 'https://github.com/0sw2ld0/swin'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Oswaldo Leon' => 'oswaldo.leon9@gmail.com' }
  s.source           = { :git => 'https://github.com/0sw2ld0/swin.git', :tag => s.version.to_s }

  s.ios.deployment_target = '10.0'
  s.xcconfig = {
      'LD_RUNPATH_SEARCH_PATHS' => '$(FRAMEWORK_SEARCH_PATHS)',
      'BUILD_LIBRARY_FOR_DISTRIBUTION' => 'YES'
  }
  s.source_files = 'Swin/Classes/**/*'
  
  s.test_spec 'Tests' do |test_spec|
      test_spec.source_files = 'Swin/Tests/**/*'
    end
end
