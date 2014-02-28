class Book < ActiveRecord::Base
  belongs_to :category

  def to_param
    return isbn.parameterize
  end
  def self.find(key)
    return find_by_isbn(key)
  end
end
