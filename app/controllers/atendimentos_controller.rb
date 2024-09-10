class AtendimentosController < ApplicationController
  before_action :set_atendimento, only: %i[ show edit update destroy ]

  # GET /atendimentos or /atendimentos.json
  def index
    if current_user.admin?
      @atendimentos = Atendimento.all
    else
      @atendimentos = Atendimento.joins(:veiculo)
                                 .where(veiculos: { cliente_id: current_user.cliente_id })
    end
  end

  # GET /atendimentos/1 or /atendimentos/1.json
  def show
  end

  # GET /atendimentos/new
  def new
    @atendimento = Atendimento.new
  end

  # GET /atendimentos/1/edit
  def edit
  end

  # POST /atendimentos or /atendimentos.json
  def create
    @atendimento = Atendimento.new(atendimento_params)
    handle_save(@atendimento.save, :new, "Atendimento cadastrado com sucesso.") do
      AtendimentoMailer.atendimento_criado(@atendimento).deliver_later
    end
  end

  # PATCH/PUT /atendimentos/1 or /atendimentos/1.json
  def update
    handle_save(@atendimento.update(atendimento_params), :edit, "Atendimento editado com sucesso.")
  end

  # DELETE /atendimentos/1 or /atendimentos/1.json
  def destroy
    @atendimento.destroy!

    respond_to do |format|
      format.html { redirect_to atendimentos_url, notice: "Atendimento excluído com sucesso." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_atendimento
    @atendimento = Atendimento.find_by(id: params[:id])
    if @atendimento.nil?
      redirect_to atendimentos_path, notice: "Atendimento não encontrado."
    end
  end

  # Only allow a list of trusted parameters through.
  def atendimento_params
    params.require(:atendimento).permit(:data_inicio, :data_termino, :status, :veiculo_id, funcionario_ids: [])
  end

  def handle_save(method_success, render_template, notice_message)
    respond_to do |format|
      if method_success
        format.html { redirect_to atendimento_url(@atendimento), notice: notice_message }
        format.json { render :show, status: :ok, location: @atendimento }
      else
        format.html { render render_template, status: :unprocessable_entity }
        format.json { render json: @atendimento.errors, status: :unprocessable_entity }
      end
    end
  end
end
