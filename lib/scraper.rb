require 'open-uri'
require 'nokogiri'
require 'pry'

url = "http://www.goodreads.com/author/quotes/1938.Friedrich_Nietzsche"

(1...65).each do |page|

doc = Nokogiri::HTML(open("#{url}?page=#{page}"))

quote_elements = doc.css ".quoteText"

quote_elements.each do |quote|

  file = File.expand_path(File.join('..', '..', 'db', 'quotes.txt'), __FILE__)

  text = /&ldquo;(.*)&rdquo;/.match(quote.to_s)[1]

  open(file, 'a') do |f|
    f << "#{text}\n"
  end

end

`sleep 2`

end