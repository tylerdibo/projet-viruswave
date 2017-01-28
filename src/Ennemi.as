package{

	import flash.display.*;

	public class Ennemi extends MovieClip implements IControlable{
		
		private var vitesse:int = 5;
		private var vx:int = 0;
		private var vy:int = 0;
		private var terrain:Terrain;
		
		public function Ennemi(terrain:Terrain){
			this.terrain = terrain;
		}
		
		public function clic(xSouris:int, ySouris:int):void{
			
		}
		
		public function updatePositionX():void{
			this.x += vx;
			testCollisionX();
		}
		
		public function updatePositionY():void{
			this.y += vy;
			testCollisionY();
		}
		
		public function setVitesseX(vitx:int):void{
			vx = vitx * vitesse;
		}
		
		public function setVitesseY(vity:int):void{
			vy = vity * vitesse;
		}
		
		private function testCollisionX():Boolean{
			for(var i:uint = 0; i<terrain.murs.length; i++){
				if(hitTestObject(terrain.murs[i])){
					do{
						if(vx > 0){
							this.x--;
						}else{
							this.x++;
						}
					}while(hitTestObject(terrain.murs[i]));
					return true;
				}
			}
			return false;
		}
		
		private function testCollisionY():Boolean{
			for(var i:uint = 0; i<terrain.murs.length; i++){
				if(hitTestObject(terrain.murs[i])){
					do{
						if(vy > 0){
							this.y--;
						}else{
							this.y++;
						}
					}while(hitTestObject(terrain.murs[i]));
					return true;
				}
			}
			return false;
		}
		
	}

}