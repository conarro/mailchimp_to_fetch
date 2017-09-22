class MailchimpEvent
  attr_reader :params, :type, :email

  def initialize(params)
    @params  = params
    @type    = params['type']
    @email   = params['data']['email']
  end

  def subscribe?
    type == 'subscribe'
  end
end
