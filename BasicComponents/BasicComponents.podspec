Pod::Spec.new do |s|

  s.name         = "BasicComponents"
  s.version      = "1.0.2"
  s.summary      = "Basic components of project."
  s.description  = "This is the basic components what I am using in my existing project."
  s.homepage     = "https://github.com/ccykevin/BasicComponents"
  s.license      = "MIT"
  s.author       = { "Kevin Cheng" => "kevin.cheng.development@gmail.com" }
  s.platform     = :ios, "9.0"
  s.source       = { :git => "https://github.com/ccykevin/BasicComponents.git", :tag => s.version }
  s.source_files = "BasicComponents/**/*.{h,m,swift}"

end
