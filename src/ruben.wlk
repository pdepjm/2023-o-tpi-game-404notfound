import wollok.game.*
/*/
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
	
	method atacar(enemigo){
		
		escudo = (self.escudo() - enemigo.nivel()).max(0)
		enemigo.nuevoNivel((self.escudo() - enemigo.nivel()).abs())
		
		ataque = (self.ataque() - enemigo.nivel()).max(0)
		enemigo.nuevoNivel((self.ataque() - enemigo.nivel()).abs())
		
		vida = (self.vida() - enemigo.nivel()).max(0)
		enemigo.nuevoNivel((self.vida() - enemigo.nivel()).abs())
		
		if(!self.tieneVida()){
			enemigo.mensaje()
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

class Monstruo {
	
	var property position
	var nivel
	var imagen
	/* Cambiar por property */
	method nivel() = nivel
	method nuevoNivel(nivel_){
		nivel = nivel_
	}
	method image() = imagen
	method mensaje(){
		game.say(self, "A casa loco " /*+ PjNombre.nombre()*/)
	}

}
const enemigo = new Monstruo(nivel = 6,position = game.center(), imagen = "ogroLVL3.png")
const enemigo2 = new Monstruo(nivel = 1,position = game.at(2,3), imagen = "ciclope_preview.png")
