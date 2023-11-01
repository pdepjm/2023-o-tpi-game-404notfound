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
	var powerUpSeleccionado
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
	
	method mostrarPowerUps(){
		const numero = (0.randomUpTo(4)).roundUp()
		if(numero == 1 and cantPP1 == 0){
			//Crear Power Up
			const powerUp1 = new PowerUp1(imagen = "assets/items/powerUp1.png", precio = 10, position = game.at(6,5), nombre = "powerUp1")
			game.addVisual(powerUp1)
			catalogo.add(powerUp1)
			cantPP1++	
		}else if(numero == 1 and cantPP1 > 0){
			// Volver a intentar generar un power up random
			self.mostrarPowerUps()
		}
		if(numero == 2 and cantPP2 == 0){
			const powerUp2 = new PowerUp2(imagen = "assets/items/powerUp2.png", precio = 10, position = game.at(6,7), nombre = "powerUp2")
			game.addVisual(powerUp2)
			catalogo.add(powerUp2)
			cantPP2++		
		}else if(numero == 2 and cantPP2 > 0){
			self.mostrarPowerUps()
		}
		if(numero == 3 and cantPP3 == 0){
			const powerUp3 = new PowerUp3(imagen = "assets/items/powerUp3.png", precio = 10, position = game.at(4,5), nombre = "powerUp3")
			game.addVisual(powerUp3)
			catalogo.add(powerUp3)	
			cantPP3++		
		}else if(numero == 3 and cantPP3 > 0){
			self.mostrarPowerUps()
		}
		if(numero == 4 and cantPP4 == 0){
			const powerUp4 = new PowerUp4(imagen = "assets/items/powerUp4.png", precio = 10, position = game.at(4,7), nombre = "powerUp4")
			game.addVisual(powerUp4)
			catalogo.add(powerUp4)	
			cantPP4++		
		}else if(numero == 4 and cantPP4 > 0){
			self.mostrarPowerUps()
		}
		
//		self.actualizarPosicionesPowerUps()
	}

/*
	method actualizarPosicionesPowerUps() {
		new Range(start = 1, end = 3).forEach{
		catalogo.first().position(game.at(1,6))
		game.addVisual(catalogo.first())
		catalogo.drop(1).first().position(game.at(3,6))
		game.addVisual(catalogo.drop(1).first())
		catalogo.drop(2).first().position(game.at(5,6))
		game.addVisual(catalogo.drop(2).first())
	}
}
*/
	method actualizarDealer(){
		game.removeVisual(self)
		self.position(game.at(4,9))
		game.addVisual(self)
		game.say(self, "Que desea \n comprar?")
	}
	
	method realizarIntercambio(personaje){
		if(personaje.puedeComprar(powerUpSeleccionado)){		
			personaje.comprar(powerUpSeleccionado)
		}
		else game.say(self, "No te alcanza pa")
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
		self.buscarPowerUps()
		self.realizarIntercambio(personaje)
		keyboard.del().onPressDo({self.removerVisuales(personaje)})
//		keyboard.del().onPressDo({self.removerVisuales()})
//		keyboard.del().onPressDo({personaje.moverse(true)})
//		keyboard.c().onPressDo({self.removerVisuales()}, {personaje.moverse(true)})
	
	}
	
	method buscarPowerUps(){
		
		keyboard.num1().onPressDo({
		powerUpSeleccionado = catalogo.find{powerUp_ => powerUp_.nombre() == "powerUp1"}
	    })
		
	    keyboard.num2().onPressDo({
	    powerUpSeleccionado = catalogo.find{powerUp_ => powerUp_.nombre() == "powerUp2"}
	    })
	    
	    keyboard.num3().onPressDo({
		powerUpSeleccionado = catalogo.find{powerUp_ => powerUp_.nombre() == "powerUp3"}
	    })
	    
	    keyboard.num4().onPressDo({
		powerUpSeleccionado = catalogo.find{powerUp_ => powerUp_.nombre() == "powerUp4"}  	
	    
					})
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
	}
	method esChocado(personaje){
		self.mostrarOfertas(personaje)
	}
	
	method obtenerObjeto() = catalogo.find{powerUp_ => powerUp_.nombre() == "powerUp1"}
	
}

object simulacroFondo{
	const imagen = "assets/fondo/fondoCatalogo.png"
	var property position = game.at(0,2)
	
	method image() = imagen
	method ponerFondo(){
		game.addVisual(self)
	}
}