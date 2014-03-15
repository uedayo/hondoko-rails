module UserBaseDecorator
  def profile_image_url
    image_url.blank? ? TWITTER_IMAGE : image_url
  end

  def name_kanji
    "#{last_name_kanji} #{first_name_kanji}"
  end

  def name_hiragana
    "#{last_name_hiragana} #{first_name_hiragana}"
  end

  def name_roman
    "#{last_name_roman} #{first_name_roman}"
  end

  def screen_name_view
    screen_name.present? ? screen_name : I18n.t("view.nil")
  end
end