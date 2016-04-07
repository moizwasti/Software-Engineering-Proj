class ApplicationMailer < ActionMailer::Base
  default from: "noreply@nearpeer.herokuapp.com/"
  layout 'mailer'
end
