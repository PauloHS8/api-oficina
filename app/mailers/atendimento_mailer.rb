class AtendimentoMailer < ActionMailer::Base
  default from: "nao-responda@esmecanica.com"

  def atendimento_criado(atendimento)
    @atendimento = atendimento
    mail(to: @atendimento.veiculo.cliente.email, subject: "Atendimento criado")
  end
end
