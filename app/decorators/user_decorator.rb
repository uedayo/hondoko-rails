module UserDecorator
  def profile_image_url
    image_url.blank? ? TWITTER_IMAGE : image_url
  end
end