require "test_helper"

class FuncionariosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @funcionario = funcionarios(:one)
  end

  test "should get index" do
    get funcionarios_url
    assert_response :success
  end

  test "should get new" do
    get new_funcionario_url
    assert_response :success
  end

  test "should create funcionario" do
    funcionario = Funcionario.new(
      matricula: "F54321",
      nome: "Carlos Souza",
      cpf: "12345678911",
      cargo: "Gerente de Projetos",
      email: "carlos.souza@empresa.com.br",
      salario: 7000.00,
      data_admissao: "2024-08-01"
    )

    assert_difference("Funcionario.count") do
      post funcionarios_url, params: { funcionario: funcionario.attributes }
    end

    assert_redirected_to funcionario_url(Funcionario.last)
  end

  test "should show funcionario" do
    get funcionario_url(@funcionario)
    assert_response :success
  end

  test "should get edit" do
    get edit_funcionario_url(@funcionario)
    assert_response :success
  end

  test "should update funcionario" do
    patch funcionario_url(@funcionario), params: { funcionario: { cargo: @funcionario.cargo, cpf: @funcionario.cpf, data_admissao: @funcionario.data_admissao, email: @funcionario.email, matricula: @funcionario.matricula, nome: @funcionario.nome, salario: @funcionario.salario } }
    assert_redirected_to funcionario_url(@funcionario)
  end

  test "should destroy funcionario" do
    assert_difference("Funcionario.count", -1) do
      delete funcionario_url(@funcionario)
    end

    assert_redirected_to funcionarios_url
  end
end
