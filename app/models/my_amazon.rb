class MyAmazon
  def self.find book_id
    Amazon::Ecs.options = {
        associate_tag: ENV['associate_tag'],
        AWS_access_key_id: ENV['AWS_access_key_id'],
        AWS_secret_key: ENV['AWS_secret_key'],
        country: ENV['country']
    }

    Amazon::Ecs.item_lookup(
        book_id,
        {
            response_group: 'Large,Offers',
            sort: 'salesrank',
            id_type: 'ISBN',
            search_index: 'Books',
            power: 'binding:not kindle',
        }
    )
  end
end