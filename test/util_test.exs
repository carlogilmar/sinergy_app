defmodule UtilTest do
	use ExUnit.Case
	alias SinergyDemo.Station
	alias SinergyDemo.Utils
	alias SinergyDemo.Network

	test "Calculate total flow" do
    starter_network = get_fake_starter_network()
    calculated_network = Utils.process_network(starter_network)
    [s1, s2, s3] = calculated_network.stations
		assert s1.total_flow > 0
		assert s2.total_flow > 0
		assert s3.total_flow > 0
		assert s1.congestion > 0
		assert s2.congestion > 0
		assert s3.congestion > 0
		assert s1.stability > 0
		assert s2.stability > 0
		assert s3.stability > 0
		assert s1.cycle_time != nil
		assert s2.cycle_time != nil
		assert s3.cycle_time != nil
		assert s1.wip != nil
		assert s2.wip != nil
		assert s3.wip != nil
    assert calculated_network.total_wip != nil
    assert calculated_network.total_cycle_time != nil
	end

  test "get a network from view" do
    view_data = %{ "data" => [
      [0, 0, 0, [0, 0, 0, 0, 0]],
      [0, 0, 0, [0, 0, 0, 0, 0]],
      [0, 0, 0, [0, 0, 0, 0, 0]],
      [0, 0, 0, [0, 0, 0, 0, 0]],
      [0, 0, 0, [0, 0, 0, 0, 0]] ] }
    network = Utils.build_network_from_data(view_data)
    assert network.stations != []
  end

  test "run a flow" do
    view_data = %{ "data" => [
      [1, 0.2, 0.1, [0.23, 0, 0.23, 0, 0.92]],
      [1, 0.2, 0.1, [0.12, 0, 0.23, 0, 0.92]],
      [1, 0.3, 0.1, [0.11, 0, 0.23, 0, 0.92]],
      [1, 0.3, 0.1, [0.11, 0, 0.23, 0, 0.92]],
      [1, 0.4, 0.1, [0.11, 0, 0.23, 0, 0.92]] ] }
    network =
      view_data
        |> Utils.build_network_from_data()
        |> Utils.process_network()
    assert network.total_wip != nil
    assert network.total_cycle_time != nil
  end

  defp get_fake_starter_network() do
    station_1 = %Station{ service_time: 0.56, servers: 3, process_route: [0, 0.4, 0.2], external_flow: 0.5 }
    station_2 = %Station{ service_time: 0.56, servers: 3, process_route: [0, 0.4, 0.2], external_flow: 0.5 }
    station_3 = %Station{ service_time: 0.56, servers: 3, process_route: [0, 0.4, 0.2], external_flow: 0.5 }
    %Network{
      stations: [station_1, station_2, station_3]
    }
  end

end
