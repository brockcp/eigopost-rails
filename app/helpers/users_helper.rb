module UsersHelper

  def user_has_no_posts?
    current_user.posts.count == 0
  end

  def user_has_no_comments?
    current_user.comments.count == 0
  end
  
end
