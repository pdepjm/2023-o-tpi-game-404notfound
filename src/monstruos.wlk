import wollok.game.*
import pjPrincipal.*
import items.*
import inventario.*

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
    method boquear(){
        game.say(self, "A casa loco " /*+ PjNombre.nombre()*/)
    }

    method morir()
    {
        // Tratar de Eliminar el Objeto Monstruo
        imagen = "assets/monstruos/cenizas.png"
    }

    method esAtacado(atacante){

        //const poderTotalOriginal = atacante.poderTotal()
        atacante.defendete(self) 
        //self.nuevoNivel((self.nivel() - poderTotalOriginal).max(0))
        self.resultadoBatalla(atacante)
    }

    method sobrevivio() = self.nivel() > 0

    method resultadoBatalla(atacante){
        if(self.sobrevivio()){
            self.boquear()
            atacante.morir()
        }else{
            atacante.boquear()
            self.morir()
        }
    }

}
const enemigo = new Monstruo(nivel = 3,position = game.at(0,3), imagen = "assets/monstruos/ogroLVL3.png")
const enemigo2 = new Monstruo(nivel = 1,position = game.at(4,3), imagen = "assets/monstruos/ciclope_preview.png")