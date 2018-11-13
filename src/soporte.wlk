import Campeon.*
class Soporte inherits Campeon{
	var campeonVinculado
	
	override method vida()= super() + campeonVinculado.vidaExtra()
	override method ataque()=super() + campeonVinculado.ataqueExtra() 
	
	method campeonVinculado()= campeonVinculado
	
	method vincular(campeon){ campeonVinculado=campeon }
	
	override method atacarA (oleada){
	
		oleada.seDefiende(self)
		campeonVinculado.recuperarDanio(10)
		
	}
	
	override method inventario()= #{ super(), campeonVinculado.inventario() }.flatten()
	
}

