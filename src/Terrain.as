package {
	
	import flash.display.*;
	
	public class Terrain extends MovieClip{
		
		public var murs:Array = new Array();
		public var mursLaser:Array = new Array();
		public var decos:Array = new Array();
		public var ennemis:Array = new Array();
		public var joueur:Joueur;
		public var porte:Porte;
		public var porteActive:Boolean = false;
		public var niveau:uint;
		
		public function Terrain():void{
			/*for(var i:uint; i<5; i++){
				var mur:Mur = new Mur();
				mur.x = i * 64;
				mur.y = i * 64;
				murs.push(mur);
				addChild(mur);
			}*/
		}
		
		public function ajouterCase(case1:MovieClip, trou:Boolean):void{
			if(case1 is Mur){
				murs.push(case1);
				addChild(case1);
				if(!trou){
					mursLaser.push(case1);
				}
			}else if(case1 is Deco){
				decos.push(case1);
			}else{
				addChild(case1);
			}
		}
		
		public function ennemiMort(nEnnemi:uint){
			ennemis[nEnnemi].ia.mort();
			removeChild(ennemis[nEnnemi]);
			for (var i:uint=nEnnemi; i < ennemis.length; i++){
				ennemis[i] = ennemis[i+1];
			}
			ennemis.pop();

			if(ennemis.length <= 0){
				porte.gotoAndPlay(2);
				porteActive = true;
			}
		}
		
	}
	
}