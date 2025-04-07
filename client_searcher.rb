require_relative './lib/client_searcher'
require 'optparse'
require 'json'

options = {}
OptionParser.new do |opts|
  opts.banner = "Usage: ruby client_searcher.rb [options]"
  opts.on("-s", "--search FIELD,QUERY", Array, "Search clients by specified field") { |q| options[:search] = q }
  opts.on("-d", "--duplicates", "Find duplicate emails") { options[:duplicates] = true }
end.parse!

searcher = ClientSearcher.new('clients.json')

if options[:search]
  field, query = options[:search]
  results = searcher.search_by_field(field, query)
  puts results.empty? ? "No matches found." : JSON.pretty_generate(results)
elsif options[:duplicates]
  duplicates = searcher.find_duplicate_emails
  puts duplicates.empty? ? "No duplicate emails found." : "Duplicate emails:\n#{duplicates.join("\n")}"
else
  puts "Please provide a valid option. Use -h for help."
end