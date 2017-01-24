package {
	
	import flash.display.*;
	
	public class Joueur extends MovieClip implements IControlable{
	
		private var vitesse:int = 5;
		private var vx:int = 0;
		private var vy:int = 0;
		private var terrain:Terrain;
		private var monde:Monde;
		private var blessures:int = 3;
		//private var hitbox:Rectangle;
		
		public function Joueur(monde:Monde):void{
			this.monde = monde;
			terrain = monde.terrain;
			//hitbox = new Rectangle(5, 2, 6, 32);
		}
		
		public function clic(xCible:int, yCible:int):void{
			var laser:Laser = new Laser(this.x + this.width/2, this.y + this.height/2, xCible, yCible, terrain, true);
			stage.addChild(laser);
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
		
		public function frappe():void{
			blessures--;
			if(blessures <= 0){
				
			}
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