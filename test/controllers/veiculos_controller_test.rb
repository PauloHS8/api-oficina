require "test_helper"

class VeiculosControllerTest < ActionDispatch::IntegrationTest
  setup do
    sign_in users(:admin)
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
    veiculo = Veiculo.new(
      ano: 2024,
      cor: 'azul',
      modelo: 'Novo Modelo',
      placa: 'NEW1234',
      quilometragem: 5000,
      chassi: 'NEWCHASSI12345678',
      cliente_id: 1
    )

    assert_difference("Veiculo.count") do
      post veiculos_url, params: { veiculo: veiculo.attributes }
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

end
