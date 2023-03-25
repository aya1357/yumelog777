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
      separator: '|',   #Webサイト名とページタイトルを区切るために使用されるテキスト
      description: '積みログは、積読本解消のための読書管理カレンダーアプリです。使い方は簡単。本を登録すると残りページ数や終了日が一目で分かり、自分の読書スケジュールを作成することが出来ます。',
      keywords: 'カレンダー, 積読本, ビジネス書, 資格本, 勉強本, 社会人',   #キーワードを「,」区切りで設定する
      canonical: request.original_url,   #優先するurlを指定する
      noindex: ! Rails.env.production?,
      icon: [                    #favicon、apple用アイコンを指定する
        { href: image_url('header_logo1.png'), sizes: '180x180'}
      ],
      og: {
        site_name: 'tsumilog',
        title: '積みログ',
        description: '積みログは、積読本解消のための読書管理カレンダーアプリです。使い方は簡単!本を登録すると残りページ数や終了日が一目で分かり、自分の読書スケジュールを作成することが出来ます。',
        type: 'website',
        url: request.original_url,
        image: image_url('tsumilog_img.png'),
        locale: 'ja_JP',
      },
      twitter: {
        card: 'summary_large_image',
        site: '@ツイッターのアカウント名',
      }
    }
  end
end
