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


object powerUp1 {
	
	const imagen = "assets/items/powerUp1.png"
	
	method image() = imagen
	
	method esUsado(personaje)
	{
		if (personaje.tiene(self)){
			personaje.vida(personaje.vida() + 1)
			personaje.defensa(personaje.defensa() + 1)
			personaje.ataque(personaje.ataque() + 1)
		}
	}	
	
}

object powerUp2 {
	
	const imagen = "assets/items/powerUp2.png"
	
	method image() = imagen
	
	method esUsado(personaje)
	{
		if (personaje.tiene(self)){
		personaje.vidaMax(personaje.vidaMax() + 1)
		}
	}	
	
}


object powerUp3 {
	
	const imagen = "assets/items/powerUp3.png"
	
	method image() = imagen
	
	method esUsado(personaje)
	{
		if (personaje.tiene(self)){
			tablero.nivelMonstruo(1)
		}
	}	
}

object powerUp4 {
	
	const imagen = "assets/items/powerUp4.png"
	
	method image() = imagen
	
	method esUsado(personaje)
	{
		//if (personaje.tiene(self)){
		personaje.dobleMovimiento_(true)
		personaje.dobleMovimiento()
		//}
	}	
}
	

