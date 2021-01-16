module OpinionsHelper
  def check_for_photo_op(opin)
    if opin.author.photo.attached?
      image_tag(url_for(opin.author.photo), alt: 'user avatar', style: 'height:60px')
    else
      image_tag(url_for('https://res.cloudinary.com/dzxasrolj/image/upload/v1610477078/burger_v84wnz.png'),
                alt: 'user avatar', style: 'height:60px')
    end
  end

  def check_for_avatar(usr)
    if usr.photo.attached?
      image_tag(url_for(usr.photo), alt: 'user avatar', style: 'height:30px')
    else
      image_tag(url_for('https://res.cloudinary.com/dzxasrolj/image/upload/v1610477078/burger_v84wnz.png'),
                alt: 'user avatar', style: 'height:30px')
    end
  end

  def show_each_opinion(opinions)
    opinions.each do |op|
      concat(content_tag(:li) do
        concat(content_tag(:div, class: 'container mt-3 px-0') do
          concat(content_tag(:div, class: 'd-flex border p-3 my-1') do
            concat(content_tag(:div, check_for_photo_op(op), class: 'center_op_img'))

            concat(
              content_tag(:div) do
                concat(
                  content_tag(:div) do
                    content_tag(:h4, class: 'px-2') do
                      concat(link_to(op.author.username, user_path(op.author.id), class: 'op_user_link'))
                    end
                  end
                )
                concat(content_tag(:p, op.text, class: 'px-2 mb-0'))
              end
            )
          end)
        end)
      end)
    end
  end

  def show_not_followed(_not_followed_users)
    @not_followed_users.each do |usr|
      concat(content_tag(:li) do
        concat(content_tag(:div, class: 'container px-0') do
          concat(content_tag(:div, class: 'd-flex p-1 mx-2') do
            concat(content_tag(:div, check_for_avatar(usr), class: 'center_who_img'))

            concat(
              content_tag(:p, class: 'px-2 mb-0') do
                concat(link_to(usr.username, user_path(usr.id), class: 'who_follow_link'))
              end
            )
          end)
        end)
      end)
    end
  end
end
