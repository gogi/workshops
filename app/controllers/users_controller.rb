class UsersController < ApplicationController
  expose(:user)
  expose(:users)
  expose(:last_reviews) { user.last_reviews }

  def index
  end

  def show
  end
end
