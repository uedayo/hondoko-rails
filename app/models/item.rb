class Item < ActiveRecord::Base
  belongs_to :book
  belongs_to :area
end
