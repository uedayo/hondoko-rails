module ItemEntityDecorator
  def background_class
    is_available? ? nil : 'class=danger'
  end

  def check_status_view
    is_available? ? I18n.t('view.available') : I18n.t('view.unavailable')
  end

  def operation_link
    if is_available?
      link_to t('view.check_out'), root_path, class: "btn btn-success"
    else
      link_to t('view.request'), root_path, class: "btn btn-warning"
    end
  end

  def is_available?
    check_status == Status::ITEM_AVAILABLE
  end
end