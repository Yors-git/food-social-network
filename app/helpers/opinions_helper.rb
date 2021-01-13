module OpinionsHelper
  def check_for_photo_op(opin)
    if opin.author.photo.attached?
      image_tag(url_for(opin.author.photo), alt:'user avatar', style:'height:60px')
    else
      image_tag(url_for('https://res.cloudinary.com/dzxasrolj/image/upload/v1610477078/burger_v84wnz.png'), alt:'user avatar', style:'height:60px')
    end
  end

  def check_for_avatar(usr)
    if usr.photo.attached?
      image_tag(url_for(usr.photo), alt:'user avatar', style:'height:30px')
    else
      image_tag(url_for('https://res.cloudinary.com/dzxasrolj/image/upload/v1610477078/burger_v84wnz.png'), alt:'user avatar', style:'height:30px')
    end
  end
end
