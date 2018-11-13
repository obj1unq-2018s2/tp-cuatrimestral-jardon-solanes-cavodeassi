import Campeon.*

class Item { 										/*superclass*/
						
	method valor	  				()				/*abstract*/
	method ptsVida	  				(unCampeon)		/*abstract*/
	method ptsAtaque  				(unCampeon)		/*abstract*/ 
	method equipItem  				(unCampeon)	{}	
	method unequipItem				(unCampeon)	{}	
}

class ItemConHabilidadActivable inherits Item {
	var	usoDeHabilidad							= 	0	
	
	method activarHabilidad  		(unCampeon) 	/*abstract*/
	method puedeActivarHab			(unCampeon)		/*abstract*/
	method usarHabilidad			()			{	usoDeHabilidad+=1	}
}

class AnilloDeDoran inherits ItemConHabilidadActivable {
	
	override method valor			()			= 	300
	override method ptsVida			(unCampeon)	=	60
	override method ptsAtaque		(unCampeon)	=	15
	override method equipItem 		(unCampeon) {	unCampeon.recibirDanio(5)		} 
	override method unequipItem 	(unCampeon) {	unCampeon.recuperarDanio(10)  	}
	override method puedeActivarHab (unCampeon) = 	false
	override method activarHabilidad(unCampeon) {}
}
class TomoAmplificador inherits ItemConHabilidadActivable {
	
	override method valor			()			= 	500
	override method ptsVida	    	(unCampeon) = 	unCampeon.puntosDeDanio()*0.25
	override method ptsAtaque   	(unCampeon)	= 	unCampeon.puntosDeDanio()*0.05 
	override method equipItem   	(unCampeon)	{	unCampeon.ganaNBloq(2)		}
	override method unequipItem 	(unCampeon)	{	unCampeon.ganaNBloq(1);	unCampeon.recibirDanio(30)	}
	override method puedeActivarHab (unCampeon) = 	unCampeon.cantidadDeDinero()<500 && usoDeHabilidad == 0
	
	override method activarHabilidad(unCampeon) {	if(self.puedeActivarHab(unCampeon)) 
														unCampeon.cantidadDeDinero(500)
														self.usarHabilidad()
												}
}

class SombreroDeRabadon inherits TomoAmplificador {
	
	override method valor			()			= 	super() + 100
	override method ptsVida			(unCampeon)	= 	super(unCampeon) + 5
	override method ptsAtaque		(unCampeon)	=	unCampeon.puntosDeAtaque() * 2
	override method equipItem		(unCampeon)	{ 	super(unCampeon); unCampeon.recibirDanio(5)	}
}

class PocionDeVida	inherits ItemConHabilidadActivable {
	
	override method valor			()			=	50
	override method ptsVida			(unCampeon)	=	0
	override method ptsAtaque		(unCampeon) =	0
	override method puedeActivarHab (unCampeon) = 	usoDeHabilidad < 2
	
	override method activarHabilidad(unCampeon) {	if(self.puedeActivarHab(unCampeon)) 
														unCampeon.recuperarDanio(50)
														self.usarHabilidad()
												}
}
