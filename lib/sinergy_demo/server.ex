defmodule SinergyDemo.Server do

	defstruct stations: nil, # numero de estaciones
						service_time: nil, # tiempo de servicio
						standard_desviation: nil,  # desviación estándar
						coef_service_variance: nil, #coef var del servicio
						servers: nil,  # servidores
						total_flow: nil, # flujo total
						external_flow: nil, #gamma flujo  externo de piezas de unidades
						coef_service_time: nil, # coef var del servicio en tiempos de arribos
						gamma: nil,
						coef_var_arrives: nil, # coef var de arribos
						### Computed properties
						capacity_used: nil, #capacidad utilizada
						cycle_time: nil, #tiempo de ciclo
						wip: nil,
						process_way: [] #ruta de proceso a otros servers
end
