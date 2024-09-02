require "test_helper"
include ActionView::Helpers::NumberHelper

class FuncionariosFlowTest < ActionDispatch::IntegrationTest
  setup do
    sign_in users(:admin)
    @funcionario = funcionarios(:one) # Supondo que você tenha um fixture chamado :one
  end

  test "should get index" do
    get funcionarios_url
    assert_response :success

    assert_select "h1", "Funcionários"
    assert_select "table" do
      assert_select "th", "ID"
      assert_select "th", "Nome"
      assert_select "th", "Email"
      assert_select "th", "CPF"
      assert_select "th", "Cargo"
      assert_select "th", "Salário"
      assert_select "th", "Data de Admissão"
      assert_select "td", text: @funcionario.id.to_s
      assert_select "td", text: @funcionario.nome
      assert_select "td", text: @funcionario.email
      assert_select "td", text: @funcionario.cpf
      assert_select "td", text: @funcionario.cargo
      assert_select "td", text: number_to_currency(@funcionario.salario, locale: 'pt-BR')
      assert_select "td", text: @funcionario.data_admissao.strftime("%d/%m/%Y")
      assert_select "a", text: "Exibir"
      assert_select "a", text: "Editar"
      assert_select "button", text: "Excluir"
    end
  end

  test "should get new funcionario" do
    get new_funcionario_url
    assert_response :success

    assert_select "h1", "Novo funcionario"
    assert_select "form" do
      assert_select "input[name='funcionario[matricula]']"
      assert_select "input[name='funcionario[nome]']"
      assert_select "input[name='funcionario[cpf]']"
      assert_select "input[name='funcionario[cargo]']"
      assert_select "input[name='funcionario[email]']"
      assert_select "input[name='funcionario[salario]']"
      assert_select "input[name='funcionario[data_admissao]']"
    end
  end

  test "should create funcionario" do
    assert_difference('Funcionario.count') do
      post funcionarios_url, params: { funcionario: { matricula: "F1234", nome: "Novo Funcionario", cpf: "12345678901", cargo: "Cargo Teste", email: "novo@funcionario.com", salario: 2000.00, data_admissao: "2024-08-19" } }
    end

    assert_redirected_to funcionario_url(Funcionario.last)
    follow_redirect!
    assert_select "title", text: "Detalhes do funcionário"
    assert_select "p", text: /Matrícula:\s*F1234/
  end

  test "should show funcionario" do
    get funcionario_url(@funcionario)
    assert_response :success

    # Verifique se os detalhes do funcionário estão presentes
    assert_select "p", text: /Matrícula:\s*#{@funcionario.matricula}/
    assert_select "p", text: /Nome:\s*#{@funcionario.nome}/
    assert_select "p", text: /CPF:\s*#{@funcionario.cpf}/
    assert_select "p", text: /Cargo:\s*#{@funcionario.cargo}/
    assert_select "p", text: /Email:\s*#{@funcionario.email}/

    # Certifique-se de que o formato do salário está correto
    assert_select "p", text: /Salário:\s*#{@funcionario.salario}/

    # Certifique-se de que a data está no formato correto
    assert_select "p", text: /Data de admissão:\s*#{@funcionario.data_admissao.strftime("%Y-%m-%d")}/

    # Verifique se os links e botões para editar e excluir o funcionário estão presentes
    assert_select "a", text: "Editar funcionário"
    assert_select "button", text: "Excluir funcionário"
  end

  test "should get edit funcionario" do
    get edit_funcionario_url(@funcionario)
    assert_response :success

    assert_select "h1", "Editar funcionario"
    assert_select "form" do
      assert_select "input[name='funcionario[matricula]']"
      assert_select "input[name='funcionario[nome]']"
      assert_select "input[name='funcionario[cpf]']"
      assert_select "input[name='funcionario[cargo]']"
      assert_select "input[name='funcionario[email]']"
      assert_select "input[name='funcionario[salario]']"
      assert_select "input[name='funcionario[data_admissao]']"
    end
  end

  test "should update funcionario" do
    patch funcionario_url(@funcionario), params: { funcionario: { matricula: "F5678", nome: "Funcionario Atualizado", cpf: "09876543210", cargo: "Cargo Atualizado", email: "atualizado@funcionario.com", salario: 3000.00, data_admissao: "2024-08-20" } }
    assert_redirected_to funcionario_url(@funcionario)
    follow_redirect!
    assert_select "p", text: /Matrícula:\s*F5678/
  end

  test "should destroy funcionario" do
    assert_difference('Funcionario.count', -1) do
      delete funcionario_url(@funcionario)
    end

    assert_redirected_to funcionarios_url
  end
end
