import Campeon.*

class Item { 						/*Superclass*/
	

	method ptsVida	  (unCampeon)	/*abstract*/
	method ptsAtaque  (unCampeon)	/*abstract*/ 
	method equipItem  (unCampeon)	/*abstract*/
	method unequipItem(unCampeon)	/*abstract*/
}

class AnilloDeDoran inherits Item {
	
	override method ptsVida		(unCampeon)	=	60
	override method ptsAtaque	(unCampeon)	=	15
	override method equipItem 	(unCampeon) {	unCampeon.recibirDanio(5)	} 
	override method unequipItem (unCampeon) {	unCampeon.recuperarDanio(10)  }
	
}
class TomoAmplificador inherits Item {
	
	override method ptsVida	    (unCampeon) = 	unCampeon.puntosDeDanio()*0.25
	override method ptsAtaque   (unCampeon)	= 	unCampeon.puntosDeDanio()*0.05 
	override method equipItem   (unCampeon)	{	unCampeon.ganaNBloq(2)		}
	override method unequipItem (unCampeon)	{	unCampeon.ganaNBloq(1);	unCampeon.recibirDanio(30)	}
}

class SombreroDeRabadon inherits TomoAmplificador {
	
	override method ptsVida		(unCampeon)	= 	super(unCampeon) + 5
	override method ptsAtaque	(unCampeon)	=	unCampeon.puntosDeAtaque() * 2
	override method equipItem	(unCampeon)	{ 	super(unCampeon); unCampeon.recibirDanio(5)	}
	override method unequipItem	(unCampeon) {}
}
//