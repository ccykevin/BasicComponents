Pod::Spec.new do |s|

  s.name         = "BasicComponents"
  s.version      = "1.0.0"
  s.summary      = "Basic components of project."
  s.description  = "This is the basic components which I am using in project."
  s.homepage     = "https://github.com/ccykevin/BasicComponents"
  s.license      = "MIT"
  s.author             = { "Kevin Cheng" => "chunyinkevin@gmail.com" }
  s.platform     = :ios, "9.0"
  s.source       = { :git => "https://github.com/ccykevin/BasicComponents.git", :tag => "1.0.0" }
  s.source_files  = "BasicComponents/**/*"

end
