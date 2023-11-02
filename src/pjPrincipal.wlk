import wollok.game.*
import monstruos.*
import items.*
import inventario.*
import dealer.*
import tablero.*

class PjPrincipal{

    var property ataque = 1
    var property defensa = 1
    var property vida = 1
	var property vidaMax = 3
    var property monedas = 50
    var property puntuacion = 0
    
    var property dobleMovimiento_ = false
    var property moverse = true
    var property position = game.at(4,2)
    var property seleccionoPowerUp = false
    var property tiene = false
    var image = "assets/rubens/ruben_abajo.png"
    
    var positionAnterior = position
	
    
    method image() = image

    method ataque() = ataque.min(5)
    method defensa() = defensa.min(5)
    method vida() = vida.min(vidaMax)
    method monedas() = monedas
	method poderTotal() = ataque + defensa + vida
	method tiene() = tiene
	method podesMoverte() = moverse
	
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
    	if(self.podesMoverte()){
	    	positionAnterior = position
	        self.position(position.up(1))
	        image = "assets/rubens/ruben_arriba.png"    		
    	}
    }

    method moverseHaciaAbajo(){
    	if(self.podesMoverte()){
	    	positionAnterior = position
	        self.position(position.down(1))
	        image = "assets/rubens/ruben_abajo.png"
    	}
    }

    method moverseHaciaIzquierda(){
    	if(self.podesMoverte()){
	    	positionAnterior = position
	        self.position(position.left(1))
			image = "assets/rubens/ruben_izquierda.png"    		
    	}
    }

    method moverseHaciaDerecha(){
    	if(self.podesMoverte()){
	    	positionAnterior = position
	        self.position(position.right(1))
	        image = "assets/rubens/ruben_derecha.png"    		
    	}    	
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
    	item.esChocado(self)
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
    
    method volverAPosicion(){
    	position = positionAnterior
    	game.removeVisual(self)
    	game.addVisual(self)
    }


    method seleccionarPowerUp(){
    	if(!self.podesMoverte()){
		    keyboard.num1().onPressDo({
	        dealer.powerUpSeleccionado(powerUp1)
	        dealer.realizarIntercambio(self)
			self.seleccionoPowerUp(false)
			//seleccionoPowerUp = true
	    })
	
	    keyboard.num2().onPressDo({
	        dealer.powerUpSeleccionado(powerUp2)
	        dealer.realizarIntercambio(self)
			self.seleccionoPowerUp(false)
			//seleccionoPowerUp = true
	    })
	    
	    keyboard.num3().onPressDo({
	        dealer.powerUpSeleccionado(powerUp3)
	        dealer.realizarIntercambio(self)
			self.seleccionoPowerUp(false)
//	        seleccionoPowerUp = true
	    })
	    
	    keyboard.num4().onPressDo({
	        dealer.powerUpSeleccionado(powerUp4)
	        dealer.realizarIntercambio(self)
			self.seleccionoPowerUp(false)
//	        seleccionoPowerUp = true
	    })
	}
}
	
	
	
    method puedeComprar(powerUp_) = self.monedas() >= powerUp_.precio()
    method comprar(powerUp_) {
    		monedas -= powerUp_.precio()
    		// Añadir powerUp al inventario
    		powerUp_.position(game.at(8,0))
    		self.tiene(powerUp_)
    		}
    }
    
const ruben = new PjPrincipal()