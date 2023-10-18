import wollok.game.*
import monstruos.*

/*
object ruben {
	
	var property position = game.at(4,0)
	var visualRuben = duro
	
	method image() = "rubens/ruben_" + visualRuben + ".png"
	
	method moverseHaciaArriba(){
		self.position(position.up(1))
	}
	
	method moverseHaciaAbajo(){
		self.position(position.down(1))
	}
	
	method moverseHaciaIzquierda(){
		self.position(position.left(1))
	}
	
	method moverseHaciaDerecha(){
		self.position(position.right(1))
	}
}
*/
class PjPrincipal{
	
	var ataque = 0
	var escudo = 0
	var vida = 3
	var property position = game.at(4,0)
	var image = "rubens/ruben_arriba.png"
	
	method image() = image
	
	method ataque() = ataque
	method escudo() = escudo
	method vida() = vida
	
	method moverseHaciaArriba(){
		self.position(position.up(1))
		image = "rubens/ruben_arriba.png"
	}
	
	method moverseHaciaAbajo(){
		self.position(position.down(1))
		image = "rubens/ruben_abajo.png"
	}
	
	method moverseHaciaIzquierda(){
		self.position(position.left(1))
		image = "rubens/ruben_izquierda.png"
	}
	
	method moverseHaciaDerecha(){
		self.position(position.right(1))
		image = "rubens/ruben_derecha.png"
	}
	/* Preguntar si es buena practica */
	method cambiarImagen(){
		image = "mago.png"
	}
	
	method atacar(enemigo_){
		
		escudo = (self.escudo() - enemigo_.nivel()).max(0)
		enemigo_.nuevoNivel((self.escudo() - enemigo_.nivel()).abs())
		
		ataque = (self.ataque() - enemigo_.nivel()).max(0)
		enemigo_.nuevoNivel((self.ataque() - enemigo_.nivel()).abs())
		
		vida = (self.vida() - enemigo_.nivel()).max(0)
		enemigo_.nuevoNivel((self.vida() - enemigo_.nivel()).abs())
		
		if(!self.tieneVida()){
			enemigo_.mensaje()
		}else{
			self.boquear()
		}
	}
	method boquear(){
		game.say(self, "A casa bicho raro" /*+ PjNombre.nombre()*/)
	}
	method tieneVida() = self.vida() > 0 
}

const ruben = new PjPrincipal(ataque = 3)

