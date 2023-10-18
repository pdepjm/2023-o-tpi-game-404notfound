import wollok.game.*
import monstruos.*
import items.*
import inventario.*
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

    var ataque = 1
    var defensa = 1
    var vida = 1
    var monedas = 1
    var property position = game.center()
    var image = "src/rubens/ruben_abajo.png"

    method image() = image

    method ataque() = ataque.min(5)
    method defensa() = defensa.min(5)
    method vida() = vida.min(3)
    method monedas() = monedas

    method moverseHaciaArriba(){
        self.position(position.up(1))
        image = "src/rubens/ruben_arriba.png"
    }

    method moverseHaciaAbajo(){
        self.position(position.down(1))
        image = "src/rubens/ruben_abajo.png"
    }

    method moverseHaciaIzquierda(){
        self.position(position.left(1))
		image = "src/rubens/ruben_izquierda.png"
    }

    method moverseHaciaDerecha(){
        self.position(position.right(1))
        image = "src/rubens/ruben_derecha.png"
    }

    method atacar(enemigo_){ // estamos repitiendo lógica 😠

        var aux

        aux = defensa

        defensa = (self.defensa() - enemigo_.nivel()).max(0)
        enemigo_.nuevoNivel((enemigo_.nivel()- aux).max(0))

        aux = ataque

        ataque = (self.ataque() - enemigo_.nivel()).max(0)
        enemigo_.nuevoNivel((enemigo_.nivel() - aux).max(0))

        aux = vida

        vida = (self.vida() - enemigo_.nivel()).max(0)
        enemigo_.nuevoNivel((enemigo_.nivel() - aux).max(0))

        if(!self.tieneVida())
        {
            enemigo_.mensaje()
            //GAME OVER
        }
        else
        {
            if(enemigo_.image() == "src/monstruos/cenizas.png") 
            {

            }
            else 
            {
                self.boquear()
                enemigo_.morir()
            }
        }
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
}
const ruben = new PjPrincipal()
