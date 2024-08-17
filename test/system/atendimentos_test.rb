require "application_system_test_case"

class AtendimentosTest < ApplicationSystemTestCase
  setup do
    @atendimento = atendimentos(:one)
  end

  test "visiting the index" do
    visit atendimentos_url
    assert_selector "h1", text: "Atendimentos"
  end

  test "should create atendimento" do
    visit atendimentos_url
    click_on "Novo atendimento"

    fill_in "Data inicio", with: @atendimento.data_inicio
    fill_in "Data termino", with: @atendimento.data_termino
    fill_in "Status", with: @atendimento.status
    fill_in "Veiculo", with: @atendimento.veiculo_id
    click_on "Create Atendimento"

    assert_text "Atendimento cadastrado com sucesso"
    click_on "Back"
  end

  test "should update Atendimento" do
    visit atendimento_url(@atendimento)
    click_on "Editar atendimento", match: :first

    fill_in "Data inicio", with: @atendimento.data_inicio.to_s
    fill_in "Data termino", with: @atendimento.data_termino.to_s
    fill_in "Status", with: @atendimento.status
    fill_in "Veiculo", with: @atendimento.veiculo_id
    click_on "Update Atendimento"

    assert_text "Atendimento editado com sucesso"
    click_on "Back"
  end

  test "should destroy Atendimento" do
    visit atendimento_url(@atendimento)
    click_on "Excluir atendimento", match: :first

    assert_text "Atendimento excluído com sucesso"
  end
end
