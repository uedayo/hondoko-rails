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
      link_to t('view.check_out'), root_path, class: "btn btn-success"
    when Status::ITEM_OWED_BY_MYSELF
      link_to t('view.check_in'), root_path, class: "btn btn-danger"
    when Status::ITEM_UNAVAILABLE
      link_to t('view.request'), root_path, class: "btn btn-warning"
    end
  end

  def is_available?
    check_status == Status::ITEM_AVAILABLE
  end
end