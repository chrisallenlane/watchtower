require 'rdoc/task'
require 'rake/testtask'

RDoc::Task.new do |rdoc|
  files 		=['lib/models/vulnscanner.rb', 'lib/models/poi.rb']
  rdoc.rdoc_files.add(files)
  rdoc.main 	= 'README.rdoc'
  rdoc.title 	= 'WatchTower rdocs'
  rdoc.rdoc_dir	= 'doc'
  rdoc.options << '--line-numbers'
end

Rake::TestTask.new do |test|
	test.libs << 'test'
	test.test_files = ['test/test_poi.rb', 'test/test_vulnscanner.rb']
	test.verbose = false
end
