class GithubController < ApplicationController
  def ask
  end

  def show
      @username =  params[:user_name]
      u = User.new(params[:user_name])
      @repositories = u.repo_names
  end
end
