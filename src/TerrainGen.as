package {
	
	import flash.display.BitmapData;
	
	public class TerrainGen{
		
		private static const GRANDEUR_CASE:int = 32;
		
		public function TerrainGen():void{
			
		}
		
		public static function creerTerrain(image:BitmapData):Terrain{
			var nouvTerrain:Terrain = new Terrain();
			for(var y:uint = 0; y<image.height; y++){
				for(var x:uint = 0; x<image.height; x++){
					var couleur:uint = image.getPixel(x, y);
					if(couleur == 0xDB5151){
						var nouvMur:Mur = new Mur();
						nouvMur.x = x*GRANDEUR_CASE;
						nouvMur.y = y*GRANDEUR_CASE;
						nouvTerrain.ajouterCase(nouvMur);
					}else if(couleur == 0xDBCD51){
						var nouvPlancher:Plancher = new Plancher();
						nouvPlancher.x = x*GRANDEUR_CASE;
						nouvPlancher.y = y*GRANDEUR_CASE;
						nouvTerrain.ajouterCase(nouvPlancher);
					}
				}
			}
			
			return nouvTerrain;
		}
		
	}
	
}