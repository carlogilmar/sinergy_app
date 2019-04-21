import Vue from 'vue'
import socket from "./socket"
import {Howl, Howler} from 'howler';

export const app = new Vue({
	el:"#app",
	data: {
		message: "Cargando...",
		sound: null,
		melody_letter: "Iniciando"
	},
	created: function() {
		console.log("Trying to connect socket implementation...");
		this.channel = socket.channel("sinergy:app", {});
		this.channel.join()
			.receive("ok", resp => {
				console.log("Joined successfully", resp);
				this.message = " 😊 ";
				this.melody_letter = resp.song;
				this.sound = new Howl({ src: [ '/music/'+resp.song+'.m4a' ], volume: 1, loop: true});
				this.sound.play();
			})
			.receive("error", resp => {
				console.log("Unable to join", resp);
				this.message = " 💀 ";
			});
	},
	methods:{
	}
});

