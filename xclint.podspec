Pod::Spec.new do |s|
  s.name           = 'xclint'
  s.version        = '0.1.1'
  s.summary        = 'Lint your Xcode projects using this command line tool written in Swift'
  s.homepage       = 'https://github.com/esttorhe/xclint'
  s.license        = { :type => 'MIT', :file => 'LICENSE.md' }
  s.author         = { 'Pedro Piñera Buendía' => 'pepibumur@gmail.com' }
  s.source         = { :http => "#{s.homepage}/releases/download/#{s.version}/xcodeprojlint.zip" }
  s.preserve_paths = '*'
  s.exclude_files  = '**/file.zip'
end
