import wollok.game.*
import monstruos.*
import items.*
import inventario.*
import dealer.*

class PjPrincipal{

    var property ataque = 1
    var property defensa = 1
    var property vida = 1
	var property vidaMax = 3
    var property monedas = 0
    var property puntuacion = 0
    
    var property dobleMovimiento_ = false
    
    var property position = game.at(4,2)
    
    var image = "assets/rubens/ruben_abajo.png"
    
    method image() = image

    method ataque() = ataque.min(5)
    method defensa() = defensa.min(5)
    method vida() = vida.min(vidaMax)
    method monedas() = monedas
	method poderTotal() = ataque + defensa + vida
	method tiene(powerUp) = false
	
	method dobleMovimiento(){
		if (dobleMovimiento_) {
	 	keyboard.up().onPressDo({ 
        	self.position(position.up(1))
	    })
	    keyboard.down().onPressDo({ 
        	self.position(position.down(1))
	    })
	    keyboard.left().onPressDo({ 
        self.position(position.left(1))
	    })
	    keyboard.right().onPressDo({ 
        self.position(position.right(1))
	    })
	    self.dobleMovimiento_(false)
	    }
	}
		
    method moverseHaciaArriba(){
        self.position(position.up(1))
        image = "assets/rubens/ruben_arriba.png"
    }

    method moverseHaciaAbajo(){
        self.position(position.down(1))
        image = "assets/rubens/ruben_abajo.png"
    }

    method moverseHaciaIzquierda(){
        self.position(position.left(1))
		image = "assets/rubens/ruben_izquierda.png"
    }

    method moverseHaciaDerecha(){
        self.position(position.right(1))
        image = "assets/rubens/ruben_derecha.png"
    }
	
    method defendete(enemigo_){ // estamos repitiendo lógica 😠

        var aux

        aux = defensa
        defensa = (self.defensa() - enemigo_.nivel()).max(0)
        self.puntuacion(puntuacion + enemigo_.nivel() * 10)    
		enemigo_.nuevoNivel((enemigo_.nivel() - aux).max(0))     
        
        aux = ataque
        ataque = (self.ataque() - enemigo_.nivel()).max(0)
        self.puntuacion(puntuacion + enemigo_.nivel() * 10)    
		enemigo_.nuevoNivel((enemigo_.nivel() - aux).max(0))    
        
        aux = vida
        vida = (self.vida() - enemigo_.nivel()).max(0)
        self.puntuacion(puntuacion + enemigo_.nivel() * 10)    
		enemigo_.nuevoNivel((enemigo_.nivel() - aux).max(0))
		
	}	
	

    method agarrar(item)
    {
    	item.esAgarrado(self)
    }


    method boquear(){
	        game.say(self, "A casa bicho raro" /*+ PjNombre.nombre()*/)		
    }
    
    method tieneVida() = self.vida() > 0 
    
    method morir(){
    	image = "assets/monstruos/cenizas.png"
    	game.stop()
    	//GAME OVER
    }
    
    method estasVivo(){
    	if(!self.tieneVida()){
    		self.morir()
    	}
    }
}
const ruben = new PjPrincipal()