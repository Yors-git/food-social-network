module UsersHelper
  def check_profile_photo(user)
    if user.photo.attached?
      image_tag(url_for(user.photo), alt: 'user avatar', style: 'height:60px')
    else
      image_tag(url_for('https://res.cloudinary.com/dzxasrolj/image/upload/v1610477078/burger_v84wnz.png'),
                alt: 'user avatar', style: 'height:60px')
    end
  end

  def show_background_image(user)
    if user.coverimage.attached?
      url = "url('https://res.cloudinary.com/dzxasrolj/image/upload/v1610477078/" + "#{user.coverimage.key}')"
      content_tag(:div, '', class: 'cover-image', style: "background-image:#{url}")
    else
      url1 = "url('https://res.cloudinary.com/dzxasrolj/image/upload/v1610556116/vinicius-amnx-amano-DL4OseW7WD8-unsplash_sh0lyz.jpg')"
      content_tag(:div, '', class: 'cover-image', style: "background-image:#{url1}")
    end
  end

  def show_followed_by(followed_by)
    followed_by.each do |usr|
      concat(content_tag(:li) do
        concat(content_tag(:div, class:'container px-0') do
          concat(content_tag(:div, class:'d-flex p-1 mx-2') do
            concat(content_tag(:div, check_for_avatar(usr),class:'center_who_img'))
            concat(
              content_tag(:p, class:'px-2 mb-0') do 
                concat(link_to usr.username, user_path(usr.id), class:'who_follow_link')
              end
            )
          end)
        end)
      end)
    end
  end

  def show_all_users(users)
    @users.each do |usr|
      concat(content_tag(:li, class:'container mt-3 px-0') do
        concat(content_tag(:div, class:'d-flex border p-1') do
          concat(content_tag(:div, check_profile_photo(usr), class:'center_op_img'))
          concat(
            content_tag(:h4, class:'px-2 mt-3') do
              concat(link_to usr.username, user_path(usr.id), class: 'op_user_link')
            end
          )
        end)
      end)
    end
  end
end
