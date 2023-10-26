import wollok.game.*
import pjPrincipal.*
import monstruos.*
import inventario.*
import tablero.*

class Daga {

    var ataque
    var imagen
    var property position

    method image() = imagen
    
    method ataque() = ataque
    
    method esAgarrado(personaje){
        personaje.ataque(personaje.ataque() + ataque)
        ataque = 0
        imagen = "assets/items/vacio.png" 
    }
    
    method esAtacado(personaje){
    	// Se supone que este metodo no haga nada
    }
}

class Escudo {

    var defensa
    var imagen
    var property position

    method image() = imagen

    method defensa() = defensa

    method esAgarrado(personaje){
        personaje.defensa(personaje.defensa() + defensa)
        defensa = 0
        imagen = "assets/items/vacio.png"
    }
    method esAtacado(personaje){
    	// Se supone que este metodo no haga nada
    }

}


class Moneda {

    var cantidad
    var imagen
    var property position

    method image() = imagen

    method monedas() = cantidad
    
    method esAgarrado(personaje){
        personaje.monedas(personaje.monedas() + cantidad) 
        cantidad = 0
        imagen = "assets/items/vacio.png"
    }
    method esAtacado(personaje){
    	// Se supone que este metodo no haga nada
    }
}

class Pocion {

    var potencia
    var imagen
    var property position

    method image() = imagen

    method vida() = potencia

    method esAgarrado(personaje){
        personaje.vida(personaje.vida() + potencia)
     	potencia = 0
     	imagen = "assets/items/vacio.png"
    }
    method esAtacado(personaje){
    	// Se supone que este metodo no haga nada
    }
}

class Pinches {

    var nivel
    var imagen
    var property position

    method image() = imagen

    method esAgarrado(personaje){
        personaje.vida((personaje.vida() - nivel).max(0))
     	nivel = 0
     	imagen = "assets/items/vacio.png"
    }
    method esAtacado(personaje){
    	// Se supone que este metodo no haga nada
    }
}

const daga1 = new Daga(ataque = 1, imagen = "assets/dagas/dagaLVL1.png", position = game.at(2,2))
const escudo1 = new Escudo(defensa = 1, imagen = "assets/items/escudoAzul.png", position = game.at(4,2))
const moneda1 = new Moneda(cantidad = 1, imagen = "assets/items/falsaMoneda.png", position = game.at(7,2))
const pocion1 = new Pocion(potencia = 1, imagen = "assets/items/falsaPocion.png", position = game.at(0,2))