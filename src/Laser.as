package {
	
	import flash.geom.Point;
	import flash.display.*;
	import flash.events.Event;
	
	public class Laser extends MovieClip{
		
		private const VITESSE_LASER:int = 10;
		
		private var laserDeplace:Point;
		private var terrain:Terrain;
		
		public function Laser(xOrigine:int, yOrigine:int, xCible:int, yCible:int, terrain:Terrain):void{
			this.terrain = terrain;
			this.x = xOrigine;
			this.y = yOrigine;
			this.rotation = (180/Math.PI)*Math.atan2(yCible - this.y, xCible - this.x);
			laserDeplace = new Point(xCible - this.x, yCible - this.y);
			laserDeplace.normalize(VITESSE_LASER);
			this.addEventListener(Event.ENTER_FRAME, loop);
		}
		
		private function loop(event:Event){
			this.x += laserDeplace.x;
			this.y += laserDeplace.y;
			
			for(var e:uint = 0; e<terrain.ennemis.length; e++){
				if(hitTestObject(terrain.ennemis[e])){
					stage.removeChild(terrain.ennemis[e]);
					break;
				}
			}
			//stop if hit wall
			for(var i:uint = 0; i<terrain.murs.length; i++){
				if(hitTestObject(terrain.murs[i])){
					stage.removeChild(this);
					this.removeEventListener(Event.ENTER_FRAME, loop);
					break;
				}
			}
		}
		
	}
	
}