require 'ostruct'

USER_SMALL_IMAGE_WIDTH = 32
USER_IMAGE_WIDTH = 64
BOOK_SMALL_IMAGE_WIDTH = 30
BOOK_MEDIUM_IMAGE_WIDTH = 50
BOOK_LARGE_IMAGE_WIDTH = 150
EXAMPLE_EMAIL = "example@biglobe.co.jp"

# Amazon
AMAZON_BASE_URL = "http://amazon.co.jp/o/ASIN/"

# Twitter
TWITTER_IMAGE = "https://pbs.twimg.com/profile_images/1051567310/kihon_a_01_bigger.gif"
TWITTER_USER_LOOKUP = "https://cdn.api.twitter.com/1/users/lookup.json?screen_name="

# Item status
ITEM_STATUS = OpenStruct.new ({
    AVAILABLE: 0,
    UNAVAILABLE: 1,
    OWED_BY_CURRENT_USER: 2
})

# Domain setting
LOAN_PERIOD = 14
DEFAULT_VOLUME = 1
DEFAULT_AREA_ID = 1

DASHBOARD_ITEMS_AMOUNT = 5