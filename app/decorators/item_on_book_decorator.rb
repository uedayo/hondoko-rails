module ItemOnBookDecorator
  include ItemBaseDecorator
  def user_image_url
    if !(user_id.present?)
      ""
    elsif image_url.blank?
      TWITTER_IMAGE
    else
      image_url
    end
  end
end