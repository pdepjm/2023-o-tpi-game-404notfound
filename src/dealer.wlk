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
	const imagen = "assets/items/pelaAbajo.png" 
	
	
	method image() = imagen	
	method columna() = columna
	method fila() = fila
	
	method generarPosicion() {
		posicionesPP = [game.at(3,6),game.at(4,6),game.at(5,6)]
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

		fondoPowerUp.ponerFondo()
		fondoPowerUp.cargarVisualesPP()
		
		personaje.moverse(false)
		
		self.mostrarPowerUpsBis()
		self.mostrarPowerUpsBis()
		self.mostrarPowerUpsBis()
		
		self.actualizarDealer()
		personaje.comprar()
		//personaje.seleccionarPowerUp()
		//personaje.intentarComprar(personaje.powerUpSeleccionado())
		//self.realizarIntercambio(ruben)

		keyboard.del().onPressDo({self.removerVisuales(personaje)})
		self.reponePowerUps()
		/*
		 * 2. Mostrar todos los Power Ups con sus precios
		 * 2.2 Mostrar Precios + ¿Descripcion?
		 * 3. Realizar Intercambio ()
		 * 3.1 Tocar Tecla para elegir que power Up queremos
		 * 3.2 Restarnos la cantidad de plata que sale el powerUp
		 * 3.3 Añadir powerUp al inventario
		 * 4. Sacar fondoCatalogo
		 * 5. ¿Sacar al dealer?
		 * 6. Hacer que ruben se vuelva a mover 
		 */
		
}
	
	method reponePowerUps(){
		catalogo = [powerUp1,powerUp2,powerUp3,powerUp4]
	}
	method mostrarPowerUpsBis(){
		objetoSeleccionado = catalogo.anyOne()
		objetoSeleccionado.position(posicionesPP.first())
		posicionesPP = posicionesPP.copyWithout(posicionesPP.first())
		catalogo = catalogo.copyWithout(objetoSeleccionado)
	}

	method actualizarDealer(){
		game.removeVisual(self)
		self.position(game.at(4,9))
		game.addVisual(self)
		game.say(self, "Que desea \n comprar?")
	}
	
	
	method realizarIntercambio(personaje){
		if(personaje.tienePowerUp()){
			self.removerVisuales(personaje)
		}
		else game.say(self, "No te alcanza pa")
	}

	method removerVisuales(personaje){
		game.removeVisual(fondoPowerUp)
		game.removeVisual(self)
		catalogo.forEach{powerUp_ => fondoPowerUp.removerVisual(powerUp_)}
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
	
	method cargarVisualesPP(){
	    game.addVisual(powerUp1)
	    game.addVisual(powerUp2)
	    game.addVisual(powerUp3)
	    game.addVisual(powerUp4)
	}
	method removerVisual(powerUp_){
		game.removeVisual(powerUp_)
	}
}