package {
	
	import flash.display.*;
	
	public class Terrain extends MovieClip{
		
		public var murs:Array = new Array();
		
		public function Terrain():void{
			/*for(var i:uint; i<5; i++){
				var mur:Mur = new Mur();
				mur.x = i * 64;
				mur.y = i * 64;
				murs.push(mur);
				addChild(mur);
			}*/
		}
		
		public function ajouterCase(case1:MovieClip):void{
			if(case1 is Mur){
				murs.push(case1);
			}
			addChild(case1);
		}
		
	}
	
}