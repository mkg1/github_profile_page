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
    p u["owner"]
    assert_raises "mkg1", u["owner"]["login"]
  end

  # test "retrieve random playlist" do
  #   r = Playlist.new("kpop")
  #   q = Playlist.new("kpop")
  #   refute r.random_playlist("long") == q.random_playlist("long")
  # end
end
