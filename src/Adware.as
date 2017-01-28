//CLASSE CRÉER PAR: Tyler D., Adrian G.
package{	//Importer les classes nécessaires																		
	
	public class Adware extends Ennemi{	//Création de la classe Adware qui étant Ennemi 
		
		private var terrain:Terrain;	//Création de la variable terrain en Terrain
		public var ia:IAAdware;			//Création de la variable ia en IAAdware
		
		public function Adware(terrain:Terrain){	//Création de la fonction Adware
			this.terrain = terrain;	//wut
			super(terrain);	//wut
		}	//Fin de la fonction Adware
		
		override public function clic(xSouris:int, ySouris:int):void{	//Création de la fonction clic
			var laser:Laser = new Laser(this.x + this.width/2, this.y + this.height/2, xSouris, ySouris, terrain, false);
			terrain.addChild(laser);
			laser.gotoAndPlay(2);
		}	//Fin de la fonction clic
		
	}	//Fin de la classe Adware
	
}	//Fin du package