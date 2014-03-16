Pod::Spec.new do |s|
  s.name         	= "SHLineGraphView"
  s.version      	= "1.0.1"
  s.summary      	= "`SHLineGraphView` a reusable UIView subclass to create Graphs"

  s.description  	= <<-DESC
                   `SHLineGraphView` a reusable UIView subclass to create Graphs
                   DESC

  s.homepage     	= "https://github.com/grevolution/SHLineGraphView"
  s.license      	= {:type => 'MIT'}
  s.author       	= { "Shan Ul Haq" => "g@grevolution.me" }

  s.platform     	= :ios
  s.source       	= { :git => "https://github.com/grevolution/SHLineGraphView.git", :tag => "1.0.1" }

  s.requires_arc	= true
  s.source_files  	= 'SHLineGraphView/SHLineGraphView/*.{h,m}'
  s.exclude_files 	= 'Classes/Exclude'

end
