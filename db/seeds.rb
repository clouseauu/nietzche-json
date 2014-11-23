quotes_file = File.expand_path(File.join('..', 'quotes.txt'), __FILE__)

QUOTES = File.readlines(quotes_file).each { |l| l.chomp! }

QUOTES.each do |quote|
  Quote.create(quote: quote)
end