# Uncomment the next line to define a global platform for your project
platform :ios, '9.0'
# ignore all warnings from all pods
inhibit_all_warnings!

target 'NearBy' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!
  
  # Pods for NearBy
  pod 'SnapKit'
  pod 'Gloss'
  pod 'Moya'
  pod 'Kingfisher'
  pod 'RxSwift', '~> 5'
  pod 'RxCocoa', '~> 5'
  pod 'NVActivityIndicatorView/Extended'
  pod 'DeviceKit'
  pod 'Toast-Swift'
  
  post_install do |pi|
      pi.pods_project.targets.each do |t|
        t.build_configurations.each do |config|
          config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '12.0'
        end
      end
  end
 
end

