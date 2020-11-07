module ApplicationHelper
  def whole_title(page_title = '')
    default_title = 'Group Our Transportation App'
    if page_title == ''
      default_title
    else
      page_title + '|' + default_title
    end
  end   
end

# 'Group Our Transportation App'