require "application_system_test_case"

class VendaServicosTest < ApplicationSystemTestCase
  setup do
    @venda_servico = venda_servicos(:one)
  end

  test "visiting the index" do
    visit venda_servicos_url
    assert_selector "h1", text: "Venda servicos"
  end

  test "should create venda servico" do
    visit venda_servicos_url
    click_on "New venda servico"

    fill_in "Cliente", with: @venda_servico.cliente_id
    fill_in "Servico", with: @venda_servico.servico_id
    click_on "Create Venda servico"

    assert_text "Venda servico was successfully created"
    click_on "Back"
  end

  test "should update Venda servico" do
    visit venda_servico_url(@venda_servico)
    click_on "Edit this venda servico", match: :first

    fill_in "Cliente", with: @venda_servico.cliente_id
    fill_in "Servico", with: @venda_servico.servico_id
    click_on "Update Venda servico"

    assert_text "Venda servico was successfully updated"
    click_on "Back"
  end

  test "should destroy Venda servico" do
    visit venda_servico_url(@venda_servico)
    click_on "Destroy this venda servico", match: :first

    assert_text "Venda servico was successfully destroyed"
  end
end
