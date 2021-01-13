module UsersHelper
  def check_profile_photo(user)
    if user.photo.attached?
      image_tag(url_for(user.photo), alt:'user avatar', style:'height:60px')
    else
      image_tag(url_for('https://res.cloudinary.com/dzxasrolj/image/upload/v1610477078/burger_v84wnz.png'), alt:'user avatar', style:'height:60px')
    end
  end

  def check_coverimage(user)
    if user.photo.attached?
      cl_image_tag(url_for(user.coverimage), alt:'user cover image')
    else
      cl_image_tag(url_for('https://res.cloudinary.com/dzxasrolj/image/upload/v1610477078/burger_v84wnz.png'), alt:'user cover image')
    end
  end

  def show_background_image
    url = "url('https://res.cloudinary.com/dzxasrolj/image/upload/v1610477078/" + "#{@user.coverimage.key}')" 
    content_tag(:div, '', class: 'cover-image', style: "background-image:#{url}")
  end
end

