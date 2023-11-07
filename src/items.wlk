import wollok.game.*
import pjPrincipal.*
import monstruos.*
import inventario.*
import tablero.*
import dealer.*

class Items{
    
    var nivel
    var imagen
    var property position
    
    method image() = imagen
    method nivel() = nivel
    
    method esChocado(personaje) {
    	nivel = 0
        imagen = "assets/items/vacio.png" 
    }
}
class Daga inherits Items{

    override method esChocado(personaje){
    	personaje.ataque(personaje.ataque() + nivel)
		super(personaje)

    }
    
}

class Escudo inherits Items{

    override method esChocado(personaje){
    	personaje.defensa(personaje.defensa() + nivel)
		super(personaje)

    }
}


class Moneda inherits Items{


    override method esChocado(personaje){
        personaje.monedas(personaje.monedas() + nivel)
    	super(personaje)
    }
    
}

class Pocion inherits Items{

    override method esChocado(personaje){
    	personaje.vida(personaje.vida() + nivel)
    	super(personaje)


    }

}

class Pinches inherits Items{

    override method esChocado(personaje){
        personaje.vida((personaje.vida() - nivel).max(0))
        imagen = "assets/items/pinchosSangre.png"
        personaje.estasVivo()
    }

}


// Aumentar en 1 cada Item que tenga menos las monedas
object powerUp1 {
		
	const imagen = "assets/items/powerUp1.png" 
	const precio = 10
	var property position = game.at(6,5)
	const  nombre = "powerUp1"
	
	method image() = imagen
	method precio() = precio
	method nombre()	= nombre

	method esUsado(personaje)
	{
		if (personaje.tiene() == dealer.powerUpComprado()){
			personaje.vida(personaje.vida() + 1)
			personaje.defensa(personaje.defensa() + 1)
			personaje.ataque(personaje.ataque() + 1)
			game.removeVisual(self)
			ruben.tiene(false)
		}
	}	
}

// Aumenta la vida maxima. Caso Base de 3 a 4 corazones
object powerUp2 {
		
	const imagen = "assets/items/powerUp2.png" 
	const precio = 10
	var property position = game.at(6,7)
	const nombre = "powerUp2"

	method image() = imagen
	method precio() = precio

	method nombre()	= nombre

	method esUsado(personaje)
	{
		if (personaje.tiene() == dealer.powerUpComprado()){
			personaje.vidaMax(personaje.vidaMax() + 1)
			game.removeVisual(self)
			ruben.tiene(false)
		}
	}	
	
}

// Todos los monstruos de nivel 2 pasan a ser de nivel 1, a partir del siguiente nivel
object powerUp3 {
		
	const imagen = "assets/items/powerUp3.png" 
	const precio = 10
	var property position = game.at(4,5)
	const nombre = "powerUp3"
	
	method image() = imagen
	method precio() = precio
	method nombre()	= nombre

	method esUsado(personaje)
	{
		if (personaje.tiene() == dealer.powerUpComprado()){
			 tablero.nivelMonstruo(1) 
			 game.removeVisual(self)
			 ruben.tiene(false)
		}
	}	
}

//Moverse 2 casillas
object powerUp4 {
		
	const  imagen = "assets/items/powerUp4.png"
	const precio = 10 
	var property position = game.at(4,7)
	const nombre = "powerUp4"
	
	method image() = imagen
	method precio() = precio
	method nombre()	= nombre

	method esUsado(personaje)
	{
		if (personaje.tiene() == dealer.powerUpComprado()){
			personaje.cantidadDeMovimiento(2)
			game.removeVisual(self)
			ruben.tiene(false)
			}
		}	
	
	}

