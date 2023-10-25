import wollok.game.*
import pjPrincipal.*
import monstruos.*
import inventario.*
import celdasEspeciales.*

class Daga {

    var ataque
    var imagen
    var property position

    method image() = imagen
    
    method ataque() = ataque
        
    method esAgarrado(personaje){
        personaje.ataque(personaje.ataque() + ataque) 
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
    }

}

const daga1 = new Daga(ataque = 1, imagen = "assets/dagas/dagaLVL1.png", position = game.at(2,2))
const escudo1 = new Escudo(defensa = 1, imagen = "assets/items/escudoAzul.png", position = game.at(4,2))
const moneda1 = new Moneda(cantidad = 1, imagen = "assets/items/falsaMoneda.png", position = game.at(7,2))
const pocion1 = new Pocion(potencia = 1, imagen = "assets/items/falsaPocion.png", position = game.at(0,2))