import wollok.game.*
import pjPrincipal.*
import monstruos.*

class Daga {
	
	var nivel
	var imagen
	var property position
	
	method image() = imagen
	method nivel() = nivel
}

class Escudo {
	
	var nivel
	var imagen
	var property position
	
	method image() = imagen
}


class Moneda {
	
	var cantidad
	var imagen
	var property position
	
	method image() = imagen
}

const daga1 = new Daga(nivel = 1, imagen = "src/dagas/dagaLVL1.png", position = game.at(2,2))