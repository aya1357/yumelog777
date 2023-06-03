class Study < ApplicationRecord
  belongs_to :user
  has_one :memo, dependent: :destroy
  has_many :logs, dependent: :destroy

  validates :title, presence: true, length: { maximum: 255 }
  validates :total_number, presence: true, length: { maximum: 5000 }
  validates :start_number, presence: true, length: { maximum: 5000 }
  validates :end_number, presence: true, length: { maximum: 5000 }
  validates :target_number, presence: true, length: { maximum: 5000 }
  validates :start_day, presence: true
  validates :day_of_week, presence: true
  validates :status, inclusion: { in: [true, false] }

  #読書をする総ページ数を返す(目次から索引までのページ数)
  def total_pages
    end_number - start_number
  end

  #読書した総ページ数を返す
  def total_read_pages(user_id)
    logs.where(user_id: user_id).pluck(:study_number).sum
  end

  #読書したページ数を加味して、残りページ数を返す
  def remain_pages(user_id, studied_pages)
    remain_number = total_pages - (total_read_pages(user_id) + studied_pages.to_i)
    [remain_number, 0].max
  end

  #読書したページ数を加味して、自動計算終了日として終了日を返す
  def automatic_calculation_end_date(user_id, studied_pages)
    today = Time.zone.today
    remaining_days = remain_pages(user_id, studied_pages)
    end_day = remaining_days == 0 ? today : get_end_date(today, remaining_days)
  end

  #自動計算終了日を返す関数を設定
  def get_end_date(today, remaining_days)
    day_of_week_arr = day_of_week.split(",").map(&:to_i).sort
    remain_study_days = (remaining_days / target_number.to_f).ceil
    while remain_study_days >= 1
      if day_of_week_arr.include?(today.wday)
        remain_study_days -= 1
      end
      today += 1
    end
    (today - 1)
  end

  def self.bookregist_card_img(id)
    study = Study.find(id)

    #背景画像の設定
    image = MiniMagick::Image.open('./app/assets/images/frame.png')
    image.resize "800x418"

    #吹き出し画像の設定
    speech_bubble = MiniMagick::Image.open('./app/assets/images/frame1.png')
    speech_bubble.resize "450x490"

    #キャラクターの設定
    character_files = Dir.glob('./public/images/cards/*.png')
    random_character = character_files.sample
    character = MiniMagick::Image.open(random_character)
    character.resize "400x300"

    # キャラクターのコメントをランダム表示
    study_register_character_comment = StudyRegisterCharacterComment.new
    study_random_number = rand(1..10)
    study_random_comment = study_register_character_comment.get_study_register_character_comment(study_random_number)

    #総ページ数を計算
    total_pages = study.end_number - study.start_number
    total_days = (total_pages.to_f / study.target_number.to_f).ceil
    day_of_week_arr = study.day_of_week.split(",").map(&:to_i).sort
    while total_days >= 1
      if(day_of_week_arr).include?(study.start_day.wday)
        total_days -= 1
      end
      study.start_day += 1
    end
    target_end_date = (study.start_day - 1).strftime("%Y年%-m月%-d日")

    # 画像の合成
    image = image.composite(character) do |c|
      c.gravity "NorthWest"
      c.geometry "+0+95"
    end

    image = image.composite(speech_bubble) do |c|
      c.gravity "NorthWest"
      c.geometry "+290+45"
    end

    image.combine_options do |c|
      c.font "./app/assets/fonts/GenJyuuGothic-Bold.ttf"
      c.pointsize "40"
      c.gravity "NorthWest"
      c.fill "black"
      c.draw "text 315, 100'総#{total_pages}ページ'"
      c.draw "text 315, 170'1日目標#{study.target_number}ページ'"
      c.draw "text 315, 240'#{target_end_date} 終了'"
    end
    image.combine_options do |c|
      c.font "./app/assets/fonts/GenJyuuGothic-Bold.ttf"
      c.pointsize "40"
      c.gravity "NorthWest"
      c.fill "#3366FF" # 文字色を赤に変更
      c.draw "text 40, 60'#{study_random_comment}'"
    end
    image.format 'png'
  end
end
