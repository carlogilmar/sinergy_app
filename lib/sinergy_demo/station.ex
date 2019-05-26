defmodule SinergyDemo.Station do

  defstruct service_time: nil, #tiempo de servicio
            servers: nil, #número de servidores
            process_route: [], #ruta del proceso
            external_flow: nil, #flujo externo o gamma
            total_flow: nil, #flujo total
            congestion: nil, #congestion
            stability: nil, #estabilidad, paso5
            cycle_time: nil, #tiempo de ciclo ind
            wip: nil #wip

end
