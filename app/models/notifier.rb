class Notifier < ActionMailer::Base
  ADMIN_EMAIL = 'support@example.com'

  def signup_alert(user)
    subject    '[LFGallery] New Account Created'
    recipients ADMIN_EMAIL
    from       ADMIN_EMAIL
    sent_on    Time.now
    
    body       :user => user
  end

  def welcome(user)
    subject    '[LFGallery] Welcome to the gallery'
    recipients user.email
    from       ADMIN_EMAIL
    sent_on    Time.now
    
    body       :user => user
  end

  def comment_alert(comment)
    subject    '[LFGallery] Comment posted'
    recipients ADMIN_EMAIL
    from       ADMIN_EMAIL
    sent_on    Time.now
    
    body       :comment => comment
  end
end
