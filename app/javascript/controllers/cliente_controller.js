import {Controller} from "@hotwired/stimulus"

// Connects to data-controller="cliente"
export default class extends Controller {
    update_select_veiculos(event) {
        const clienteId = event.target.value
        const veiculoSelect = document.querySelector("#veiculo_select")

        veiculoSelect.innerHTML = '<option value="">Selecione um veículo</option>';

        if (clienteId) {
            fetch(`/clientes/${clienteId}/veiculos`)
                .then(response => response.json())
                .then(veiculos => {
                    veiculos.forEach(veiculo => {
                        const option = document.createElement("option");
                        option.value = veiculo.id;
                        option.textContent = `${veiculo.placa} - ${veiculo.modelo}`;
                        veiculoSelect.appendChild(option);
                    });
                });
        }
    }
}
