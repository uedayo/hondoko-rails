module ApplicationHelper
  def tt(label)
    arr = label.split(".")
    if arr.length <= 2 then
      begin
        model = arr[0].constantize
      else
        if arr.length == 1
          return model.model_name.human
        else
          return model.human_attribute_name(arr[1])
        end
      end
    end
    label
  end

  def view_format(value)
    if value.present?
      value.html_safe
    else
      I18n.t("view.nil")
    end
  end
end
