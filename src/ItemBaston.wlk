import Items.*

class BastonDelVacio inherits ItemConHabilidadActivable {
	const property	materiales					=	#{}	//tenerlo publico en caso que se desee consultar los items que hay dentro del baston.
	
	method ptsVidaMateriales		(unCampeon)	=	self.materiales().sum{	item => item.ptsVida(unCampeon)		}
	method ptsAtaqueMateriales		(unCampeon)	=	self.materiales().sum{	item => item.ptsAtaque(unCampeon)	}
	method agregarItem				(unItem)	=	self.materiales().add(unItem)
	method quitarItem				(unItem)	=	self.materiales().remove(unItem)
	
	override method valor			()			= 	0
	override method ptsVida			(unCampeon)	=	self.ptsVidaMateriales(unCampeon)/2
	override method	ptsAtaque		(unCampeon)	=	self.ptsAtaqueMateriales(unCampeon)
	override method puedeActivarHab	(unCampeon) = 	true	
	override method activarHabilidad(unCampeon) {	self.materiales().forEach{	item => item.activarHabilidad(unCampeon)	}	}
}
