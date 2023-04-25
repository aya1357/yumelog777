class Log < ApplicationRecord
  belongs_to :user
  belongs_to :study

  with_options presence: true do
    validates :log_date
    validates :study_number
  end

  def self.character_card_img(id)
    log = Log.find(id)

    #背景画像の設定
    image = MiniMagick::Image.open('./app/assets/images/frame.png')
    image.resize "800x418"

    #吹き出し画像の設定
    speech_bubble = MiniMagick::Image.open('./app/assets/images/speech_bubble.png')
    speech_bubble.resize "420x320"

    #キャラクターの設定
    character_files = Dir.glob('./app/assets/images/cards/*.png')
    random_character = character_files.sample
    character = MiniMagick::Image.open(random_character)
    character.resize "310x200"

    #テキストの設定
    log_date = log.log_date.strftime('%Y年%m月%d日')
    total_read_pages = Log.where(log_date: log.log_date).pluck(:study_number).sum

    # キャラクターのコメントをランダム表示
    character_comment = CharacterComment.new
    random_number = rand(1..2)
    random_comment = character_comment.get_character_comment(random_number)

    # 画像の合成
    image = image.composite(character) do |c|
      c.gravity "NorthWest"
      c.geometry "+60+210"
    end

    image = image.composite(speech_bubble) do |c|
      c.gravity "NorthWest"
      c.geometry "+340+90"
    end

    image.combine_options do |c|
      c.font "./app/assets/fonts/GenJyuuGothic-Bold.ttf"
      c.pointsize "30"
      c.gravity "NorthWest"
      c.fill "black"
      c.draw "text 130, 45'#{log_date}'"
      c.draw "text 130, 100'総読書ページ数'"
      c.draw "text 130, 140'#{total_read_pages}ページ'"
      c.draw "text 450, 160'#{random_comment}'"
    end
    image.format 'png'
  end
end
