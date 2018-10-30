import Campeon.*

class Item { 									/*SuperClass*/
	var	usoDeHabilidad						= 	0						
	
	method valor	  			()				/*abstract*/
	method ptsVida	  			(unCampeon)		/*abstract*/
	method ptsAtaque  			(unCampeon)		/*abstract*/ 
	method equipItem  			(unCampeon)		/*abstract*/
	method unequipItem			(unCampeon)		/*abstract*/
	method habilidadAct			(unCampeon) 	/*abstract*/ 
	//preguntar si la habilidad Activable es sobre el Item o sobre el campeon,
	//lo coherente seria que sea sobre el item.
}

class AnilloDeDoran inherits Item {
	
	override method valor		()			= 	300
	override method ptsVida		(unCampeon)	=	60
	override method ptsAtaque	(unCampeon)	=	15
	override method equipItem 	(unCampeon) {	unCampeon.recibirDanio(5)	} 
	override method unequipItem (unCampeon) {	unCampeon.recuperarDanio(10)  }
	override method habilidadAct(unCampeon) {}
}
class TomoAmplificador inherits Item {
	
	override method valor		()			= 	500
	override method ptsVida	    (unCampeon) = 	unCampeon.puntosDeDanio()*0.25
	override method ptsAtaque   (unCampeon)	= 	unCampeon.puntosDeDanio()*0.05 
	override method equipItem   (unCampeon)	{	unCampeon.ganaNBloq(2)		}
	override method unequipItem (unCampeon)	{	unCampeon.ganaNBloq(1);	unCampeon.recibirDanio(30)	}
	override method habilidadAct(unCampeon) {	if(self.puedeActivarHabilidad(unCampeon)) 
													unCampeon.recibeDinero(500)
													usoDeHabilidad+=1
											}
	method puedeActivarHabilidad(unCampeon) = 	unCampeon.dinero()<500 && usoDeHabilidad == 0	
}

class SombreroDeRabadon inherits TomoAmplificador {
	
	override method valor		()			= 	super() + 100
	override method ptsVida		(unCampeon)	= 	super(unCampeon) + 5
	override method ptsAtaque	(unCampeon)	=	unCampeon.puntosDeAtaque() * 2
	override method equipItem	(unCampeon)	{ 	super(unCampeon); unCampeon.recibirDanio(5)	}
	override method unequipItem	(unCampeon) {}
	override method habilidadAct(unCampeon) {}
}

class PosionDeVida	inherits Item {
	
	override method valor		()			=	50
	override method ptsVida		(unCampeon)	{}
	override method ptsAtaque	(unCampeon) {}
	override method equipItem	(unCampeon) {}
	override method unequipItem	(unCampeon)	{}
	override method habilidadAct(unCampeon) {	if(self.puedeActivarHabilidad(unCampeon)) 
													unCampeon.recuperarDanio(50)
													usoDeHabilidad+=1
											}
	method puedeActivarHabilidad(unCampeon) = 	usoDeHabilidad <= 2
	
}
