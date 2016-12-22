package {
	
	import flash.display.*;
	import flash.events.*;
	
	public class Main extends MovieClip{
		
		private static var VITESSE_JOUEUR = 4;
		
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
			joueur.x = 200;
			joueur.y = 300;
			addChild(joueur);
			this.addEventListener(Event.ENTER_FRAME, loop);
			stage.addEventListener(KeyboardEvent.KEY_DOWN, keyDown);
			stage.addEventListener(KeyboardEvent.KEY_UP, keyUp);
			stage.addEventListener(MouseEvent.MOUSE_DOWN, tirer);
		}
		
		function loop(event:Event):void{
			joueur.updatePositionX();
			joueur.updatePositionY();
		}
		
		function keyDown(event:KeyboardEvent):void{
			switch(event.keyCode){
				case 37:
				case 65:
					leftPress = true;
					break;
				case 39:
				case 68:
					rightPress = true;
					break;
				case 38:
				case 87:
					upPress = true;
					break;
				case 40:
				case 83:
					downPress = true;
					break;
			}
			joueur.setVitesseX((int(rightPress)-int(leftPress)) * VITESSE_JOUEUR);
			joueur.setVitesseY((int(downPress)-int(upPress)) * VITESSE_JOUEUR);
		}
		
		function keyUp(event:KeyboardEvent):void{
			switch(event.keyCode){
				case 37:
				case 65:
					leftPress = false;
					break;
				case 39:
				case 68:
					rightPress = false;
					break;
				case 38:
				case 87:
					upPress = false;
					break;
				case 40:
				case 83:
					downPress = false;
					break;
			}
			joueur.setVitesseX((int(rightPress)-int(leftPress)) * VITESSE_JOUEUR);
			joueur.setVitesseY((int(downPress)-int(upPress)) * VITESSE_JOUEUR);
		}
		
		function tirer(event:MouseEvent):void{
			joueur.tirer(mouseX, mouseY);
		}
		
	}
	
}