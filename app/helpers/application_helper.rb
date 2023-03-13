module ApplicationHelper
  def page_title(page_title = '')
    base_title = '積みログ  積読本解消アプリ'

    page_title.empty? ? base_title : page_title + ' | ' + base_title
  end
end
