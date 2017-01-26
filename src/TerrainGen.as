package {

	import flash.display.BitmapData;

	public class TerrainGen {

		private static const GRANDEUR_CASE:int=32;

		public static function creerTerrain(images:Array, monde:Monde):Terrain {
			var nouvTerrain:Terrain = new Terrain();
			for (var quad:uint = 0; quad<4; quad++) {
				var xDecalage:uint = (quad % 2) * images[0].width;
				var yDecalage:uint = uint(quad / 2) * images[0].height;

				for (var y:uint = yDecalage; y<(images[quad].height + yDecalage); y++) {
					for (var x:uint = xDecalage; x<(images[quad].width + xDecalage); x++) {
						var couleur:uint=images[quad].getPixel(x-xDecalage,y-yDecalage);
						switch (couleur) {
							case 0x00FF00 :
								var nouvPorte:Porte = new Porte();
								nouvPorte.x=x*GRANDEUR_CASE;
								nouvPorte.y=y*GRANDEUR_CASE;
								nouvPorte.gotoAndStop(1);
								nouvTerrain.addChild(nouvPorte);
								nouvTerrain.porte=nouvPorte;
								break;
							case 0xFFFF00 :
								var nouvPlancher:Plancher = new Plancher();
								nouvPlancher.gotoAndStop(int(Math.random()*4));
								nouvPlancher.x=x*GRANDEUR_CASE;
								nouvPlancher.y=y*GRANDEUR_CASE;
								nouvTerrain.ajouterCase(nouvPlancher);
								break;
							case 0xFF00FF :
								var nouvMur:Mur = new Mur();
								nouvMur.gotoAndStop(int(Math.random()*5));
								nouvMur.x=x*GRANDEUR_CASE;
								nouvMur.y=y*GRANDEUR_CASE;
								nouvTerrain.ajouterCase(nouvMur);
								break;
						}
					}
				}
			}

			var nouvEnnemi:Adware=new Adware(nouvTerrain);
			nouvEnnemi.x=x*GRANDEUR_CASE;
			nouvEnnemi.y=y*GRANDEUR_CASE;
			var adware:IAAdware=new IAAdware(nouvEnnemi,monde);
			nouvEnnemi.ia=adware;
			nouvTerrain.ennemis.push(nouvEnnemi);
			nouvTerrain.addChild(nouvEnnemi);

			return nouvTerrain;
		}

	}

}