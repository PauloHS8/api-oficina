class AtendimentosMailer < ActionMailer::Base
  default from: "nao-responda@esmecanica.com"

  def atendimento_criado
    @cliente = params[:cliente]
    mail(to: @cliente.email, subject: 'Atendimento criado')
  end
end
