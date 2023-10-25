import wollok.game.*
import monstruos.*
import items.*
import pjPrincipal.*
import inventario.*

object portal {

    const imagen = "assets/items/portal.png"

    var property position = game.at(4,10)

    method image() = imagen

}

object tablero {
	
	method dimension(){
	    game.width(9)
    	game.height(11)
	}
	method cargarVisuales(){
	    game.boardGround("assets/fondo/fondo1.jpg") 
	    game.addVisual(ruben)
	    game.addVisual(enemigo)
	    game.addVisual(enemigo2)
	    game.addVisual(daga1)
	    game.addVisual(texto_monedas)
	    game.addVisual(texto_vidas)
	    game.addVisual(texto_ataque)
	    game.addVisual(texto_defensa)
	    game.addVisual(escudo1)
	    game.addVisual(pocion1)
	    game.addVisual(moneda1)
	    game.addVisual(portal)
	}
}