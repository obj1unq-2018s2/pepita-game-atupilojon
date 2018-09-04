import ciudades.*

object pepita {
	var property energia = 100
	var property ciudad = buenosAires 
	var property posicion = game.at(3,3)
	var property imagen = "pepita1.png"

	method come(comida) {
		energia = energia + comida.energia()
		self.siluetaPepita()
	}
	method volaHacia(unaCiudad) {
		if (ciudad == unaCiudad) {
			game.say(self, "Ya estoy en " + unaCiudad.nombre())
		}
		else if (self.puedeVolar(unaCiudad.posicion())) {
			self.move(unaCiudad.posicion())
			ciudad = unaCiudad
			self.siluetaPepita()			
		}
		else {
			game.say(self, "Dame de comer primero!")
		}
	}
	method energiaParaVolar(distancia) = 15 + 5 * distancia
	method puedeVolar(nuevaPosicion) {
		return (energia > self.energiaParaVolar(posicion.distance(nuevaPosicion)))
	}
	method siluetaPepita() {
		if (energia < 10) {
			imagen = "pepita.png"
		}
		else if (energia > 100) {
			imagen = "pepita2.png"
		}
		else {
			imagen = "pepita1.png"
		}
	}
	method move(nuevaPosicion) {
		energia -= self.energiaParaVolar(posicion.distance(nuevaPosicion))
		self.posicion(nuevaPosicion)
	}
	method teEncontro(personaje) {
		personaje.alimentarA(self)
	}	
}
