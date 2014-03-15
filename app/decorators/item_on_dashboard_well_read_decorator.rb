module ItemOnDashboardWellReadDecorator
  include ItemBaseDecorator

  def title_vol
    volume == 1 ? title : "#{title} (#{volume}冊目)"
  end
end