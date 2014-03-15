module UserBaseDecorator
  def profile_image_url
    image_url.blank? ? TWITTER_IMAGE : image_url
  end

  def name_kanji
    "#{last_name_kanji} #{first_name_kanji}"
  end

  def screen_name_view
    screen_name.present? ? screen_name : I18n.t("view.nil")
  end
end