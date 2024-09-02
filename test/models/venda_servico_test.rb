require "test_helper"

class VendaServicoTest < ActiveSupport::TestCase
  setup do
    @venda_servico = venda_servicos(:one)
  end

  test "venda_servico deve ser válido" do
    assert @venda_servico.valid?
  end

  test "deve ser inválido sem servico" do
    @venda_servico.servico = nil
    assert_not @venda_servico.valid?
    assert_includes @venda_servico.errors[:servico], "é obrigatório(a)"
  end

  test "deve ser inválido sem cliente" do
    @venda_servico.cliente = nil
    assert_not @venda_servico.valid?
    assert_includes @venda_servico.errors[:cliente], "é obrigatório(a)"
  end

  test "deve ser inválido sem veiculo" do
    @venda_servico.veiculo = nil
    assert_not @venda_servico.valid?
    assert_includes @venda_servico.errors[:veiculo], "é obrigatório(a)"
  end

  test "deve ser inválido com um servico inexistente" do
    @venda_servico.servico_id = nil
    assert_not @venda_servico.valid?
    assert_includes @venda_servico.errors[:servico], "é obrigatório(a)"
  end

  test "deve ser inválido com um cliente inexistente" do
    @venda_servico.cliente_id = nil
    assert_not @venda_servico.valid?
    assert_includes @venda_servico.errors[:cliente], "é obrigatório(a)"
  end

  test "deve ser inválido com um veiculo inexistente" do
    @venda_servico.veiculo_id = nil
    assert_not @venda_servico.valid?
    assert_includes @venda_servico.errors[:veiculo], "é obrigatório(a)"
  end

  test "deve ser válido com dados completos" do
    @venda_servico.servico = servicos(:one)
    @venda_servico.cliente = clientes(:one)
    @venda_servico.veiculo = veiculos(:one)
    assert @venda_servico.valid?
  end
end
