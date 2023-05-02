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
        description: '積みログは、積読本解消のための読書管理カレンダーアプリです。残りページ数や終了日の計算機能も搭載しています。',
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
    message = "&text=【積みログ】%0A #{ study.title } を登録しました。%0A目標終了予定日は #{ l target_end_date(study) }です。#積みログ #積読本解消 #カレンダーアプリ"
    return message
  end

end
