Pod::Spec.new do |s|
s.name         = 'JYDropDownMenu'
s.version      = '1.0.0'
s.summary      = 'ios JYDropDownMenu install by cocoapods'
s.homepage     = 'https://github.com/CodingEverydayForFuture/JYDropDownMenu'
s.license      = 'MIT'
s.authors      = {'CodingEverydayForFuture' => '15238033727@163.com'}
s.platform     = :ios, '8.0'
s.source       = {:git => 'https://github.com/CodingEverydayForFuture/JYDropDownMenu.git', :tag => s.version}
s.source_files = 'JYDropDownMenu/JYDropDownMenu/*.{h,m}'
s.requires_arc = true
s.subspec 'imgs' do |ss|
ss.source_files = 'JYDropDownMenu/JYDropDownMenu/imgs/*.png'
end

end


