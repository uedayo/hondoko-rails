class LendRepository
  def get_last_operation item_id
    Operation.get_last_operation item_id
  end
end