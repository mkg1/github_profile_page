require 'httparty'
require 'byebug'
# require "#{Rails.root}/test/fixtures/playlist.json"

class User
  attr_reader :user_name, :user
  def initialize(user_name)
    # @search_term = JSON.parse(File.read("./test/fixtures/repos.json"))
    @user_repos = HTTParty.get("https://api.github.com/users/#{user_name}/repos")
    @user = HTTParty.get("https://api.github.com/users/#{user_name}")
  end
  # def show_repos
  #   repos = []
  #   @user_name.each do |x|
  #     repos << x["name"]
  #   end
  #   repos
  # end

  def user_full_name
    @user["name"]
  end

  def repo_ids
    repo_ids = []
    @user_repos.each do |x|
      repo_ids << x["id"]
    end
    repo_ids
  end

  def repo_names
    repo_names = []
    @user_repos.each do |x|
      repo_names << x["name"]
    end
    repo_names
  end

  def repo_full_names
    repo_full_names = []
    @user_repos.each do |x|
      repo_full_names << x["name"]
    end
    repo_full_names
  end
end

# user = User.new("masonfmatthews")
# user.user_full_name
