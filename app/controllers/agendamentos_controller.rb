class AgendamentosController < ApplicationController
  before_action :set_agendamento, only: %i[show edit update destroy]
  before_action :set_veiculos, only: %i[new edit create update]

  # GET /agendamentos or /agendamentos.json
  def index
    @funcionarios = Funcionario.all
    if current_user.admin?
      @agendamentos = Agendamento.all
    else
      @agendamentos = Agendamento.joins(:veiculo)
                                 .where(veiculos: { cliente_id: current_user.cliente_id })
    end
  end

  # GET /agendamentos/1 or /agendamentos/1.json
  def show
  end

  # GET /agendamentos/new
  def new
    @agendamento = Agendamento.new
  end

  # GET /agendamentos/1/edit
  def edit
  end

  # POST /agendamentos or /agendamentos.json
  def create
    @agendamento = Agendamento.new(agendamento_params)

    respond_to do |format|
      if @agendamento.save
        format.html { redirect_to agendamento_url(@agendamento), notice: "Agendamento criado com sucesso." }
        format.json { render :show, status: :created, location: @agendamento }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @agendamento.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /agendamentos/1 or /agendamentos/1.json
  def update
    respond_to do |format|
      if @agendamento.update(agendamento_params)
        format.html { redirect_to agendamento_url(@agendamento), notice: "Agendamento atualizado com sucesso." }
        format.json { render :show, status: :ok, location: @agendamento }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @agendamento.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /agendamentos/1 or /agendamentos/1.json
  def destroy
    @agendamento.destroy

    respond_to do |format|
      format.html { redirect_to agendamentos_url, notice: "Agendamento excluído com sucesso." }
      format.json { head :no_content }
    end
  end

  def update_status
    @agendamento = Agendamento.find_by(id: params[:agendamento_id])
    new_status = params[:status]

    if Agendamento.statuses.keys.include?(new_status) && @agendamento.update(status: new_status)
      notice_message = handle_status_change(new_status)
      redirect_to agendamentos_path, notice: notice_message
    else
      redirect_to agendamentos_url, alert: "Não foi possível atualizar o status do agendamento."
    end
  end

  private

  def set_agendamento
    @agendamento = Agendamento.find_by(id: params[:id])
    if @agendamento.nil?
      redirect_to atendimentos_path, notice: "Agendamento não encontrado."
    end
  end

  def set_veiculos
    if current_user.admin?
      @veiculos = Veiculo.all
    else
      @veiculos = current_user.cliente.veiculos
    end
  end

  def agendamento_params
    params.require(:agendamento).permit(:veiculo_id, :servico_id, :status, :data)
  end

  def handle_status_change(status)
    if status == "confirmado"
      atendimento = Atendimento.create!(
        veiculo: @agendamento.veiculo,
        data_inicio: @agendamento.data,
        data_termino: @agendamento.data,
        status: :agendado
      )

      funcionarios_ids = params[:funcionario_ids] || []
      atendimento.funcionarios << Funcionario.where(id: funcionarios_ids.reject(&:blank?))

      "Agendamento aprovado. O atendimento logo será agendado."
    else
      "Agendamento reprovado."
    end
  end
end
