import wollok.game.*
import pjPrincipal.*
import items.*
import inventario.*

class Monstruo {

    var property position
    var nivel
    var imagen

    /* Cambiar por property /
    method nivel() = nivel
    method nuevoNivel(nivel){
        nivel = nivel
    }
    method image() = imagen
    method mensaje(){
        game.say(self, "A casa loco " /+ PjNombre.nombre()*/)
    }

    method morir()
    {
        imagen = "monstruos/cenizas.png"
    }

}
const enemigo = new Monstruo(nivel = 3,position = game.at(0,3), imagen = "monstruos/ogroLVL3.png")
const enemigo2 = new Monstruo(nivel = 1,position = game.at(4,3), imagen = "monstruos/ciclope_preview.png")