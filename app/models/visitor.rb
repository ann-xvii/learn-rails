class Visitor
	include ActiveModel::Model 

	attr_accessor :email, :string
	validates_presence_of :email
	validates_format_of :email, :with => /\A[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}\z/i

	def subscribe
		newchimp = Gibbon::API.new(Rails.application.secrets.mailchimp_api_key)
		resultare = newchimp.lists.subscribe({
			:id => Rails.application.secrets.mailchimp_list_id,
			:email => {:email => self.email},
			:double_option => false,
			:update_existing => true,
			:send_welcome => true
			})
		Rails.logger.info("Subscribed #{self.email} to MailChimp") if resultare
	end

end