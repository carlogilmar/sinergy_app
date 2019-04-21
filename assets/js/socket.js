import {Socket} from "phoenix"
let socket = new Socket("/socket", {params: {user: "phoenix"}})
socket.connect()
export default socket
