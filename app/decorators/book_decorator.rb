module BookDecorator
  def amazon_url
    AMAZON_BASE_URL + asin
  end

  def publication_date_formatted
    publication_date.gsub("-", "/")
  end

  def price_formatted
    "#{currency_view}#{price}"
  end

  def currency_view
    I18n.t("view.#{currency}")
  end

  def category_view
    "#{category_id}.#{category.name}"
  end

end