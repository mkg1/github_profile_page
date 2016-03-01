require 'test_helper'
# require 'JSON'
require "#{Rails.root}/app/models/user.rb"

class User
  def initialize(user_name)
    @user_name = JSON.parse(File.read("./test/fixtures/repos.json"))
  end
end

class UserTest < ActiveSupport::TestCase

  test "can initialize new user based on user_name" do
    u = User.new("mkg1")
    # p u[0]
    assert_equal "mkg1", u.user_name[0]["owner"]["login"]
  end

  test "retrieve repository names" do
    u = User.new("mkg1")
    assert_equal "battleship", u.repo_names[0]
  end
end
