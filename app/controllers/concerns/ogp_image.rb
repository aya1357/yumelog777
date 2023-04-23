module OgpImage
  extend ActiveSupport::Concern

  def build_image
    # text = prepare_text(suggestion[:content], suggestion.topic[:keyword])
    image = MiniMagick::Image.open('./app/assets/images/frame.png')
    text = "テストテストテスト"
    test = "テスト1111"

    font_path = "./app/assets/fonts/NotoSansJP-Medium.ttf"
    pointsize = 36
    gravity = 'NorthWest'
    text_color = "black"

    image.combine_options do |c|
      c.font font_path
      c.pointsize pointsize
      c.gravity gravity
      c.fill text_color
      c.draw "text 300, 50'#{text}'"
      c.draw "text 300, 100'#{test}'"
    end
    image.format 'png'
  end

end
