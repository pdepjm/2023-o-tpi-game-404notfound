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
	var property position
	var property desaparecer = false //Desaparece una vez que interactue con el pjPrincipal y aparece al generar nuevo lvl
	const catalogo = []
	const imagen = "assets/items/pelaAbajo.png" 
	
	
	method image() = imagen	
	method columna() = columna
	method fila() = fila
	
	method generarPosicion() {
		columna = (0.randomUpTo(8)).roundUp()
		fila = (2.randomUpTo(10)).roundUp()
		if (columna == portal.columna() and fila == 10) {
			self.generarPosicion()
		}
    	position = game.at(columna,fila)
	}
	

	method esChocado(personaje){
		if(!ruben.tienePowerUp()){
		  self.mostrarOfertas(personaje)
		}
		else game.say(self, "Ya tenés \n un Power Up")
	}
	
	
	
	method mostrarOfertas(personaje){
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
		simulacroFondo.ponerFondo()
		personaje.moverse(false)
		self.mostrarPowerUps()
		self.mostrarPowerUps()
		self.mostrarPowerUps()
		self.actualizarDealer()
		personaje.seleccionarPowerUp()
		personaje.intentarComprar(personaje.powerUpSeleccionado())
		self.realizarIntercambio(ruben)

		keyboard.del().onPressDo({self.removerVisuales(personaje)})	
}
	
	method mostrarPowerUps(){
		const numero = (0.randomUpTo(4)).roundUp()
		if(numero == 1 and cantPP1 == 0){
			//Crear Power Up
			game.addVisual(powerUp1)
			catalogo.add(powerUp1)
			cantPP1++	
		}else if(numero == 1 and cantPP1 > 0){
			// Volver a intentar generar un power up random
			self.mostrarPowerUps()
		}
		if(numero == 2 and cantPP2 == 0){
			game.addVisual(powerUp2)
			catalogo.add(powerUp2)
			cantPP2++		
		}else if(numero == 2 and cantPP2 > 0){
			self.mostrarPowerUps()
		}
		if(numero == 3 and cantPP3 == 0){
			game.addVisual(powerUp3)
			catalogo.add(powerUp3)	
			cantPP3++		
		}else if(numero == 3 and cantPP3 > 0){
			self.mostrarPowerUps()
		}
		if(numero == 4 and cantPP4 == 0){
			game.addVisual(powerUp4)
			catalogo.add(powerUp4)	
			cantPP4++		
		}else if(numero == 4 and cantPP4 > 0){
			self.mostrarPowerUps()
		}

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

	method reiniciarCatalogo() {
		cantPP1 = 0
		cantPP2 = 0
		cantPP3 = 0
		cantPP4 = 0
		catalogo.clear()
	}

	method removerVisuales(personaje){
		game.removeVisual(simulacroFondo)
		game.removeVisual(self)
		catalogo.forEach{powerUp_ => tablero.removerVisual(powerUp_)}
		personaje.moverse(true)
		self.desaparecer(true)
		self.reiniciarCatalogo()
		if (ruben.tienePowerUp()){
			game.addVisual(personaje.powerUpQueTiene())
		}
	}
}

object simulacroFondo{
	const imagen = "assets/fondo/fondoCatalogo.png"
	var property position = game.at(0,2)
	
	method image() = imagen
	method ponerFondo(){
		game.addVisual(self)
	}
}