class Browse < ActiveRecord::Base
  belongs_to :user
  belongs_to :book
  belongs_to :search
end
