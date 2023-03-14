class Form::LogCollection < Form::Base
	FORM_COUNT = 1
	attr_accessor :logs

	def initialize(attributes = {}, user_id='', date='')
		super attributes
		p 'initialize method.'

		unless (user_id.present?)
			self.logs = FORM_COUNT.times.map { Log.new() } unless self.logs.present?
      p 'test'
      p self.logs
		else
			self.logs = Log.where(user_id: user_id, log_date: date)
      p 'test2'
      p self.logs
			
		end
		p 'initialize method.'
	end

	def logs_attributes=(attributes)
		p 'logs_attributes method.'

		self.logs = attributes.map { |_, v| Log.new(v) }
    p 'test3'
    p self.logs
	end

	def save
		p 'save method.'
		Log.transaction do
			self.logs.map do |log|
				log.save!
			end
		end
		return true
			rescue => e
				p e
		return false
	end
end
