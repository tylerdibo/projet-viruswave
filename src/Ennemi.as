package{

	import flash.display.*;

	public class Ennemi extends MovieClip implements IControlable{
		
		private var vitesse:int = 5;
		private var vx:int = 0;
		private var vy:int = 0;
		
		public function Ennemi(){
			
		}
		
		public function clic(xSouris:int, ySouris:int):void{
			
		}
		
		public function updatePositionX():void{
			this.x += vx;
		}
		
		public function updatePositionY():void{
			this.y += vy;
		}
		
		public function setVitesseX(vitx:int):void{
			vx = vitx * vitesse;
		}
		
		public function setVitesseY(vity:int):void{
			vy = vity * vitesse;
		}
		
		/*private function testCollision():Boolean{
			for(var i:uint = 0; i<terrain.murs.length; i++){
				if(hitTestObject(terrain.murs[i])){
					return true;
				}
			}
			return false;
		}*/
		
	}

}