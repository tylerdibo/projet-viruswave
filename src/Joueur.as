package {
	
	import flash.display.*;
	
	public class Joueur extends MovieClip{
		
		//Hitbox: http://help.adobe.com/en_US/FlashPlatform/reference/actionscript/3/flash/display/Sprite.html#hitArea

		private var vx:int = 0;
		private var vy:int = 0;
		private var terrain:Terrain;
		
		public function Joueur(terrain:Terrain):void{
			this.terrain = terrain;
		}
		
		public function tirer(xCible:int, yCible:int){
			var laser:Laser = new Laser(this.x + this.width/2, this.y + this.height/2, xCible, yCible, terrain);
			stage.addChild(laser);
		}
		
		public function updatePositionX():void{
			this.x += vx;
			if(testCollision()){
				this.x -= vx;
			}
		}
		
		public function updatePositionY():void{
			this.y += vy;
			if(testCollision()){
				this.y -= vy;
			}
		}
		
		public function setVitesseX(vitx:int):void{
			vx = vitx;
		}
		
		public function setVitesseY(vity:int):void{
			vy = vity;
		}
		
		private function testCollision():Boolean{
			for(var i:uint = 0; i<terrain.murs.length; i++){
				if(hitTestObject(terrain.murs[i])){
					return true;
				}
			}
			return false;
		}
		
	}
	
}