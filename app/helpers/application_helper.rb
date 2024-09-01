module ApplicationHelper
  def status_class(status)
    case status
    when "pendente"
      "badge-pending"
    when "confirmado"
      "badge-confirmed"
    when "em_andamento"
      "badge-in-progress"
    when "concluído"
      "badge-completed"
    else
      "badge-secondary"
    end
  end
end
