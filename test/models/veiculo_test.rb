require "test_helper"

class VeiculoTest < ActiveSupport::TestCase
  setup do
    @veiculo = veiculos(:one)
  end

  test "deve ser válido" do
    assert @veiculo.valid?
  end

  test "placa deve estar presente" do
    @veiculo.placa = nil
    assert_not @veiculo.save
    assert_includes @veiculo.errors[:placa], "não pode ficar em branco"
  end

  test "modelo deve estar presente" do
    @veiculo.modelo = nil
    assert_not @veiculo.save
    assert_includes @veiculo.errors[:modelo], "não pode ficar em branco"
  end

  test "ano deve estar presente" do
    @veiculo.ano = nil
    assert_not @veiculo.save
    assert_includes @veiculo.errors[:ano], "não pode ficar em branco"
  end

  test "cor deve estar presente" do
    @veiculo.cor = nil
    assert_not @veiculo.save
    assert_includes @veiculo.errors[:cor], "não pode ficar em branco"
  end

  test "quilometragem deve estar presente" do
    @veiculo.quilometragem = nil
    assert_not @veiculo.save
    assert_includes @veiculo.errors[:quilometragem], "não pode ficar em branco"
  end

  test "quilometragem deve ser maior ou igual a 0" do
    @veiculo.quilometragem = -1
    assert_not @veiculo.save
    assert_includes @veiculo.errors[:quilometragem], "deve ser maior ou igual a 0"
  end

  test "chassi deve estar presente" do
    @veiculo.chassi = nil
    assert_not @veiculo.save
    assert_includes @veiculo.errors[:chassi], "não pode ficar em branco"
  end

  test "placa deve ser única" do
    veiculo_duplicado = @veiculo.dup
    assert_not veiculo_duplicado.save
    assert_includes veiculo_duplicado.errors[:placa], "já está em uso"
  end

  test "placa não deve ter menos de 7 caracteres" do
    @veiculo.placa = "AB123"
    assert_not @veiculo.save
    assert_includes @veiculo.errors[:placa], "é muito curto (mínimo: 7 caracteres)"
  end

  test "placa não deve ter mais de 7 caracteres" do
    @veiculo.placa = "AB1234567890"
    assert_not @veiculo.save
    assert_includes @veiculo.errors[:placa], "é muito longo (máximo: 7 caracteres)"
  end

  test "chassi não deve ter menos de 17 caracteres" do
    @veiculo.chassi = "12345"
    assert_not @veiculo.save
    assert_includes @veiculo.errors[:chassi], "é muito curto (mínimo: 17 caracteres)"
  end

  test "chassi não deve ter mais de 17 caracteres" do
    @veiculo.chassi = "A" * 18
    assert_not @veiculo.save
    assert_includes @veiculo.errors[:chassi], "é muito longo (máximo: 17 caracteres)"
  end
end
