module BookDecorator
  def amazon_url
    AMAZON_BASE_URL + asin
  end

  def publication_date_formatted
    publication_date.present? ? publication_date.gsub("-", "/") : I18n.t("view.nil")
  end

  def price_formatted
    "#{currency_view}#{number_to_currency(price, format: '%n')}"
  end

  def currency_view
    currency.present? ? I18n.t("view.#{currency}") : I18n.t("view.nil")
  end

  def category_view
    category.present? ? category.name : I18n.t("view.nil")
  end

  def category_class
    category.present? ? "category-#{category.color}" : ""
  end
end