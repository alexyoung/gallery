require 'test_helper'

class NotifierTest < ActionMailer::TestCase
  tests Notifier
  def test_signup_alert
    @expected.subject = 'Notifier#signup_alert'
    @expected.body    = read_fixture('signup_alert')
    @expected.date    = Time.now

    assert_equal @expected.encoded, Notifier.create_signup_alert(@expected.date).encoded
  end

  def test_welcome
    @expected.subject = 'Notifier#welcome'
    @expected.body    = read_fixture('welcome')
    @expected.date    = Time.now

    assert_equal @expected.encoded, Notifier.create_welcome(@expected.date).encoded
  end

  def test_comment_alert
    @expected.subject = 'Notifier#comment_alert'
    @expected.body    = read_fixture('comment_alert')
    @expected.date    = Time.now

    assert_equal @expected.encoded, Notifier.create_comment_alert(@expected.date).encoded
  end

end
