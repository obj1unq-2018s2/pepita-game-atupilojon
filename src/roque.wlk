object roque {
	var comida = null
	const property imagen = "jugador.png"
	var property posicion = game.at(1,10)
	
	method levantarComida(alimento) {
		if (comida != null) {
			game.addVisualIn(comida, posicion.up(1))
		}
		comida = alimento
	}
	method alimentarA(ave) {
		if (comida != null) {
			ave.come(comida)
			game.addVisualIn(comida, game.at(0.randomUpTo(10),0.randomUpTo(10)))
			comida = null
		}
		else {
			// game.say(ave, "No hay mas comida")
		}
	}
}
