class Notifier < ActionMailer::Base
  def email(recipients,name)
     recipients recipients
     from       "seph38@free.fr"
     subject    "Tir a la corde"
     body       (:recipient => recipients, :nom => name)
  end

end
