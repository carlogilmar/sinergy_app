defmodule SinergyDemo.Utils do

  def process_network(network) do
    network
      |> calculate_total_flow() #paso 3
      |> calculate_congestion_and_stability() #paso 4 y 5
      |> calculate_cycle_times() #paso 6
      |> calculate_wip() #paso 7
      |> calculate_network_properties() #paso8 y 9
  end

  defp calculate_network_properties(network) do
    wips_in_stations = for station <- network.stations, do: station.wip
    total_wip = Enum.sum(wips_in_stations) #paso 8
    external_flows_in_stations = for station <- network.stations, do: station.external_flow
    total_external_flow = Enum.sum(external_flows_in_stations)
    total_cycle_time = total_wip / total_external_flow
    %{network | total_wip: total_wip, total_cycle_time: total_cycle_time}
  end

  defp calculate_wip(network) do
    stations_with_wip =
      for station <- network.stations do
        wip = station.cycle_time * station.total_flow
        %{station | wip: wip}
      end
    %{network | stations: stations_with_wip}
  end

  defp calculate_cycle_times(network) do
    stations_with_cycle_time =
      for station <- network.stations do
        part_a = :math.sqrt(2*station.servers+2)
        part_b = :math.pow(station.congestion, part_a) - 1
        part_c = station.servers * (1 - station.congestion)
        cycle_time = ( part_b / part_c ) * station.service_time
        %{station | cycle_time: cycle_time}
      end
    %{network | stations: stations_with_cycle_time}
  end

  defp calculate_congestion_and_stability(network) do
    process_routes = for station <- network.stations, do: station.process_route
    service_times = for station <- network.stations, do: [station.service_time]
    congestions_for_stations = Matrix.mult(process_routes, service_times)
    stations_updated =
      for {station, [congestion]} <- Enum.zip(network.stations, congestions_for_stations) do
        stability = congestion / station.servers
        %{station | congestion: congestion, stability: stability}
      end
    %{network | stations: stations_updated}
  end

  defp calculate_total_flow(network) do
    process_routes = for station <- network.stations, do: station.process_route
    external_flow = for station <- network.stations, do: [station.external_flow]
    total_flow_for_stations = Matrix.mult(process_routes, external_flow)
    stations_updated =
      for {station, [total_flow]} <- Enum.zip(network.stations, total_flow_for_stations) do
        %{station | total_flow: total_flow}
      end
    %{network | stations: stations_updated}
  end

end
