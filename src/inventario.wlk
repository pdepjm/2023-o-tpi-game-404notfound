import wollok.game.*
import monstruos.*
import items.*
import pjPrincipal.*

object texto_vidas {

    method position() = game.at(0,0)

    method text() = "Vidas: " + ruben.vida()
    
    method esChocado(personaje){}
}

object texto_ataque {

    method position() = game.at(2,0)

    method text() = "Ataque: " + ruben.ataque()
    
    method esChocado(personaje){}
}

object texto_defensa {

    method position() = game.at(4,0)

    method text() = "Defensa: " + ruben.defensa()
    
    method esChocado(personaje){}
}


object texto_monedas {

    method position() = game.at(6,0)

    method text() = "Monedas: " + ruben.monedas()
    
    method esChocado(personaje){}
}

object texto_puntuacion {

    method position() = game.at(0,1)

    method text() = "Puntuacion: " + ruben.puntuacion()
    
    method esChocado(personaje){}
}