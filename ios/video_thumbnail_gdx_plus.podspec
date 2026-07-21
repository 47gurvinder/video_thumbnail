#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#
Pod::Spec.new do |s|
  s.name             = 'video_thumbnail_gdx_plus'
  s.version          = '0.5.8'
  s.summary          = 'Generate image thumbnails from local video files or video URLs.'
  s.description      = <<-DESC
A maintained fork of video_thumbnail for generating image thumbnails on iOS.
                       DESC
  s.homepage         = 'https://gurwinderdevx.com/'
  s.license          = { :file => '../LICENSE' }
  s.author           = {
    'Gurwinder Singh' => 'contact@gurwinderdevx.com',
    'John Zhong and original contributors' => 'john138@gmail.com'
  }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.public_header_files = 'Classes/**/*.h'
  s.pod_target_xcconfig = {
    'USER_HEADER_SEARCH_PATHS' => '$(inherited) ${PODS_ROOT}/libwebp/**'
  }
  s.dependency 'Flutter'
  s.dependency 'libwebp'

  s.ios.deployment_target = '12.0'
end
