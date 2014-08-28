Pod::Spec.new do |s|
  s.name                = "StarPrinting"
  s.version             = "0.1.1"
  s.summary             = "Star print queue and persistence for iOS and Mac"
  s.homepage            = "https://github.com/opentable/star-printing"
  s.license             = 'MIT'
  s.authors             = { "Will Loderhose" => "will.loderhose@gmail.com" , "Matt Newberry" => "mattnewberry@me.com"}
  s.source              = { :git => "https://github.com/opentable/star-printing.git", :tag => '0.1.1' }
  s.requires_arc        = true
  s.source_files        = 'StarPrinting/*.{h,m}'
  s.platform            = :ios, '7.0'
  s.xcconfig            = { "FRAMEWORK_SEARCH_PATHS" => '"$(PODS_ROOT)/starIOPrintSDK/**"' }
    
  s.dependency 'starIOPrintSDK', '~> 3.10'
end
