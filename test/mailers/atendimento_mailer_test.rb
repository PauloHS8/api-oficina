require 'test_helper'

class AtendimentoMailerTest < ActionMailer::TestCase
  setup do
    @cliente = Cliente.create!(
      nome: "João Silva",
      telefone: "11987654321",
      cpf: "12340078901",
      endereco: "Rua Exemplo, 123",
      email: "joao.silva@example.com"
    )
    @veiculo = Veiculo.create!(
      cliente: @cliente,
      placa: "ABC1034",
      modelo: "Fusca",
      ano: 2020,
      cor: "Azul",
      quilometragem: 5000,
      chassi: "1HGBH41JXML109186"
    )
    @atendimento = Atendimento.create!(
      data_inicio: Time.now,
      data_termino: 1.hour.from_now,
      status: :agendado,
      veiculo: @veiculo
    )
  end

  test "deve enviar e-mail após a criação de um atendimento" do
    assert_difference 'ActionMailer::Base.deliveries.size', 1 do
      AtendimentoMailer.atendimento_criado(@atendimento).deliver_now
    end

    email = ActionMailer::Base.deliveries.last
    assert_not_nil email
    assert_equal "Atendimento criado", email.subject
    assert_equal @atendimento.veiculo.cliente.email, email.to[0]
  end
end
