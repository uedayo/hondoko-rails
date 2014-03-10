module ItemOnBookDecorator
  include ItemBaseDecorator
  def user_image_url
    image_url.blank? ? TWITTER_IMAGE : image_url
  end
end