class LendController < ApplicationController
  require "amazon/ecs"

  def scan
    Amazon::Ecs.options = {
        associate_tag: ENV['associate_tag'],
        AWS_access_key_id: ENV['AWS_access_key_id'],
        AWS_secret_key: ENV['AWS_secret_key'],
        country: ENV['country']
    }

    res = Amazon::Ecs.item_search(params[:book_id], {sort: 'salesrank'})

    render text: res.marshal_dump
  end
end
