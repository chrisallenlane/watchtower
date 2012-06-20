require 'csv'
require 'fileutils'
require 'open-uri'
require 'rdoc/task'
require 'rake/testtask'

namespace :docs do
    RDoc::Task.new do |rdoc|
      files 		=['lib/models/vulnscanner.rb', 'lib/models/poi.rb', 'lib/models/signature.rb']
      rdoc.rdoc_files.add(files)
      rdoc.main 	= 'README.rdoc'
      rdoc.title 	= 'WatchTower rdocs'
      rdoc.rdoc_dir	= 'doc'
      rdoc.options << '--line-numbers'
    end
    
    desc "Builds the example reports"
    task :examples do
        puts 'Generating example reports...'
        
        # mark the current directory
        cwd = File.expand_path File.dirname(__FILE__)
        
        # download and extract w3 total cache to build some sample reports
        print 'Downloading W3 Total Cache plugin for scanning...'
        `cd /tmp/; wget 'http://downloads.wordpress.org/plugin/w3-total-cache.zip'; unzip '/tmp/w3-total-cache.zip'` 
        puts 'Done.'
        
        # build sample reports for all file types
        ## plain text ##
        print 'Generating a plain-text report...'
        `#{cwd}/watchtower -s /tmp/w3-total-cache/ -p 'W3 Total Cache Plugin' -C 7 -o txt > #{cwd}/examples/report.txt`
        puts 'Done.'
        ## csv ##
        print 'Generating a CSV report...'
        `#{cwd}/watchtower -s /tmp/w3-total-cache/ -p 'W3 Total Cache Plugin' -C 7 -o csv > #{cwd}/examples/report.csv`
        puts 'Done.'
        ## xml ##
        print 'Generating an XML report...'
        `#{cwd}/watchtower -s /tmp/w3-total-cache/ -p 'W3 Total Cache Plugin' -C 7 -o xml > #{cwd}/examples/report.xml`
        puts 'Done.'
        ## xml ##
        print 'Generating a Markdown report...'
        `#{cwd}/watchtower -s /tmp/w3-total-cache/ -p 'W3 Total Cache Plugin' -C 7 -o markdown > #{cwd}/examples/report.markdown`
        puts 'Done.'
        ## html ##
        print 'Generating an HTML report...'
        `#{cwd}/watchtower -s /tmp/w3-total-cache/ -p 'W3 Total Cache Plugin' -C 7 -o html > #{cwd}/examples/report.html`
        puts 'Done.'
        
        # clean up
        puts 'Cleaning up...'
        `rm '/tmp/w3-total-cache.zip'`
        `rm -rf '/tmp/w3-total-cache/'`
        
        puts 'The example reports have been generated.'
    end 
end


namespace :sigs do

    desc "Generates signatures files based off of known malware domains and IP addresses"
    task :generate_blocklists do

        # download the entire Malware Domain List
        puts 'Downloading updated blocklist from malwaredomainlist.com...'        
        
        csv = open('http://www.malwaredomainlist.com/mdlcsv.php').read
        
        # generate the blocklists
        puts 'Download complete. Generating blocklists...'
        
        # buffer the signatures produced
        ip_signatures     = ''
        domain_signatures = '';
        
        # iterate over the downloaded signatures file
        CSV.parse(csv) do |row|
          # buffer the new signatures
          ip_signatures     += "\tSignature.new({:literal => '#{row[2]}}'),\n" unless ip_signatures.chomp.eql? '-';
          domain_signatures += "\tSignature.new({:literal => '#{row[3]}}'),\n" unless domain_signatures.chomp.eql? '-';
        end
        
        # assemble the Ruby for the signatures file
        ruby = <<-sigs
$signatures[:blocklists] ||= {}

$signatures[:blocklists][:malicious_domains] = [
#{domain_signatures}
]

$signatures[:blocklists][:malicious_ips] = [
#{ip_signatures}
]
sigs

        # flush the buffers to a signatures file
        puts 'Flushing buffers to file...'
        File.open('./signatures/blocklist.rb', 'w') {|f| f.write(ruby) }
        puts 'Complete.'
    end
end


Rake::TestTask.new do |test|
	test.libs << 'test'
	test.test_files = ['test/test_poi.rb', 'test/test_vulnscanner.rb', 'test/test_signature.rb', 'test/test_reports.rb']
	test.verbose = false
end
