package{
	
	public class Adware extends Ennemi{
		
		private var terrain:Terrain;
		public var ia:IAAdware;
		
		public function Adware(terrain:Terrain){
			this.terrain = terrain;
		}
		
		override public function clic(xSouris:int, ySouris:int):void{
			var laser:Laser = new Laser(this.x + this.width/2, this.y + this.height/2, xSouris, ySouris, terrain, false);
			stage.addChild(laser);
		}
		
	}
	
}