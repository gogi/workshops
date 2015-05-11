class ReviewDecorator < Draper::Decorator
  delegate_all

  def author
    user = review.user
    user.firstname.to_s + ' ' + user.lastname.to_s
  end
end
