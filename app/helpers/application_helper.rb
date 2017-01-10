module ApplicationHelper

  def flash_message
    message = ''
    message << (content_tag :div, flash[:info], class: 'text-info') if flash[:info]
    message << (content_tag :div, flash[:danger], class: 'text-danger') if flash[:danger]
    sanitize message
  end
end
