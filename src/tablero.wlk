import wollok.game.*
import monstruos.*
import items.*
import pjPrincipal.*
import inventario.*
import dealer.*

object portal {

    const imagen = "assets/items/portal.png"
    
    var columna
    
    var property position

    method image() = imagen
	method columna() = columna
	
	method generarPosicion() {
		columna = (0.randomUpTo(8)).roundUp()
    	position = game.at(columna,10)
	}
	
	method generarNivel() {
		
		tablero.limpiarse()
    	tablero.cargarVisualesInicio()
	}
	
	method esAtacado(personaje){}
	
	method esAgarrado(personaje){}
	
	method esChocado(personaje){}
	
	method mostrarOfertas(personaje){}
}

class Pared {
	var property position
	
	method esChocado(personaje){
		
		personaje.volverAPosicion()
	}
	
	method esAtacado(personaje){}
	
	method esAgarrado(personaje){} 
	
	method generarNivel(){}
	
	method mostrarOfertas(personaje){}
	
}

object tablero {
	
	// Actualizar el nivel del monstruo - VER
	var nivelMonstruo = 2
	
	const objetosEnTablero = []
	
	method nivelMonstruo(nuevoNivel) {nivelMonstruo = nuevoNivel} 

	method generarObjetosTablero(){
		
		dealer.generarPosicion()		
		portal.generarPosicion()
		
		new Range(start = 2, end = game.width()+1).forEach{
			fila => new Range(start = 0, end = game.height()).forEach{
				columna => self.generarObjeto(columna,fila)
			}
		}
	}

	method generarObjeto(columna,fila){
		
		    // Posicion Ruben 					Posicion Portal									Posicion Dealer
		if((columna == 4 and fila == 2) or (columna == portal.columna() and fila == 10) or (columna == dealer.columna() and fila == dealer.fila())){
			// Se supone que este vacio para que no se generen objetos random en las posiciones de esos objetos
		}else{
			const numero = (0.randomUpTo(13)).roundUp()
			if(numero == 1){
				const monstruo1 = new Monstruo(nivel = 1,position = game.at(columna,fila), imagen = "assets/monstruos/monstruo1.png")
				game.addVisual(monstruo1)
				objetosEnTablero.add(monstruo1)			
			}
			if(numero == 2){
				const monstruo2 = new Monstruo(nivel = nivelMonstruo,position = game.at(columna,fila), imagen = "assets/monstruos/monstruo2.png")
				game.addVisual(monstruo2)
				objetosEnTablero.add(monstruo2)				
			}
			if(numero == 3){
				const monstruo3 = new Monstruo(nivel = 3,position = game.at(columna,fila), imagen = "assets/monstruos/mago.png")
				game.addVisual(monstruo3)
				objetosEnTablero.add(monstruo3)					
			}
			if(numero == 4){
				const vida1 = new Pocion(nivel = 1, imagen = "assets/items/pocion1.png", position = game.at(columna,fila))
				game.addVisual(vida1)
				objetosEnTablero.add(vida1)					
			}
			if(numero == 5){
				const vida2 = new Pocion(nivel = 2, imagen = "assets/items/pocion2.png", position = game.at(columna,fila))
				game.addVisual(vida2)
				objetosEnTablero.add(vida2)				
			}
			if(numero == 6){
				const daga1 = new Daga(nivel = 1, imagen = "assets/items/espada1.png", position = game.at(columna,fila))
				game.addVisual(daga1)
				objetosEnTablero.add(daga1)				
			}
			if(numero == 7){
				const daga2 = new Daga(nivel = 2, imagen = "assets/items/espada2.png", position = game.at(columna,fila))
				game.addVisual(daga2)
				objetosEnTablero.add(daga2)				
			}
			if(numero == 8){
				const daga3 = new Daga(nivel = 3, imagen = "assets/items/espada3.png", position = game.at(columna,fila))
				game.addVisual(daga3)
				objetosEnTablero.add(daga3)			
			}
			if(numero == 9){
				const escudo1 = new Escudo(nivel = 1, imagen = "assets/items/escudo1.png", position = game.at(columna,fila))
				game.addVisual(escudo1)
				objetosEnTablero.add(escudo1)			
			}
			if(numero == 10){
				const escudo2 = new Escudo(nivel = 2, imagen = "assets/items/escudo2.png", position = game.at(columna,fila))
				game.addVisual(escudo2)			
				objetosEnTablero.add(escudo2)
			}
			if(numero == 11){
				const escudo3 = new Escudo(nivel = 3, imagen = "assets/items/escudo3.png", position = game.at(columna,fila))
				game.addVisual(escudo3)
				objetosEnTablero.add(escudo3)			
			}
			if(numero == 12){
				const moneda1 = new Moneda(nivel = 1, imagen = "assets/items/moneda1.png", position = game.at(columna,fila))
				game.addVisual(moneda1)
				objetosEnTablero.add(moneda1)			
			}
			if(numero == 13){
				const pinches1 = new Pinches(nivel = 1, imagen = "assets/items/pinchos1.png", position = game.at(columna,fila))
				game.addVisual(pinches1)
				objetosEnTablero.add(pinches1)			
			}
			
		}
}

		
	method generarParedes() {
			
		new Range(start = 0, end = game.width()).forEach{
				columna => self.generarPared(columna,1)
			}

		new Range(start = 0, end = game.width()).forEach{
				columna => self.generarPared(columna,11)
			}
			
		new Range(start = 2, end = 10).forEach{
				fila => self.generarPared(-1,fila)
			}
			
		new Range(start = 2, end = 10).forEach{
				fila => self.generarPared(9,fila)
			}
}

	method generarPared(columna,fila){
		
		const pared = new Pared(position = game.at(columna, fila))
		game.addVisual(pared)
		
	}
		
	method removerVisual(objeto){
		game.removeVisual(objeto)
	}

// REVISAR
	method limpiarse() {
		
		objetosEnTablero.asSet().asList()
		
		objetosEnTablero.forEach{
			objeto_ => self.removerVisual(objeto_)}
			objetosEnTablero.clear()
			ruben.position(game.at(4,2))
			portal.generarPosicion()
			dealer.generarPosicion()
			game.addVisual(dealer)		
			self.generarObjetosTablero()
	}
		
					
					

	method cargarVisualesInicio(){
	    game.boardGround("assets/fondo/fondo1.jpg") 
	    game.addVisual(texto_monedas)
	    game.addVisual(texto_vidas)
	    game.addVisual(texto_ataque)
	    game.addVisual(texto_defensa)
	    game.addVisual(texto_puntuacion)
	}
	
	method cargarVisualesObjetosImportantes(){
	    game.addVisual(dealer)
	    game.addVisual(portal)
	    game.addVisual(ruben)
	}		
		

}