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
	
//	const image = "assets/items/portal.png"

	method generarObjetosTablero(){
		
		new Range(start = 2, end = game.width()).forEach{
			fila => new Range(start = 0, end = game.height()).forEach{
				columna => self.generarObjeto(columna,fila)
			}
		}
	}


	method generarObjeto(columna,fila){
		
		const numero = (0.randomUpTo(7)).roundUp()
		
		if(numero == 1){
			const monstruo1 = new Monstruo(nivel = 1,position = game.at(columna,fila), imagen = "assets/monstruos/monstruo1.png")
			game.addVisual(monstruo1)			
		}
		if(numero == 2){
			const monstruo2 = new Monstruo(nivel = 2,position = game.at(columna,fila), imagen = "assets/monstruos/monstruo2.png")
			game.addVisual(monstruo2)			
		}
		if(numero == 3){
			const monstruo3 = new Monstruo(nivel = 3,position = game.at(columna,fila), imagen = "assets/monstruos/mago.png")
			game.addVisual(monstruo3)			
		}
		if(numero == 4){
			const vida1 = new Pocion(nivel = 1, imagen = "assets/items/falsaPocion.png", position = game.at(columna,fila))
			game.addVisual(vida1)			
		}
		if(numero == 5){
			const daga1 = new Daga(nivel = 1, imagen = "assets/dagas/dagaLVL1.png", position = game.at(columna,fila))
			game.addVisual(daga1)			
		}
		if(numero == 6){
			const escudo1 = new Escudo(nivel = 1, imagen = "assets/items/escudoAzul.png", position = game.at(columna,fila))
			game.addVisual(escudo1)			
		}
		if(numero == 7){
			const moneda1 = new Moneda(nivel = 1, imagen = "assets/items/falsaMoneda.png", position = game.at(columna,fila))
			game.addVisual(moneda1)			
		}
		if(numero == 8){
			const pinches1 = new Pinches(nivel = 1, imagen = "assets/items/pinchos1.png", position = game.at(columna,fila))
			game.addVisual(pinches1)			
		}

	}
	
	method cargarVisuales(){
	    game.boardGround("assets/fondo/fondo1.jpg") 
	    game.addVisual(ruben)
	    game.addVisual(texto_monedas)
	    game.addVisual(texto_vidas)
	    game.addVisual(texto_ataque)
	    game.addVisual(texto_defensa)
	    game.addVisual(portal)
	}
	

}