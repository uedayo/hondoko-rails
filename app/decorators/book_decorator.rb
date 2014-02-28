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
    category.present? ? "#{category_id}.#{category.name}" : I18n.t("view.nil")
  end

  def category_class
    category.present? ? "category-#{category.color}" : ""
  end
end