FactoryGirl.define do
  factory :check_in do
    check_out
  end

  factory :check_out do
    id                  1
    item
    user
    due_date            '2014-01-30'
  end

  factory :item do
    id                  1
    book
    volume              1
    area
  end

  factory :book do
    isbn                '9784839919849'
    asin                '4839919844'
    title               '30日でできる! OS自作入門'
    author              '川合 秀実'
    manufacturer        '毎日コミュニケーションズ'
    small_image         'http://ecx.images-amazon.com/images/I/51K0jUf%2BiEL._SL160_.jpg'
    medium_image        'http://ecx.images-amazon.com/images/I/51K0jUf%2BiEL._SL160_.jpg'
    large_image         'http://ecx.images-amazon.com/images/I/51K0jUf%2BiEL._SL160_.jpg'
    price               '3990'
    currency            'JPY'
    category
  end

  factory :user do
    screen_name         'twitter'
    last_name_kanji     '姓'
    first_name_kanji    '名'
    last_name_hiragana  'せい'
    first_name_hiragana 'めい'
    email                'example@example.com'
    image_url           'https://pbs.twimg.com/profile_images/2284174758/v65oai7fxn47qv9nectx_bigger.png'
    division
  end

  factory :area do
    name                '本棚'
    description         '本棚の説明'
  end

  factory :division do
    name                '本部'
    description         '本部の説明'
  end

  factory :category do
    name                'モバイルアプリ'
    color               'pink'
  end
end