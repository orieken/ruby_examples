require 'httparty'

class HTTPClient
  def initialize
    @http_client = HTTParty
  end

  def get(url)
    @http_client.get(url)
  end

  def delete(url)
    @http_client.delete(url)
  end
end

class User
  attr_accessor :id, :name
  # {"id"=>1,
  #  "name"=>"Leanne Graham",
  #  "username"=>"Bret",
  #  "email"=>"Sincere@april.biz",
  #  "address"=>{"street"=>"Kulas Light", "suite"=>"Apt. 556", "city"=>"Gwenborough", "zipcode"=>"92998-3874", "geo"=>{"lat"=>"-37.3159", "lng"=>"81.1496"}},
  #  "phone"=>"1-770-736-8031 x56442",
  #  "website"=>"hildegard.org",
  #  "company"=>{"name"=>"Romaguera-Crona", "catchPhrase"=>"Multi-layered client-server neural-net", "bs"=>"harness real-time e-markets"}}
  def initialize(hash)
    self.id = hash['id']
    self.name = hash['name']
  end
end

require 'rspec/expectations'

RSpec::Matchers.define :be_ok? do |expected|
  match do |actual|
    actual.code == expected
  end
end

describe HTTPClient do
  context '#get' do
    before do
      @http_client = HTTPClient.new
      @response = @http_client.get('https://jsonplaceholder.typicode.com/users')
    end

    it { expect(@response.code).to be(200) }
  end

  context '#delete' do
    before do
      @http_client = HTTPClient.new
      @response = @http_client.delete('https://jsonplaceholder.typicode.com/users')
    end

    it { expect(@response.code).to be(404) }
  end
end

describe HTTPClient, User do
  @http_client = HTTPClient.new
  @response = @http_client.get('https://jsonplaceholder.typicode.com/users')
  @users = @response.map { |u| User.new(u) }

  @users.each_with_index do |user, index|
    describe user do
      it "#{user.name} should have an id" do
        is_expected.to have_attributes(:id => index + 1)
      end
    end
  end
end
