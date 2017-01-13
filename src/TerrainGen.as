package {
	
	import flash.display.BitmapData;
	
	public class TerrainGen{
		
		private static const GRANDEUR_CASE:int = 32;
		
		public static function creerTerrain(image:BitmapData):Terrain{
			var nouvTerrain:Terrain = new Terrain();
			for(var y:uint = 0; y<image.height; y++){
				for(var x:uint = 0; x<image.height; x++){
					var couleur:uint = image.getPixel(x, y);
					if(couleur == 0xFF00FF){
						var nouvMur:Mur = new Mur();
						nouvMur.gotoAndStop(int(Math.random()*5));
						nouvMur.x = x*GRANDEUR_CASE;
						nouvMur.y = y*GRANDEUR_CASE;
						nouvTerrain.ajouterCase(nouvMur);
					}else if(couleur == 0xFFFF00){
						var nouvPlancher:Plancher = new Plancher();
						nouvPlancher.gotoAndStop(int(Math.random()*4));
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