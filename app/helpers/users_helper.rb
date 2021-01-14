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
end
