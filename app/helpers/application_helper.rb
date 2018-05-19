# frozen_string_literal: true

module ApplicationHelper
  def foundation_flash_class(level)
    case level.to_sym
    when :notice    then 'callout primary'
    when :alert     then 'callout warning'
    when :success   then 'callout success'
    when :info      then 'callout info'
    when :error     then 'callout alert'
    when :secondary then 'callout secondary'
    else 'callout'
    end
  end

  # def resource_name
  #   :user
  # end

  # def resource
  #   @resource ||= User.new
  # end

  # def devise_mapping
  #   logger.debug "asdf"
  #   @devise_mapping ||= Devise.mappings[:user]
  # end
end
