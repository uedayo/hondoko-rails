module ItemBaseDecorator
  def background_class
    is_available? ? nil : 'danger'
  end

  def check_status_view
    is_available? ? I18n.t('view.available') : I18n.t('view.unavailable')
  end

  def operation_link
    case check_status
    when ITEM_STATUS.AVAILABLE
      link_to t('view.check_out'), check_outs_path(item_id: item_id), remote: true, class: 'btn btn-success', method: 'post'
    when ITEM_STATUS.OWED_BY_CURRENT_USER
      link_to t('view.check_in'), check_ins_path(item_id: item_id), remote: true, class: 'btn btn-warning', method: 'post'
    when ITEM_STATUS.UNAVAILABLE
      '<a class="btn btn-danger">貸出中</a>'.html_safe
      #link_to t('view.checked_out'), {}, class: 'btn btn-danger'
    end
  end

  def is_available?
    check_status == ITEM_STATUS.AVAILABLE
  end

  def is_unavailable?
    check_status == ITEM_STATUS.UNAVAILABLE
  end
end