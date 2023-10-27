import wollok.game.*
import pjPrincipal.*

object dealer {
	
	const imagen = "assets/items/pelaAbajo.png" 
	var property position = game.at(4,5)
	
	method image() = imagen
	
	method esEncontrado(personaje){
		self.mostrarOfertas(personaje)
	}
	
	method mostrarOfertas(personaje){
		game.boardGround("assets/fondo/fondo2.jpg") 
	}

}
