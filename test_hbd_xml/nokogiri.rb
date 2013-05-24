require 'nokogiri'
require 'open-uri'

# Get a Nokogiri::HTML::Document for the page we’re interested in...

doc = Nokogiri::HTML(open('http://www.google.com/search?q=sparklemotion'))

# Do funky things with it using Nokogiri::XML::Node methods...


puts "=1==========================="
_num=0
####
# Search for nodes by css
doc.css('h3.r a').each do |link|
	print _num+=1, ' ',link.content, "\n"
end

puts "=2==========================="
_num=0
####
# Search for nodes by xpath
doc.xpath('//h3/a').each do |link|
	print _num+=1, ' ',link.content, "\n"
end

puts "=3==========================="
_num=0
####
# Or mix and match.
doc.search('h3.r a.l', '//h3/a').each do |link|
	print _num+=1, ' ',link.content, "\n"
end

puts "=4==========================="

