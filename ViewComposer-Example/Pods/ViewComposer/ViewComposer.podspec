Pod::Spec.new do |s|

  s.name         = "ViewComposer"
  s.version      = "0.1.0"
  s.summary      = "Compose views using enums swiftly"

  s.description  = <<-DESC
                  Declare Buttons, Labels, StackViews etc as a list of enums.
                   DESC

  s.homepage     = "https://github.com/sajjon/ViewComposer"
  s.license      = 'MIT'
  s.author       = { "Alexander Cyon" => "alex.cyon@gmail.com" }
  s.social_media_url = "https://twitter.com/Redrum_237"

  s.source       = { :http => "#{s.homepage}/releases/download/#{s.version}/viewcomposer-#{s.version}.zip" }
  s.preserve_paths = '*'

end
