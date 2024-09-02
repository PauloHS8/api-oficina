require "test_helper"

class AgendamentoTest < ActiveSupport::TestCase
  setup do
    @agendamento = agendamentos(:one)
  end

  test "agendamento deve ser válido" do
    assert @agendamento.valid?
  end

  test "deve ser inválido sem veiculo" do
    @agendamento.veiculo = nil
    assert_not @agendamento.save
    assert_not_empty @agendamento.errors[:veiculo]
  end

  test "deve ser inválido sem servico" do
    @agendamento.servico = nil
    assert_not @agendamento.save
    assert_not_empty @agendamento.errors[:servico]
  end

  test "status deve ser um valor válido" do
    valid_statuses = Agendamento.statuses.keys
    valid_statuses.each do |status|
      @agendamento.status = status
      assert @agendamento.valid?, "Status '#{status}' não deveria ser inválido"
    end
  end

  test "deve associar corretamente veiculo e servico" do
    veiculo = veiculos(:one)
    servico = servicos(:one)

    agendamento = Agendamento.new(
      veiculo: veiculo,
      servico: servico,
      status: :pendente,
      data: "2024-09-01"
    )

    assert agendamento.save
    assert_equal veiculo, agendamento.veiculo
    assert_equal servico, agendamento.servico
  end

end
