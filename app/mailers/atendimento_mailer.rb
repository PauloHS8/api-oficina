class AtendimentoMailer < ActionMailer::Base
  default from: ENV['MAILER_USER_NAME']

  def atendimento_criado(atendimento)
    @atendimento = atendimento
    mail(to: @atendimento.veiculo.cliente.email, subject: "Atendimento criado")
  end
end
