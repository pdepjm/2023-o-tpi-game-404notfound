import wollok.game.*
import monstruos.*
import items.*
import pjPrincipal.*
import inventario.*
import dealer.*

object portal {

    const imagen = "assets/items/portal.png"
	
	const columna = (0.randomUpTo(8)).roundUp()
    var property position = game.at(columna,10)

    method image() = imagen
	method columna() = columna
	
	method generarNivel() {
		
		tablero.limpiarse()
		tablero.generarObjetosTablero()
    	tablero.cargarVisuales()
	}
	
	method esAtacado(personaje){}
	
	method esAgarrado(personaje){}
}

object tablero {
	
	var nivelMonstruo = 2
	
	method nivelMonstruo(nuevoNivel) {nivelMonstruo = nuevoNivel} 

	method generarObjetosTablero(){
		
		new Range(start = 2, end = game.width()+1).forEach{
			fila => new Range(start = 0, end = game.height()).forEach{
				columna => self.generarObjeto(columna,fila)
			}
		}
	}


	method generarObjeto(columna,fila){
		
		    // Posicion Ruben 					Posicion Portal
		if((columna == 4 and fila == 2) or (columna == portal.columna() and fila == 10)){
			
		}else{
			const numero = (0.randomUpTo(13)).roundUp()
			if(numero == 1){
				const monstruo1 = new Monstruo(nivel = 1,position = game.at(columna,fila), imagen = "assets/monstruos/monstruo1.png")
				game.addVisual(monstruo1)			
			}
			if(numero == 2){
				const monstruo2 = new Monstruo(nivel = nivelMonstruo,position = game.at(columna,fila), imagen = "assets/monstruos/monstruo2.png")
				game.addVisual(monstruo2)			
			}
			if(numero == 3){
				const monstruo3 = new Monstruo(nivel = 3,position = game.at(columna,fila), imagen = "assets/monstruos/mago.png")
				game.addVisual(monstruo3)			
			}
			if(numero == 4){
				const vida1 = new Pocion(nivel = 1, imagen = "assets/items/pocion1.png", position = game.at(columna,fila))
				game.addVisual(vida1)
							
			}
			if(numero == 5){
				const vida2 = new Pocion(nivel = 2, imagen = "assets/items/pocion2.png", position = game.at(columna,fila))
				game.addVisual(vida2)			
			}
			if(numero == 6){
				const daga1 = new Daga(nivel = 1, imagen = "assets/items/espada1.png", position = game.at(columna,fila))
				game.addVisual(daga1)			
			}
			if(numero == 7){
				const daga2 = new Daga(nivel = 2, imagen = "assets/items/espada2.png", position = game.at(columna,fila))
				game.addVisual(daga2)			
			}
			if(numero == 8){
				const daga3 = new Daga(nivel = 3, imagen = "assets/items/espada3.png", position = game.at(columna,fila))
				game.addVisual(daga3)			
			}
			if(numero == 9){
				const escudo1 = new Escudo(nivel = 1, imagen = "assets/items/escudo1.png", position = game.at(columna,fila))
				game.addVisual(escudo1)			
			}
			if(numero == 10){
				const escudo2 = new Escudo(nivel = 2, imagen = "assets/items/escudo2.png", position = game.at(columna,fila))
				game.addVisual(escudo2)			
			}
			if(numero == 11){
				const escudo3 = new Escudo(nivel = 3, imagen = "assets/items/escudo3.png", position = game.at(columna,fila))
				game.addVisual(escudo3)			
			}
			if(numero == 12){
				const moneda1 = new Moneda(nivel = 1, imagen = "assets/items/moneda1.png", position = game.at(columna,fila))
				game.addVisual(moneda1)			
			}
			if(numero == 13){
				const pinches1 = new Pinches(nivel = 1, imagen = "assets/items/pinchos1.png", position = game.at(columna,fila))
				game.addVisual(pinches1)			
			}
			
		}
			
}
			
	method limpiarse() {
			new Range(start = 2, end = game.width()+1).forEach{
			fila => new Range(start = 0, end = game.height()).forEach{
				columna => game.removeVisual(game.getObjectsIn((game.at(columna,fila))))
			}}

	}
	

	method cargarVisuales(){
	    game.boardGround("assets/fondo/fondo1.jpg") 
	    game.addVisual(texto_monedas)
	    game.addVisual(texto_vidas)
	    game.addVisual(texto_ataque)
	    game.addVisual(texto_defensa)
	    game.addVisual(texto_puntuacion)
	    //game.addVisual(dealer)
	    game.addVisual(portal)
	    game.addVisual(ruben)
	}

}