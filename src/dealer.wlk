import wollok.game.*
import pjPrincipal.*
import items.*

object dealer {
	
	// Para que se genere exactamente un Power Up de cada tipo - Ver una forma mejor
	var cantPP1 = 0
	var cantPP2 = 0
	var cantPP3 = 0
	var cantPP4 = 0
	
	const imagen = "assets/items/pelaAbajo.png" 
	var property position = game.at(4,5)
	
	method image() = imagen
//	method powerUpDisponibles() = powerUps
	method esEncontrado(personaje){
		self.mostrarOfertas(personaje)
	}
	
	method mostrarPowerUps(){
		const numero = (0.randomUpTo(4)).roundUp()
		if(numero == 1 and cantPP1 == 0){
			//Crear Power Up
			const powerUp1 = new PowerUp1(imagen = "assets/items/powerUp1.png", precio = 10, position = game.at(3,6))
			game.addVisual(powerUp1)	
			cantPP1++	
		}else if(numero == 1 and cantPP1 > 0){
			// Volver a intentar generar un power up random
			self.mostrarPowerUps()
		}
		if(numero == 2 and cantPP2 == 0){
			const powerUp2 = new PowerUp2(imagen = "assets/items/powerUp2.png", precio = 10, position = game.at(4,6))
			game.addVisual(powerUp2)
			cantPP2++		
		}else if(numero == 2 and cantPP2 > 0){
			self.mostrarPowerUps()
		}
		if(numero == 3 and cantPP3 == 0){
			const powerUp3 = new PowerUp3(imagen = "assets/items/powerUp3.png", precio = 10, position = game.at(3,7))
			game.addVisual(powerUp3)	
			cantPP3++		
		}else if(numero == 3 and cantPP3 > 0){
			self.mostrarPowerUps()
		}
		if(numero == 4 and cantPP4 == 0){
			const powerUp4 = new PowerUp4(imagen = "assets/items/powerUp4.png", precio = 10, position = game.at(4,7))
			game.addVisual(powerUp4)	
			cantPP4++		
		}else if(numero == 4 and cantPP4 > 0){
			self.mostrarPowerUps()
		}
	}
	method mostrarOfertas(personaje){
		/*
		 * 2. Mostrar todos los Power Ups con sus precios
		 * 3. Realizar Intercambio ()
		 */
		simulacroFondo.ponerFondo()
		personaje.moverse(false)
		self.mostrarPowerUps()
		self.mostrarPowerUps()
		self.mostrarPowerUps()
	}
}

object simulacroFondo{
	
	const imagen = "assets/fondo/fondo3.png"
	var property position = game.at(0,2)
	
	method image() = imagen
	method ponerFondo(){
		game.addVisual(self)
	}
}