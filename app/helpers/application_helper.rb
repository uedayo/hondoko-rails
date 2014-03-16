module ApplicationHelper
  def tt(label)
    arr = label.split(".")
    if arr.length <= 2
      model = arr[0].constantize
      if arr.length == 1
        return model.model_name.human
      else
        return model.human_attribute_name(arr[1])
      end
    end
    label
  end

  def bootstrap_class_for flash_type
    flash_type = flash_type.to_sym
    {
        success: 'alert-success',
        notice: 'alert-info',
        warning: 'alert-warning',
        danger: 'alert-danger',
    }[flash_type] || flash_type.to_s
  end

  def view_format(value)
    if value.present?
      value.html_safe
    else
      I18n.t("view.nil")
    end
  end

  def check_user_agent_for_mobile
    ua = request.env["HTTP_USER_AGENT"]
    ua.include?('Mobile') || ua.include?('Android')
  end
end
