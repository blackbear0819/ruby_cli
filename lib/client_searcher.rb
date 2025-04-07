require 'json'

class ClientSearcher
  def initialize(file_path)
    @file_path = file_path
    @clients = load_clients
  end

  def load_clients
    JSON.parse(File.read(@file_path), symbolize_names: true)
  end

  def search_by_field(field, query)
    @clients.select do |client|
      client[field.to_sym].to_s.downcase.include?(query.downcase)
    rescue
      false
    end
  end

  def find_duplicate_emails
    email_counts = Hash.new(0)
    @clients.each { |client| email_counts[client[:email]] += 1 }
    email_counts.select { |_, count| count > 1 }.keys
  end
end