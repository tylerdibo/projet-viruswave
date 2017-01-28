package {
	
	import flash.display.*;
	
	public class Joueur extends MovieClip implements IControlable{
	
		private var vitesse:int = 5;
		private var vx:int = 0;
		private var vy:int = 0;
		private var monde:Monde;
		public var blessures:int = 3;
		//private var hitbox:Rectangle;
		
		public function Joueur(monde:Monde):void{
			this.monde = monde;
		}
		
		public function clic(xCible:int, yCible:int):void{
			var laser:Laser = new Laser(this.x + this.width/2, this.y + this.height/2, xCible, yCible, monde.terrain, true);
			monde.terrain.addChild(laser);
			laser.stop();
			Stats.addition(Stats.TIRS);
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
			if(blessures == 0){
				monde.mort();
			}
		}
		
		private function testCollisionX():Boolean{
			for(var i:uint = 0; i<monde.terrain.murs.length; i++){
				if(hitTestObject(monde.terrain.murs[i])){
					do{
						if(vx > 0){
							this.x--;
						}else{
							this.x++;
						}
					}while(hitTestObject(monde.terrain.murs[i]));
					return true;
				}
			}
			return false;
		}
		
		private function testCollisionY():Boolean{
			for(var i:uint = 0; i<monde.terrain.murs.length; i++){
				if(hitTestObject(monde.terrain.murs[i])){
					do{
						if(vy > 0){
							this.y--;
						}else{
							this.y++;
						}
					}while(hitTestObject(monde.terrain.murs[i]));
					return true;
				}
			}
			return false;
		}
	}
	
}