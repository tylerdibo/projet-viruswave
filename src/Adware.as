//CLASSE CRÉÉE PAR: Tyler D., Adrian G.
package{	//Importer les classes nécessaires																		
	
	public class Adware extends Ennemi{	//Création de la classe Adware qui étend Ennemi 
		
		private var terrain:Terrain;	//Création de la variable terrain en Terrain
		public var ia:IAAdware;			//Création de la variable ia en IAAdware
		
		public function Adware(terrain:Terrain){	//Création de la fonction Adware
			this.terrain = terrain;	//Enregistrer le terrain.
			super(terrain);	//Enregistrer le terrain dans la classe Ennemi.
		}	//Fin de la fonction Adware
		
		override public function clic(xSouris:int, ySouris:int):void{	//Création de la fonction clic
			//Création d'un laser provenant du milieu du joueur, et qui vise la souris.
			var laser:Laser = new Laser(this.x + this.width/2, this.y + this.height/2, xSouris, ySouris, terrain, false);
			terrain.addChild(laser);
			laser.gotoAndPlay(2); //Jouer l'animation.
		}	//Fin de la fonction clic
		
	}	//Fin de la classe Adware
	
}	//Fin du package