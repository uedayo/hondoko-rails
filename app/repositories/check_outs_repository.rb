class CheckOutsRepository

  def create(item_id, current_user)
    check_out = CheckOut.new item_id: item_id, user_id: current_user.id, due_date: Date.today + LOAN_PERIOD
    check_out.save
  end

end