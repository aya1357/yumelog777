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
      canonical: request.original_url,
      noindex: !Rails.env.production?,
      icon: [
        { href: image_url('header_logo1.png'), sizes: '180x180'}
      ],
      og: {
        site_name: 'tsumilog',
        title: '積みログ',
        description: '積みログは、積読本解消のための読書管理カレンダーアプリです。使い方は簡単！！本を登録すると残りページ数や終了日が一目で分かり、読書スケジュールを作成することが出来ます。',
        type: 'website',
        url: request.original_url,
        image: image_url('tsumilog_img.png'),
        locale: 'ja_JP',
      },
      twitter: {
        card: 'summary_large_image',
        site: '@your_twitter_account',
        title: page_title,
        description: '積みログは、積読本解消のための読書管理カレンダーアプリです。使い方は簡単!! 本を登録すると残りページ数や終了日が一目で分かり、読書スケジュールを作成することが出来ます。',
        image: image_url('tsumilog_img.png')
      }
    }
  end

  def twitter_share_message(user)
    message = "&text=【私の米（まい）ランキングはこれです!】%0a%0a  No1. #{ user.user_rankings.find_by(rank:1).rice.name }%0a%0a  No2. #{ user.user_rankings.find_by(rank:2).rice.name }%0a%0a  No3. #{ user.user_rankings.find_by(rank:3).rice.name }%0a%0a"
    return message
  end
end
