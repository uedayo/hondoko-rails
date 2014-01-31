class LendRepository
  def get_last_operation item_id
    CheckOut.get_last_operation item_id
  end
end