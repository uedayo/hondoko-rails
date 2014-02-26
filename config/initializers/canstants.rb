require 'ostruct'

USER_SMALL_IMAGE_WIDTH = 32
USER_IMAGE_WIDTH = 64
BOOK_SMALL_IMAGE_WIDTH = 75
BOOK_SMALL_LARGE_WIDTH = 150
EXAMPLE_EMAIL = "example@biglobe.co.jp"

# Amazon
AMAZON_BASE_URL = "http://amazon.co.jp/o/ASIN/"

# Twitter
TWITTER_IMAGE = "https://pbs.twimg.com/profile_images/2284174758/v65oai7fxn47qv9nectx_bigger.png"
TWITTER_USER_LOOKUP = "https://cdn.api.twitter.com/1/users/lookup.json?screen_name="

# Item status
ITEM_STATUS = OpenStruct.new ({
    AVAILABLE: 0,
    UNAVAILABLE: 1,
    OWED_BY_CURRENT_USER: 2
})
