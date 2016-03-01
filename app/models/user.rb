require 'httparty'
require 'byebug'
# require "#{Rails.root}/test/fixtures/playlist.json"

class User
  attr_reader :user_name, :user
  def initialize(user_name)
    # @search_term = JSON.parse(File.read("./test/fixtures/repos.json"))
    @user_repos = HTTParty.get("https://api.github.com/users/#{user_name}/repos")#/?sort=updated&direction=desc&access_token=#{ENV["GITHUB_KEY"]}")
    @user = HTTParty.get("https://api.github.com/users/#{user_name}")#/?access_token=#{ENV["GITHUB_KEY"]}")
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

  def followers
    @user["followers"]
  end

  def following
    @user["following"]
  end

  def image
    @user["avatar_url"]
  end

  def company
    @user["company"]
  end

  def location
    @user["location"]
  end

  def organizations
    @user["organizations_url"]
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

# user = User.new("mkg1")
# p user.image
