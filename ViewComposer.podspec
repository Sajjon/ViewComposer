Pod::Spec.new do |s|

  s.name         = "ViewComposer"
  s.version      = "0.2.7"
  s.summary      = "Compose views using enums swiftly"

  s.description  = <<-DESC
                  Declare Buttons, Labels, StackViews etc as a list of enums.
                   DESC

  s.homepage     = "https://github.com/sajjon/ViewComposer"
  s.license      = 'MIT'
  s.author       = { "Alexander Cyon" => "alex.cyon@gmail.com" }
  s.social_media_url = "https://twitter.com/Redrum_237"
  s.source = { :git => 'https://github.com/Sajjon/ViewComposer.git', :tag => s.version }
  s.source_files = 'Source/Classes/**/*.swift', 'Source/Sourcery/Generated/*.swift'
  s.ios.deployment_target = '9.0'
end
