require 'httparty'
require 'byebug'
# require "#{Rails.root}/test/fixtures/playlist.json"

class User
  attr_reader :user_name
  def initialize(user_name)
    # @search_term = JSON.parse(File.read("./test/fixtures/repos.json"))
    @user_name = HTTParty.get("https://api.github.com/users/#{user_name}/repos")
  end

  def show_repos
    repos = []
    @user_name.each do |x|
      repos << x["name"]
    end
    repos
  end

end
