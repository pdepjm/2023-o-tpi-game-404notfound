import wollok.game.*
import pjPrincipal.*

class Monstruo {
	
	var property position
	var nivel
	var imagen
	/* Cambiar por property */
	method nivel() = nivel
	method nuevoNivel(nivel_){
		nivel = nivel_
	}
	method image() = imagen
	method mensaje(){
		game.say(self, "A casa loco " /*+ PjNombre.nombre()*/)
	}

}
const enemigo = new Monstruo(nivel = 6,position = game.center(), imagen = "monstruos/ogroLVL3.png")
const enemigo2 = new Monstruo(nivel = 1,position = game.at(2,3), imagen = "monstruos/ciclope_preview.png")
