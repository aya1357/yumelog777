class Form::LogCollection < Form::Base
  FORM_COUNT = 1
  attr_accessor :logs

  def initialize(attributes = {}, user_id='', date='')
    # 親クラスのinitializeメソッドを呼び出す
    super attributes
    # ログを入力するためのフォーム画面を表示するために、デフォルトのログを1件用意する必要があるため、空のLogオブジェクトを1件生成してlogsに格納する必要がある
    if user_id.blank?
      self.logs = FORM_COUNT.times.map { Log.new() } if self.logs.blank?
    else
      self.logs = Log.where(user_id: user_id, log_date: date)
    end
  end

  def logs_attributes=(attributes)
    # Log.newを呼び出してLogオブジェクトを生成し、それらのオブジェクトを配列にまとめて返す
    self.logs = attributes.map { |_, v| Log.new(v) }
  end

  def save
    Log.transaction do
      self.logs.each do |log|
        log.save!
      end
    end
    true
  rescue => e
    false
  end
end
