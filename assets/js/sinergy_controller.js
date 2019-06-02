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
		store_station: function(){

		alert("Guardando!");
		}
	}
});

