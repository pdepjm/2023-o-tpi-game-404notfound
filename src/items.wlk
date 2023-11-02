import wollok.game.*
import pjPrincipal.*
import monstruos.*
import inventario.*
import tablero.*


class Items{
    
    var nivel
    var imagen
    var property position
    
    method image() = imagen
    method nivel() = nivel
    
    method esChocado(personaje)
}
class Daga inherits Items{

    override method esChocado(personaje){
        personaje.ataque(personaje.ataque() + nivel)
        nivel = 0
        imagen = "assets/items/vacio.png" 
    }
    
}

class Escudo inherits Items{

    override method esChocado(personaje){
        personaje.defensa(personaje.defensa() + nivel)
        nivel = 0
        imagen = "assets/items/vacio.png" 
    }
}


class Moneda inherits Items{


    override method esChocado(personaje){
        personaje.monedas(personaje.monedas() + nivel)
        nivel = 0
        imagen = "assets/items/vacio.png" 
    }
    
}

class Pocion inherits Items{

    override method esChocado(personaje){
        personaje.vida(personaje.vida() + nivel)
        nivel = 0
        imagen = "assets/items/vacio.png" 
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
		if (personaje.tiene(self)){
			personaje.vida(personaje.vida() + 1)
			personaje.defensa(personaje.defensa() + 1)
			personaje.ataque(personaje.ataque() + 1)
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
		if (personaje.tiene(self)){
			personaje.vida(personaje.vida() + 1)
			personaje.defensa(personaje.defensa() + 1)
			personaje.ataque(personaje.ataque() + 1)
		}
	}	
	
}

// Todos los monstruos pasan a ser de nivel 1
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
		if (personaje.tiene(self)){
			personaje.vida(personaje.vida() + 1)
			personaje.defensa(personaje.defensa() + 1)
			personaje.ataque(personaje.ataque() + 1)
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
		if (personaje.tiene(self)){
			personaje.vida(personaje.vida() + 1)
			personaje.defensa(personaje.defensa() + 1)
			personaje.ataque(personaje.ataque() + 1)
			}
		}	
	
	}

