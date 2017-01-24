package{
	
	import flash.display.*;
	import flash.events.*;
	
	public class Monde extends MovieClip{
		
		public var terrain:Terrain;
		public var joueur:Joueur;
		private var entree:Entree;
		private var ennemi:Adware;
		private var adware:IAAdware;
		private var fin:Fin;
		
		public function Monde():void{
			terrain = TerrainGen.creerTerrain(new MapTest2(0, 0), this);
			addChild(terrain);
			joueur = new Joueur(this);
			joueur.x = 200;
			joueur.y = 300;
			addChild(joueur);
			terrain.joueur = joueur;
			entree = new Entree(joueur);
			addChild(entree);
		}
		
		function init(){
			entree.init();
			stage.addEventListener(Event.ENTER_FRAME, loop);
		}
		
		function loop(event:Event):void{
			joueur.updatePositionX();
			joueur.updatePositionY();
			//adware.loop();
			//ennemi.updatePositionX();
			//ennemi.updatePositionY();
		}
		
		function mort():void{
			 while(stage.numChildren > 0)
			 {
				stage.removeChildAt(0); 
			 }
			 fin = new Fin;
			 addChild(fin);
				
		} // fin mort
	}	

}