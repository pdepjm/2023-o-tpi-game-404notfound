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
    
    method esAgarrado(personaje)
    
    method esAtacado(personaje){
    	// Se supone que este metodo no haga nada
    }
    
    method generarNivel() {}
    
    method esChocado(personaje){}
}
class Daga inherits Items{

    override method esAgarrado(personaje){
        personaje.ataque(personaje.ataque() + nivel)
        nivel = 0
        imagen = "assets/items/vacio.png" 
    }
    
}

class Escudo inherits Items{

    override method esAgarrado(personaje){
        personaje.defensa(personaje.defensa() + nivel)
        nivel = 0
        imagen = "assets/items/vacio.png" 
    }
}


class Moneda inherits Items{


    override method esAgarrado(personaje){
        personaje.monedas(personaje.monedas() + nivel)
        nivel = 0
        imagen = "assets/items/vacio.png" 
    }
    
}

class Pocion inherits Items{

    override method esAgarrado(personaje){
        personaje.vida(personaje.vida() + nivel)
        nivel = 0
        imagen = "assets/items/vacio.png" 
    }

}

class Pinches inherits Items{

    override method esAgarrado(personaje){
        personaje.vida((personaje.vida() - nivel).max(0))
        imagen = "assets/items/pinchosSangre.png"
        personaje.estasVivo()
    }

}

class PowerUp {
	
	const imagen
	const precio
	const position
	
	method position() = position
	method image() = imagen
	method precio() = precio
	method esUsado(personaje)
	
}
// Aumentar en 1 cada Item que tenga menos las monedas
class PowerUp1 inherits PowerUp{
	
	override method esUsado(personaje)
	{
		if (personaje.tiene(self)){
			personaje.vida(personaje.vida() + 1)
			personaje.defensa(personaje.defensa() + 1)
			personaje.ataque(personaje.ataque() + 1)
		}
	}	
	
}

// Aumenta la vida maxima. Caso Base de 3 a 4 corazones
class PowerUp2 inherits PowerUp{
	
	override method esUsado(personaje)
	{
		if (personaje.tiene(self)){
		personaje.vidaMax(personaje.vidaMax() + 1)
		}
	}	
	
}

// Todos los monstruos pasan a ser de nivel 1
class PowerUp3 inherits PowerUp{
	
	override method esUsado(personaje)
	{
		if (personaje.tiene(self)){
			tablero.nivelMonstruo(1)
		}
	}	
}
//Moverse 2 casillas
class PowerUp4 inherits PowerUp{
	
	override method esUsado(personaje)
	{
		if (personaje.tiene(self)){
			personaje.dobleMovimiento_(true)
			personaje.dobleMovimiento()
		}
	}	
}
	

