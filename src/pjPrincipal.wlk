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
    
    var property cantidadDeMovimiento = 1
    var property moverse = true
    var property position = game.at(4,2)
    var property seleccionoPowerUp = false
    var property powerUpSeleccionado = powerUpNulo
    var property tienePowerUp = false
    var property powerUpQueTiene = powerUpNulo
    var image = "assets/rubens/ruben_abajo.png"
    
    var positionAnterior = position
	
    
    method image() = image
    method ataque() = ataque.min(5)
    method defensa() = defensa.min(5)
    method vida() = vida.min(vidaMax)
    method monedas() = monedas
	method poderTotal() = ataque + defensa + vida
	method podesMoverte() = moverse
	
method moverseHacia(direccion){
    	if(self.podesMoverte()){
	    	positionAnterior = position
	        self.position(direccion.proximaPosicion(position))
	        image = "assets/rubens/ruben_" + direccion.nombre() + ".png"
	        self.cantidadDeMovimiento(1)		
    	}  
}

method moverseHaciaArriba(){
    	self.moverseHacia(arriba)
}

method moverseHaciaAbajo(){
    	self.moverseHacia(abajo)
}

method moverseHaciaIzquierda(){
    	self.moverseHacia(izquierda)
}

method moverseHaciaDerecha(){
    	self.moverseHacia(derecha)
}

method defendete(enemigo){
		var aux = defensa
        defensa = self.reduccionAlDefenderse(enemigo, self.defensa())
        self.puntuarPorDefensa(enemigo, aux)
        
        aux= ataque
        ataque = self.reduccionAlDefenderse(enemigo, self.ataque())     
        self.puntuarPorDefensa(enemigo, aux)
        
        aux = vida
        vida = self.reduccionAlDefenderse(enemigo, self.vida()) 
        self.puntuarPorDefensa(enemigo, aux)
}

method reduccionAlDefenderse(enemigo, valor) = (valor - enemigo.nivel()).max(0)

method puntuarPorDefensa(enemigo, valor) { // el método puntuación también actualiza el nivel del enemigo
        self.puntuacion(puntuacion + enemigo.nivel() * 10)    
		enemigo.nuevoNivel((enemigo.nivel() - valor).max(0))   
}


    method agarrar(item)
    {
    	item.esChocado(self)
    }


    method boquear(){
	        game.say(self, "A casa bicho raro")		
    }
    
    method tieneVida() = self.vida() > 0 
    
    method morir(){
    	image = "assets/monstruos/cenizas.png"
    	self.moverse(false)
    	//pasar a pantalla de GAME OVER
    	game.schedule(5000, {=>game.stop()})

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
		self.auxiliar()
		self.intentarComprar(powerUpSeleccionado)
	}
}
	
	method auxiliar(){
	    keyboard.num1().onPressDo({
		powerUpSeleccionado = powerUp1
	    })
	    keyboard.num2().onPressDo({
		powerUpSeleccionado = powerUp2
	    })
	    keyboard.num3().onPressDo({
		powerUpSeleccionado = powerUp3
	    })
	    keyboard.num4().onPressDo({
		powerUpSeleccionado = powerUp4	
		})
	}
	
	method intentarComprar(powerUp) {
		if (self.puedeComprar(powerUp)) {
			self.comprar(powerUp)
		}
	}
	
    method puedeComprar(powerUp_) = self.monedas() >= powerUp_.precio()
    method comprar(powerUp_) {
    		monedas -= powerUp_.precio()
    		powerUp_.position(game.at(8,0))
    		self.tienePowerUp(true)
    		self.powerUpQueTiene(powerUp_)	
    		}
    }
    
object arriba{
	
	method nombre() = "arriba"
	method proximaPosicion(position) {
		return position.up(ruben.cantidadDeMovimiento())
	}
}

object abajo{
	
	method nombre() = "abajo"
	method proximaPosicion(position) {
		return position.down(ruben.cantidadDeMovimiento())
	}
}

object derecha{
	
	method nombre() = "derecha"
	method proximaPosicion(position) {
		return position.right(ruben.cantidadDeMovimiento())
	}
}

object izquierda{
	
	method nombre() = "izquierda"
	method proximaPosicion(position) {
		return position.left(ruben.cantidadDeMovimiento())
	}
}
const ruben = new PjPrincipal()