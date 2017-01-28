package {

	import flash.display.BitmapData;

	public class TerrainGen {

		private static const GRANDEUR_CASE:int=32;

		public static function creerTerrain(images:Array, monde:Monde, niveau:uint):Terrain {
			var nouvTerrain:Terrain = new Terrain();

			var murExt:Mur;
			for (var xMur:uint = 0; xMur < (images[0].width*2); xMur++) {
				murExt = new Mur();
				murExt.gotoAndStop(int(Math.random()*5));
				murExt.x=(xMur+1)*GRANDEUR_CASE;
				murExt.y=0;
				murExt.visible = false;
				nouvTerrain.ajouterCase(murExt, false);
				
				murExt = new Mur();
				murExt.gotoAndStop(int(Math.random()*5));
				murExt.x=(xMur+1)*GRANDEUR_CASE;
				murExt.y=(images[0].height*2 + 1)*GRANDEUR_CASE;
				nouvTerrain.ajouterCase(murExt, false);
			}
			
			for (var yMur:uint = 0; yMur < (images[0].height*2); yMur++) {
				murExt = new Mur();
				murExt.gotoAndStop(int(Math.random()*5));
				murExt.x=0;
				murExt.y=(yMur+1)*GRANDEUR_CASE;
				murExt.visible = false;
				nouvTerrain.ajouterCase(murExt, false);
				
				murExt = new Mur();
				murExt.gotoAndStop(int(Math.random()*5));
				murExt.x=(images[0].width*2 + 1)*GRANDEUR_CASE;
				murExt.y=(yMur+1)*GRANDEUR_CASE;
				murExt.visible = false;
				nouvTerrain.ajouterCase(murExt, false);
			}

			for (var quad:uint = 0; quad<4; quad++) {
				var xDecalage:uint = 1 + (quad % 2) * images[0].width;
				var yDecalage:uint = 1 + uint(quad/2)*images[0].height;

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
								nouvPlancher.gotoAndStop(int(Math.random()*4+1));
								nouvPlancher.x=x*GRANDEUR_CASE;
								nouvPlancher.y=y*GRANDEUR_CASE;
								nouvTerrain.ajouterCase(nouvPlancher, false);
								break;
							case 0xFF0000 :
								var nouvTrou:Mur = new Mur();
								nouvTrou.gotoAndStop(int(Math.random()*5+1));
								nouvTrou.x=x*GRANDEUR_CASE;
								nouvTrou.y=y*GRANDEUR_CASE;
								nouvTerrain.ajouterCase(nouvTrou, true);
								break;
							case 0xFFFFFF :
								var nouvMur:Mur = new Mur();
								nouvMur.gotoAndStop(6);
								nouvMur.x=x*GRANDEUR_CASE;
								nouvMur.y=y*GRANDEUR_CASE;
								nouvTerrain.ajouterCase(nouvMur, false);
								break;
						}
					}
				}
			}

			if (nouvTerrain.porte==null) {
				var porte:Porte = new Porte();
				var dansMur:Boolean=true;
				do {
					porte.x=int(Math.random()*images[0].width*2-1)*GRANDEUR_CASE;
					porte.y=int(Math.random()*images[0].height*2-1)*GRANDEUR_CASE;
					dansMur=false;
					for (var i:uint = 0; i<nouvTerrain.murs.length; i++) {
						if (porte.x==nouvTerrain.murs[i].x&&porte.y==nouvTerrain.murs[i].y) {
							dansMur=true;
						}
					}
				} while (dansMur);
				porte.gotoAndStop(1);
				nouvTerrain.addChild(porte);
				nouvTerrain.porte=porte;
			}
			
			for(var enm:uint; enm < niveau; enm++){
				var nouvEnnemi:Adware=new Adware(nouvTerrain);
				var enmDansMur:Boolean=true;
				do {
					nouvEnnemi.x=int(Math.random()*images[0].width*2-1)*GRANDEUR_CASE;
					nouvEnnemi.y=int(Math.random()*images[0].height*2-1)*GRANDEUR_CASE;
					enmDansMur=false;
					for (var iMur:uint = 0; iMur<nouvTerrain.murs.length; iMur++) {
						if (nouvEnnemi.x==nouvTerrain.murs[iMur].x&&nouvEnnemi.y==nouvTerrain.murs[iMur].y) {
							enmDansMur=true;
						}
					}
				} while (enmDansMur);
				var adware:IAAdware=new IAAdware(nouvEnnemi,monde);
				nouvEnnemi.ia=adware;
				nouvTerrain.ennemis.push(nouvEnnemi);
				nouvTerrain.addChild(nouvEnnemi);
			}

			nouvTerrain.niveau = niveau;
			
			return nouvTerrain;
		}

	}

}