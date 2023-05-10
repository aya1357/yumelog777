class LineBotController < ApplicationController
  skip_before_action :verify_authenticity_token
  skip_before_action :require_login, only: [:index]

  def index
    body = request.body.read
    events = client.parse_events_from(body)
    events.each do |event|
      case event
      when Line::Bot::Event::Message
        case event.type
        when Line::Bot::Event::MessageType::Text
          # ユーザーからのメッセージが「出勤なう」だった場合のみにメッセージを返す
          if event.message["text"] == "hello"
            message = {
              type: 'text',
              text: 'ハロー！'
            }
            client.reply_message(event['replyToken'],  message)
          end
        end
      end
    end
  end

  private

  def client
    @client ||= Line::Bot::Client.new { |config|
      config.channel_secret = ENV["LINE_CHANNEL_SECRET"]
      config.channel_token = ENV["LINE_CHANNEL_TOKEN"]
    }
  end
end
