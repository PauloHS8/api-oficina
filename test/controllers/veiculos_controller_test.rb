require "test_helper"

class VeiculosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @veiculo = veiculos(:one)
  end

  test "should get index" do
    get veiculos_url
    assert_response :success
  end

  test "should get new" do
    get new_veiculo_url
    assert_response :success
  end

  test "should create veiculo" do
    assert_difference("Veiculo.count") do
      post veiculos_url, params: { veiculo: { ano: 2024, chassi: 'NEWCHASSI123456789', cor: 'azul', modelo: 'Novo Modelo', placa: 'NEW1234', quilometragem: 5000, cliente_id: 1 } }
    end

    assert_redirected_to veiculo_url(Veiculo.last)
  end


  test "should show veiculo" do
    get veiculo_url(@veiculo)
    assert_response :success
  end

  test "should get edit" do
    get edit_veiculo_url(@veiculo)
    assert_response :success
  end

  test "should update veiculo" do
    patch veiculo_url(@veiculo), params: { veiculo: { ano: @veiculo.ano, chassi: @veiculo.chassi, cor: @veiculo.cor, modelo: @veiculo.modelo, placa: @veiculo.placa, quilometragem: @veiculo.quilometragem } }
    assert_redirected_to veiculo_url(@veiculo)
  end

  test "should destroy veiculo" do
    veiculo_to_destroy = veiculos(:one)

    assert_equal 1, veiculo_to_destroy.atendimentos.count

    assert_difference("Veiculo.count", -1) do
      delete veiculo_url(veiculo_to_destroy)
    end

    assert_empty Atendimento.where(veiculo_id: veiculo_to_destroy.id)

    assert_redirected_to veiculos_url
  end
end
