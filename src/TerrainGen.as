package {
	
	import flash.display.BitmapData;
	
	public class TerrainGen{
		
		public function TerrainGen():void{
			
		}
		
		public static function creerTerrain(image:BitmapData):Terrain{
			var nouvTerrain:Terrain = new Terrain();
			for(var y:uint = 0; y<image.height; y++){
				for(var x:uint = 0; x<image.height; x++){
					var couleur:uint = image.getPixel(x, y);
					if(couleur == 0xDB5151){
						var nouvMur:Mur = new Mur();
						nouvMur.x = x*64;
						nouvMur.y = y*64;
						nouvTerrain.ajouterCase(nouvMur);
					}else if(couleur == 0xDBCD51){
						var nouvPlancher:Plancher = new Plancher();
						nouvPlancher.x = x*64;
						nouvPlancher.y = y*64;
						nouvTerrain.ajouterCase(nouvPlancher);
					}
				}
			}
			
			return nouvTerrain;
		}
		
	}
	
}