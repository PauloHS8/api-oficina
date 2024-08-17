require "application_system_test_case"

class VeiculosTest < ApplicationSystemTestCase
  setup do
    @veiculo = veiculos(:one)
  end

  test "visiting the index" do
    visit veiculos_url
    assert_selector "h1", text: "Veiculos"
  end

  test "should create veiculo" do
    visit veiculos_url
    click_on "Novo veiculo"

    fill_in "Ano", with: @veiculo.ano
    fill_in "Chassi", with: @veiculo.chassi
    fill_in "Cor", with: @veiculo.cor
    fill_in "Modelo", with: @veiculo.modelo
    fill_in "Placa", with: @veiculo.placa
    fill_in "Quilometragem", with: @veiculo.quilometragem
    click_on "Create Veiculo"

    assert_text "Veiculo cadastrado com sucesso"
    click_on "Back"
  end

  test "should update Veiculo" do
    visit veiculo_url(@veiculo)
    click_on "Editar veiculo", match: :first

    fill_in "Ano", with: @veiculo.ano
    fill_in "Chassi", with: @veiculo.chassi
    fill_in "Cor", with: @veiculo.cor
    fill_in "Modelo", with: @veiculo.modelo
    fill_in "Placa", with: @veiculo.placa
    fill_in "Quilometragem", with: @veiculo.quilometragem
    click_on "Update Veiculo"

    assert_text "Veiculo editado com sucesso"
    click_on "Back"
  end

  test "should destroy Veiculo" do
    visit veiculo_url(@veiculo)
    click_on "Excluir veiculo", match: :first

    assert_text "Veiculo excluído com sucesso"
  end
end
