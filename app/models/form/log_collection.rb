class Form::LogCollection < Form::Base
  FORM_COUNT = 1
  attr_accessor :logs

  def initialize(attributes = {}, user_id='', date='')
    super attributes

    unless (user_id.present?)
      self.logs = FORM_COUNT.times.map { Log.new() } unless self.logs.present?
    else
      self.logs = Log.where(user_id: user_id, log_date: date)
    end
  end

  def logs_attributes=(attributes)
    self.logs = attributes.map { |_, v| Log.new(v) }
  end

  def save
    Log.transaction do
      self.logs.map do |log|
        log.save!
    end
    end
    return true
      rescue => e
    return false
  end
end
