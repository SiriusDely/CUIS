module ApplicationHelper

  def foundation_flash_class(level)
    case level.to_sym
    when :notice    then "callout primary"
    when :alert     then "callout warning"
    when :success   then "callout success"
    when :info      then "callout info"
    when :error     then "callout alert"
    when :secondary then "callout secondary"
    else "callout"
    end
  end

end
