package {
	
	import flash.display.*;
	import flash.events.*;
	
	public class Main extends MovieClip{
		
		private static var VITESSE_JOUEUR = 5;
		
		private var upPress:Boolean = false;
		private var downPress:Boolean = false;
		private var leftPress:Boolean = false;
		private var rightPress:Boolean = false;
		
		var terrain:Terrain;
		var joueur:Joueur;
		
		public function Main():void{
			terrain = TerrainGen.creerTerrain(new MapTest(0, 0));
			addChild(terrain);
			joueur = new Joueur(terrain);
			joueur.x = 500;
			joueur.y = 300;
			addChild(joueur);
			this.addEventListener(Event.ENTER_FRAME, loop);
			stage.addEventListener(KeyboardEvent.KEY_DOWN, keyDown);
			stage.addEventListener(KeyboardEvent.KEY_UP, keyUp);
			
		}
		
		function loop(event:Event):void{
			joueur.updatePositionX();
			joueur.updatePositionY();
		}
		
		function keyDown(event:KeyboardEvent):void{
			switch(event.keyCode){
				case 37:
					leftPress = true;
					break;
				case 39:
					rightPress = true;
					break;
				case 38:
					upPress = true;
					break;
				case 40:
					downPress = true;
					break;
			}
			joueur.setVitesseX((int(rightPress)-int(leftPress)) * VITESSE_JOUEUR);
			joueur.setVitesseY((int(downPress)-int(upPress)) * VITESSE_JOUEUR);
		}
		
		function keyUp(event:KeyboardEvent):void{
			switch(event.keyCode){
				case 37:
					leftPress = false;
					break;
				case 39:
					rightPress = false;
					break;
				case 38:
					upPress = false;
					break;
				case 40:
					downPress = false;
					break;
			}
			joueur.setVitesseX((int(rightPress)-int(leftPress)) * VITESSE_JOUEUR);
			joueur.setVitesseY((int(downPress)-int(upPress)) * VITESSE_JOUEUR);
		}
		
	}
	
}