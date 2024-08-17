require "application_system_test_case"

class FuncionariosTest < ApplicationSystemTestCase
  setup do
    @funcionario = funcionarios(:one)
  end

  test "visiting the index" do
    visit funcionarios_url
    assert_selector "h1", text: "Funcionarios"
  end

  test "should create funcionario" do
    visit funcionarios_url
    click_on "Novo funcionario"

    fill_in "Cargo", with: @funcionario.cargo
    fill_in "Cpf", with: @funcionario.cpf
    fill_in "Data admissao", with: @funcionario.data_admissao
    fill_in "Email", with: @funcionario.email
    fill_in "Matricula", with: @funcionario.matricula
    fill_in "Nome", with: @funcionario.nome
    fill_in "Salario", with: @funcionario.salario
    click_on "Create Funcionario"

    assert_text "Funcionario cadastrado com sucesso"
    click_on "Back"
  end

  test "should update Funcionario" do
    visit funcionario_url(@funcionario)
    click_on "Editar funcionario", match: :first

    fill_in "Cargo", with: @funcionario.cargo
    fill_in "Cpf", with: @funcionario.cpf
    fill_in "Data admissao", with: @funcionario.data_admissao
    fill_in "Email", with: @funcionario.email
    fill_in "Matricula", with: @funcionario.matricula
    fill_in "Nome", with: @funcionario.nome
    fill_in "Salario", with: @funcionario.salario
    click_on "Update Funcionario"

    assert_text "Funcionario editado com sucesso"
    click_on "Back"
  end

  test "should destroy Funcionario" do
    visit funcionario_url(@funcionario)
    click_on "Excluir funcionario", match: :first

    assert_text "Funcionario excluído com sucesso"
  end
end
