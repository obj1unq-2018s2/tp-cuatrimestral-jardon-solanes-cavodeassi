class Campeon {
	const puntosDeVida		= 0		//num
	const puntosDeAtaque	= 0		//num	
	var	  puntosDeDanio		= 0		//num
	var   cantidadDeBloq	= 0		//num
	var   cantidadDeDinero	= 0		//num
	var   inventario		= []	//lista

	
	//stats
	method vida() 			= puntosDeVida 	 + inventario.sum{	item => item.ptsVida(self)	} 
	method ataque() 		= puntosDeAtaque + inventario.sum{	item => item.ptsAtaque(self)}
	method puntosDeAtaque() = puntosDeAtaque
	method puntosDeDanio()	= puntosDeDanio
	method estaMuerto()		= self.vida()<=self.puntosDeDanio()
	//bloqueo
	method bloqueos()		= cantidadDeBloq
	method ganaNBloq(n)		{ cantidadDeBloq += n }
	method pierdeNBloq(n)	{ cantidadDeBloq -= n }
	method tieneBloqueos()  = self.bloqueos()>0
	//dinero
	method dinero()			= cantidadDeDinero
	method tieneDinero(n)	= cantidadDeDinero>=n
	method recibirDinero	(unDinero)  {  cantidadDeDinero = unDinero }
	//sistema de ataque & defensa
	method atacarA			(oleada)    {  oleada.seDefiende(self)  	}
	
	method recibirAtaque	(danio) 	{
											if(self.tieneBloqueos()) {
												self.pierdeNBloq(1)
											}
											else {
												self.recibirDanio(danio)
											}
										}
	
	method recuperarDanio	(danio)     {  puntosDeDanio -= puntosDeDanio.min(danio) 			}
	method recibirDanio		(danio)     {  puntosDeDanio += danio       						}
	
   //items
   //inventariado
	method equiparItem		(unItem) 	{	inventario.add(unItem); unItem.equipItem(self)		}
	method desequiparItem	(unItem) 	{	inventario.remove(unItem); unItem.unequipItem(self)	}
	//compra
	method comprarItem		(unItem)	{	if(self.tieneDinero(unItem.valor())) self.equiparItem(unItem) 
		                                                                         cantidadDeDinero -= unItem.valor()
	} 
	method venderItem		(unItem)	{	cantidadDeDinero += unItem.valor()/2; self.desequiparItem(unItem) }
}
