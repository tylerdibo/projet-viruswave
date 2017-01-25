package {
	
	import flash.display.BitmapData;
	
	public class TerrainGen{
		
		private static const GRANDEUR_CASE:int = 32;
		
		public static function creerTerrain(image:BitmapData, monde:Monde):Terrain{
			var nouvTerrain:Terrain = new Terrain();
			for(var y:uint = 0; y<image.height; y++){
				for(var x:uint = 0; x<image.height; x++){
					var couleur:uint = image.getPixel(x, y);
					switch(couleur){
					case 0x00FF00:
						var nouvPorte:Porte = new Porte();
						nouvPorte.x = x*GRANDEUR_CASE;
						nouvPorte.y = y*GRANDEUR_CASE;
						nouvPorte.gotoAndStop(1);
						nouvTerrain.addChild(nouvPorte);
						nouvTerrain.porte = nouvPorte;
						break;
					case 0xFFFF00:
						var nouvPlancher:Plancher = new Plancher();
						nouvPlancher.gotoAndStop(int(Math.random()*4));
						nouvPlancher.x = x*GRANDEUR_CASE;
						nouvPlancher.y = y*GRANDEUR_CASE;
						nouvTerrain.ajouterCase(nouvPlancher);
						break;
					case 0xFF00FF:
						var nouvMur:Mur = new Mur();
						nouvMur.gotoAndStop(int(Math.random()*5));
						nouvMur.x = x*GRANDEUR_CASE;
						nouvMur.y = y*GRANDEUR_CASE;
						nouvTerrain.ajouterCase(nouvMur);
						break;
					}
				}
			}
			
			var nouvEnnemi:Adware = new Adware(nouvTerrain);
			nouvEnnemi.x = x*GRANDEUR_CASE;
			nouvEnnemi.y = y*GRANDEUR_CASE;
			var adware:IAAdware = new IAAdware(nouvEnnemi, monde);
			nouvEnnemi.ia = adware;
			nouvTerrain.ennemis.push(nouvEnnemi);
			nouvTerrain.addChild(nouvEnnemi);
			
			return nouvTerrain;
		}
		
	}
	
}