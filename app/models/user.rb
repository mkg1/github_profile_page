require 'httparty'
require 'byebug'
# require "#{Rails.root}/test/fixtures/playlist.json"

class User
  attr_reader :user_name
  def initialize(user_name)
    # @search_term = JSON.parse(File.read("./test/fixtures/repos.json"))
    @user_name = HTTParty.get("https://api.github.com/users/#{user_name}/repos")
  end

  # def show_repos
  #   repos = []
  #   @user_name.each do |x|
  #     repos << x["name"]
  #   end
  #   repos
  # end

  def repo_ids
    repo_ids = []
    @user_name.each do |x|
      repo_ids << x["id"]
    end
    repo_ids
  end

  def repo_names
    repo_names = []
    @user_name.each do |x|
      repo_names << x["name"]
    end
    repo_names
  end

  def repo_full_names
    repo_full_names = []
    @user_name.each do |x|
      repo_full_names << x["name"]
    end
    repo_full_names
  end
end

user = User.new("mkg1")
p user.repo_ids
