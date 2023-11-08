import wollok.game.*
import pjPrincipal.*
import items.*
import tablero.*

object dealer {
	
	// Para que se genere exactamente un Power Up de cada tipo - Ver una forma mejor
	var cantPP1 = 0
	var cantPP2 = 0
	var cantPP3 = 0
	var cantPP4 = 0
	var columna
	var fila
	var objetoSeleccionado
	var property position
	var property desaparecer = false //Desaparece una vez que interactue con el pjPrincipal y aparece al generar nuevo lvl
	var catalogo = [powerUp1,powerUp2,powerUp3,powerUp4]
	var posicionesPP = [game.at(3,6),game.at(4,6),game.at(5,6)]
	var stock = []
	const imagen = "assets/items/pelaAbajo.png" 
	
	
	method image() = imagen	
	method columna() = columna
	method fila() = fila
	
	method generarPosicion() {

		posicionesPP = [game.at(3,6),game.at(4,6),game.at(5,6)]
		stock = []
		self.reponePowerUps()
		
		columna = (0.randomUpTo(8)).roundUp()
		fila = (2.randomUpTo(10)).roundUp()
		if (columna == portal.columna() and fila == 10) {
			self.generarPosicion()
		}
    	position = game.at(columna,fila)
	}
	

	method esChocado(personaje){
		if(ruben.tienePowerUp()){
			game.say(self, "Ya tenés \n un Power Up")
		}else{
			 self.mostrarOfertas(personaje)
		}

	}
	method mostrarOfertas(personaje){

		keyboard.del().onPressDo({self.removerVisuales(personaje)})
		fondoPowerUp.ponerFondo()

		personaje.moverse(false)
		
		self.mostrarPowerUp()
		self.mostrarPowerUp()
		self.mostrarPowerUp()
		
		self.actualizarDealer()
		
		personaje.seleccionarPowerUp()
}
	
	method reponePowerUps(){
		catalogo = [powerUp1,powerUp2,powerUp3,powerUp4]
	}
	method mostrarPowerUp(){
		objetoSeleccionado = catalogo.anyOne()
		objetoSeleccionado.position(posicionesPP.first())
		stock.add(objetoSeleccionado)
		game.addVisual(objetoSeleccionado)
		posicionesPP = posicionesPP.copyWithout(posicionesPP.first())
		catalogo = catalogo.copyWithout(objetoSeleccionado)
	}
	
	method obtenerPowerUpEnNPosicion(posicion) = stock.get(posicion) 
	method actualizarDealer(){
		game.removeVisual(self)
		self.position(game.at(4,9))
		game.addVisual(self)
		game.say(self, "Que desea \n comprar?")
	}

	method removerVisuales(personaje){
		game.removeVisual(fondoPowerUp)
		game.removeVisual(self)
		stock.forEach{powerUp_ => tablero.removerVisual(powerUp_)}
		personaje.moverse(true)
		self.desaparecer(true)
		if (ruben.tienePowerUp()){
			game.addVisual(personaje.powerUpQueTiene())
			}
		}
}

object fondoPowerUp{
	const imagen = "assets/fondo/fondoCatalogo.png"
	var property position = game.at(0,2)
	
	method image()= imagen
	method ponerFondo(){
		game.addVisual(self)
	}
}