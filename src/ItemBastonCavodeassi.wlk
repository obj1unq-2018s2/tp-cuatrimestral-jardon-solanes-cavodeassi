import Items.*

class BastonDelVacio inherits Item {
	const property	materiales				=	[]
	
	method ptsVidaMateriales	(unCampeon)	=	self.materiales().sum{	item => item.ptsVida(unCampeon)		}
	method ptsAtaqueMateriales	(unCampeon)	=	self.materiales().sum{	item => item.ptsAtaque(unCampeon)	}
	method agregarItem			(unItem)	=	self.materiales().add(unItem)
	method quitarItem			(unItem)	=	self.materiales().remove(unItem)
	
	override method valor		()			= 	0
	override method ptsVida		(unCampeon)	=	self.ptsVidaMateriales(unCampeon)/2
	override method	ptsAtaque	(unCampeon)	=	self.ptsAtaqueMateriales(unCampeon)
	override method equipItem	(unCampeon) {}
	override method unequipItem (unCampeon) {}
	override method activarHab  (unCampeon) {	self.materiales().forEach{	item => item.activarHab(unCampeon)	}	}
}
