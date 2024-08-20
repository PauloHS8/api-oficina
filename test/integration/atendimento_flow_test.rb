require "test_helper"

class AtendimentoFlowTest < ActionDispatch::IntegrationTest
  setup do
    @atendimento = atendimentos(:one)
    @veiculo = veiculos(:one)
    @funcionario = funcionarios(:one)
    @cliente = clientes(:one)
  end

  test "deve listar todos os atendimentos" do
    get atendimentos_url
    assert_response :success
    assert_select "h1", "Atendimentos"
    assert_select "tbody tr", Atendimento.count
  end

  test "deve mostrar um atendimento" do
    get atendimento_url(@atendimento)
    assert_response :success
    assert_select "strong", "Data início:"
  end

  test "deve criar um novo atendimento" do
    assert_difference('Atendimento.count') do
      post atendimentos_url, params: {
        atendimento: {
          data_inicio: Time.now,
          data_termino: 1.hour.from_now,
          status: "agendado",
          veiculo_id: @veiculo.id,
          funcionario_ids: [@funcionario.id]
        }
      }
    end

    assert_redirected_to atendimento_url(Atendimento.last)
    follow_redirect!
    assert_select "div.alert", "Atendimento cadastrado com sucesso."
  end

  test "não deve criar um atendimento com parâmetros inválidos" do
    assert_no_difference('Atendimento.count') do
      post atendimentos_url, params: {
        atendimento: {
          data_inicio: nil,
          data_termino: nil,
          status: "",
          veiculo_id: nil
        }
      }
    end

    assert_response :unprocessable_entity
  end


  test "não deve editar um atendimento com parâmetros inválidos" do
    patch atendimento_url(@atendimento), params: {
      atendimento: {
        data_inicio: nil
      }
    }
    assert_response :unprocessable_entity
  end


  test "deve enviar e-mail após a criação de um atendimento" do
   atendimento = Atendimento.create!(
      data_inicio: Time.now,
      data_termino: 1.hour.from_now,
      status: "agendado",
      veiculo: @veiculo,
      funcionario_ids: [@funcionario.id]
    )

    email = AtendimentoMailer.atendimento_criado(atendimento).deliver_now

    assert_not ActionMailer::Base.deliveries.empty?
    assert_equal [@veiculo.cliente.email], email.to
    assert_equal "Atendimento criado", email.subject
  end


end
