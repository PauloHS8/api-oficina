class ClienteMailer < ActionMailer::Base
  default from: ENV['MAILER_USER_NAME']

  def conta_criada(cliente)
    @cliente = cliente
    mail(to: @cliente.email, subject: "Conta criada")
  end
end
