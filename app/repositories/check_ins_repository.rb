class CheckInsRepository

  def create(check_out_id)
    check_in = CheckIn.new check_out_id: check_out_id
    check_in.save
  end

end