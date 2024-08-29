require "test_helper"

class AtendimentoTest < ActiveSupport::TestCase
  setup do
    @atendimento = atendimentos(:one)
    @atendimento.status = "agendado"
  end

  test "atendimento deve ser válido" do
    assert @atendimento.valid?
  end

  test "deve ser inválido sem data_inicio" do
    @atendimento.data_inicio = nil
    assert_not @atendimento.save
    assert_includes @atendimento.errors[:data_inicio], "não pode ficar em branco"
  end

  test "deve ser inválido sem data_termino" do
    @atendimento.data_termino = nil
    assert_not @atendimento.save
    assert_includes @atendimento.errors[:data_termino], "não pode ficar em branco"
  end

  test "deve ser inválido sem status" do
    @atendimento.status = nil
    assert_not @atendimento.save
    assert_includes @atendimento.errors[:status], "não pode ficar em branco"
  end

  test "deve lançar erro com status inválido" do
    assert_raises(ArgumentError) do
      @atendimento.status = "status_inválido"
    end
  end
end
