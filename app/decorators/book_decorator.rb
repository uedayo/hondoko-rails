module BookDecorator
  def amazon_url
    AMAZON_BASE_URL + asin
  end

  def publication_date_formatted
    publication_date.gsub("-", "/")
  end

  def price_formatted
    price.to_s + " " + currency
  end
end