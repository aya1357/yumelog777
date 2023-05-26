module ApplicationHelper
  def page_title(page_title = '')
    base_title = '積みログ  積読本解消カレンダーアプリ'

    page_title.empty? ? base_title : page_title + ' | ' + base_title
  end

  def default_meta_tags
    {
      site: 'tsumilog',
      title: '積みログ',
      reverse: true,
      separator: '|',
      description: '積みログは、積読本解消のための読書管理カレンダーアプリです。使い方は簡単!! 本を登録すると残りページ数や終了日が一目で分かり、読書スケジュールを作成することが出来ます。',
      keywords: 'カレンダー, 積読本, ビジネス書, 資格本, 勉強本, 社会人',
      canonical: 'https://www.tsumilog.net/',
      noindex: !Rails.env.production?,
      icon: [
        { href: image_url('header_logo1.png'), sizes: '180x180'}
      ],
      og: {
        site_name: 'tsumilog',
        title: '積みログ',
        description: '積みログは、積読本解消のための読書管理カレンダーアプリです。使い方は簡単！残りページ数や終了日が一目で分かります。',
        type: 'website',
        url: 'https://www.tsumilog.net/',
        image: image_url('tsumilog_ogp.png'),
        locale: 'ja_JP',
      },
      twitter: {
        card: 'summary_large_image',
      }
    }
  end

  def twitter_share_message(study)
    message_parts = [
      "【積みログ】",
      "#{ study.title } を登録しました。",
      "1日目標は #{ study.target_number }ページです。",
      "目標終了予定日は #{ l target_end_date(study) }です。",
      "#読書",
      "#積読本解消",
      ""
    ]
    message = message_parts.map { |part| CGI.escape(part) }.join('%0A')
    return "&text=#{message}"
end

  def error_messages_for(resource)
    return unless resource.errors.any?

    content_tag :div, id: 'error_explanation' do
      content_tag(:ul) do
        resource.errors.full_messages.map do |message|
          content_tag(:li, message)
        end.join.html_safe
      end
    end
  end

end
