import Vue from 'vue'
import socket from "./socket"
import {Howl, Howler} from 'howler';

export const app = new Vue({
	el:"#app",
	data: {
    i: 0,
		message: "Cargando...",
		sound: null,
		stations: 0,
		stations_key: false,
		results_key: false,
		process_route: [],
		process_route_values: [],
		current_station: 1,
		service_time: 0,
		servers: 0,
		external_flow: 0,
		stations_in_network: []
	},
	created: function() {
		console.log("Trying to connect socket implementation...");
		this.channel = socket.channel("sinergy:app", {});
		this.channel.join()
			.receive("ok", resp => {
				console.log("Joined successfully", resp);
				this.message = " 😊 ";
			})
			.receive("error", resp => {
				console.log("Unable to join", resp);
				this.message = " 💀 ";
			});
	},
	methods:{
		start_process: function(){
			if(this.stations>0){
				this.stations_key = true;
				// Inicializando la ruta del proceso
				for (this.i = 0; this.i < this.stations; this.i++){ this.process_route.push(this.i); this.process_route_values.push(0) }
			} else {
				alert("Elige un número mayor a cero.");
			}
		},
		process: function(){
			console.log("Enviando datos");
			console.log(this.stations_in_network);
      this.channel.push("sinergy:calculate", {data: this.stations_in_network})
        .receive('ok', (res) => {
					console.log("El channel respondió!!");
					console.log(res);
      });
		},
		store_station: function(){
			this.stations_in_network.push([this.service_time, this.servers, this.external_flow, this.process_route_values])
			if(this.current_station == this.stations){
				this.stations_key = false;
				this.results_key = true;
				alert("Se ingresaron los datos suficientes.");
			} else {
				alert("Se agregó con éxito 😎");
				this.current_station = this.current_station+1;
				this.service_time = 0;
				this.servers = 0;
				this.external_flow = 0;
				for (this.i = 0; this.i < this.stations; this.i++){ this.process_route_values[this.i] = 0; }
			}
		}
	}
});

