require_relative '../lib/client_searcher'
require 'json'

RSpec.describe ClientSearcher do
  let(:test_data) do
    [
      { id: 1, full_name: "John Doe", email: "john.doe@gmail.com" },
      { id: 2, full_name: "Jane Smith", email: "jane.smith@yahoo.com" },
      { id: 3, full_name: "Another Jane Smith", email: "jane.smith@yahoo.com" }
    ]
  end

  let(:file_path) { 'spec/test_clients.json' }

  before do
    File.write(file_path, JSON.pretty_generate(test_data))
  end

  after do
    File.delete(file_path) if File.exist?(file_path)
  end

  subject { ClientSearcher.new(file_path) }

  it "searches by full_name" do
    expect(subject.search_by_field("full_name", "Jane").size).to eq(2)
  end

  it "searches by email" do
    expect(subject.search_by_field("email", "john.doe").size).to eq(1)
  end

  it "finds duplicate emails" do
    expect(subject.find_duplicate_emails).to contain_exactly("jane.smith@yahoo.com")
  end
end