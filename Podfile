source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '11.3'
inhibit_all_warnings!

workspace 'ViewComposer'

SWIFTLINT = pod 'SwiftLint'

abstract_target 'Framework' do
  project 'ViewComposer'

  SWIFTLINT

  target 'ViewComposer' do
  end

  target 'ViewComposerTests' do
  end
end

abstract_target 'App' do
  project 'Example/Example'

  SWIFTLINT

  target 'Example' do
  end
end