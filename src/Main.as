package {
	
	import flash.display.*;
	import flash.events.*;
	
	public class Main extends MovieClip{
		
		private var terrain:Terrain;
		private var joueur:Joueur;
		private var entree:Entree;
		
		public function Main():void{
			terrain = TerrainGen.creerTerrain(new MapTest(0, 0));
			addChild(terrain);
			joueur = new Joueur(terrain);
			joueur.x = 200;
			joueur.y = 300;
			addChild(joueur);
			entree = new Entree(joueur);
			addChild(entree);
			entree.init();
			this.addEventListener(Event.ENTER_FRAME, loop);
		}
		
		function loop(event:Event):void{
			joueur.updatePositionX();
			joueur.updatePositionY();
		}
		
	}
	
}