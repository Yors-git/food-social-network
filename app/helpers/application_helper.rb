module ApplicationHelper
  def current_user
    User.find_by(id: session[:user_id])
  end

  def logged_in?
    !current_user.nil?
  end

  def check_signed_in
    new_opinion = (link_to 'New Review', '/opinions', method: :get, class: 'nav-link')
    logout = (link_to 'Logout', '/delete', method: :delete, class: 'nav-link')
    sign_up = (link_to 'Sign Up', '/users/new', method: :get, class: 'nav-link')
    sign_in = (link_to 'Log in', '/login', method: :get, class: 'nav-link')
    if logged_in?
      content_tag(:li, content_tag(
                         :a, 'Signed as: ' + current_user.username, href: user_path(current_user.id), class: 'nav-link'
                       ),
                  class: 'nav-item') +
        content_tag(:li, new_opinion, class: 'nav-item active') +
        content_tag(:li, logout, class: 'nav-item')
    else
      content_tag(:li, sign_in, class: 'nav-item') +
        content_tag(:span, '  /  ', class: 'navbar-text white-text') +
        content_tag(:li, sign_up, class: 'nav-item')
    end
  end

  def follow_user(user, followed_by)
    if user != current_user
      if user.followed_by(user).include?(current_user)  
        button_to 'Unfollow', delete_follower_user_path, method: :get, class: 'btn btn-danger'
      else
        button_to 'Follow', create_follower_user_path, method: :get, class: 'btn btn-secondary'
      end
    end
  end

  def show_messages
    result = ''
    result += "<div class='notice'><p> #{notice} </p></div>" if notice.present?
    result += "<div class='notice'><p> #{alert} </p></div>" if alert.present?
    result.html_safe
  end
end
