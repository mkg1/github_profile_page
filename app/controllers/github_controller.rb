class GithubController < ApplicationController
  def ask
  end

  def show
      @username =  params[:user_name]
      u = User.new(params[:user_name])
      @repositories = u.repo_names
      @user_full_name = u.user_full_name
      @following = u.following
      @followers = u.followers
      @avatar = u.image
      @company = u.company
      @location = u.location
      @orgs = u.organizations
      @joined = u.joined
      @user_repos = u.user_repos
  end
end
