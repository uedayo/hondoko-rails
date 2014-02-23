module ItemEntityDecorator
  def background_class
    is_available? ? nil : 'class=danger'
  end

  def check_status_view
    is_available? ? I18n.t('view.available') : I18n.t('view.unavailable')
  end

  def operation_link
    case check_status
    when Status::ITEM_AVAILABLE
      link_to t('view.check_out'), "/check_outs/regist/#{item_id}", class: "btn btn-success"
    when Status::ITEM_OWED_BY_CURRENT_USER
      link_to t('view.check_in'), "/check_ins/regist/#{check_out_id}", class: "btn btn-danger"
    when Status::ITEM_UNAVAILABLE
      link_to t('view.request'), "/requsets/regist/#{item_id}", class: "btn btn-warning"
    end
  end

  def is_available?
    check_status == Status::ITEM_AVAILABLE
  end
end