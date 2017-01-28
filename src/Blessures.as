package{
	import flash.display.*;
	import flash.text.*
	
	public class Blessures extends MovieClip{
		
		private var joueur:Joueur;
		
		public function Blessures(joueur:Joueur):void{
			this.joueur = joueur;
		}
		
		function affiche():void{
			blessures_txt.text = "HP: " + joueur.blessures;
		}
		
	
	}

}