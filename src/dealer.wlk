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
	var property powerUpSeleccionado
	var property position
	var property desaparecer = false //Desaparece una vez que interactue con el pjPrincipal y aparece al generar nuevo lvl
	const catalogo = []
	const imagen = "assets/items/pelaAbajo.png" 
	
	
	method image() = imagen
	
	//method powerUpSeleccionado(powerUp_)
	
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
		if(personaje.puedeComprar(self.powerUpSeleccionado())){		
			personaje.comprar(self.powerUpSeleccionado())
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
		//self.buscarPowerUps()
		ruben.seleccionarPowerUp()
		//jugador elige el power powerUp
		
			
		keyboard.a().onPressDo({self.removerVisuales(personaje)})
//		keyboard.del().onPressDo({self.removerVisuales()})
//		keyboard.del().onPressDo({personaje.moverse(true)})
//		keyboard.c().onPressDo({self.removerVisuales()}, {personaje.moverse(true)})
	
	}
	

	/*method buscarPowerUps(){
		
		keyboard.z().onPressDo({
			powerUpSeleccionado = powerUp1
		//powerUpSeleccionado = catalogo.find{powerUp_ => powerUp_.nombre() == "powerUp1"}
	    })
		
	    keyboard.x().onPressDo({
	    	powerUpSeleccionado = powerUp2
	    //powerUpSeleccionado = catalogo.find{powerUp_ => powerUp_.nombre() == "powerUp2"}
	    })
	    
	    keyboard.c().onPressDo({
			powerUpSeleccionado = powerUp3
		//powerUpSeleccionado = catalogo.find{powerUp_ => powerUp_.nombre() == "powerUp3"}
	    })
	    
	    keyboard.v().onPressDo({
			powerUpSeleccionado = powerUp4
		//powerUpSeleccionado = catalogo.find{powerUp_ => powerUp_.nombre() == "powerUp4"}  	
	    
					})
	}*/

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
		game.addVisual(self.powerUpSeleccionado())
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