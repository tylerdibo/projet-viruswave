package{
	
	import flash.display.*;
	import flash.events.*;
	
	public class Monde extends MovieClip{
		
		private var terrain:Terrain;
		public var joueur:Joueur;
		private var entree:Entree;
		private var ennemi:Joueur;
		private var adware:IAAdware;
		
		public function Monde():void{
			terrain = TerrainGen.creerTerrain(new MapTest2(0, 0));
			addChild(terrain);
			joueur = new Joueur(terrain);
			joueur.x = 200;
			joueur.y = 300;
			addChild(joueur);
			entree = new Entree(joueur);
			addChild(entree);
			
			ennemi = new Joueur(terrain);
			ennemi.x = 200;
			ennemi.y = 100;
			adware = new IAAdware(ennemi, this);
			addChild(ennemi);
		}
		
		function init(){
			entree.init();
			stage.addEventListener(Event.ENTER_FRAME, loop);
		}
		
		function loop(event:Event):void{
			joueur.updatePositionX();
			joueur.updatePositionY();
		}
		
	}	

}