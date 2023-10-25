import wollok.game.*
import monstruos.*
import items.*
import inventario.*

class PjPrincipal{

    var property ataque = 1
    var property defensa = 1
    var property vida = 1
    var property monedas = 0
    
    var property position = game.center()
    var image = "assets/rubens/ruben_abajo.png"

    method image() = image

    method ataque() = ataque.min(5)
    method defensa() = defensa.min(5)
    method vida() = vida.min(3)
    method monedas() = monedas
	method poderTotal() = ataque + defensa + vida
	
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
		enemigo_.nuevoNivel((enemigo_.nivel() - aux).max(0))     
        
        aux = ataque
        ataque = (self.ataque() - enemigo_.nivel()).max(0)
		enemigo_.nuevoNivel((enemigo_.nivel() - aux).max(0))    
        
        aux = vida
        vida = (self.vida() - enemigo_.nivel()).max(0)
		enemigo_.nuevoNivel((enemigo_.nivel() - aux).max(0))    
	}	
	

    method agarrar(item)
    {
        self.actualizarEstadisticas(item)
    }

    method actualizarEstadisticas(item)
    {
        ataque += item.ataque()
        defensa += item.defensa()
        vida += item.vida()
        monedas += item.monedas()
    }

    method boquear(){
	        game.say(self, "A casa bicho raro" /*+ PjNombre.nombre()*/)		
    }
    
    method tieneVida() = self.vida() > 0 
    
    method morir(){
    	image = "assets/monstruos/cenizas.png"
    	//GAME OVER
    }
}
const ruben = new PjPrincipal()