//classe par: Adrian Giammaria
package{
	import flash.display.*; //importer les classes
	import flash.text.* 
	
	public class Blessures extends MovieClip{
		
		private var joueur:Joueur; //défini variable joueur comme classe joueur
		private var monde:Monde; //défini variable monde comme classe monde
		
		public function Blessures(monde:Monde):void{
			this.monde = monde; //monde est égale à l'instance courant de monde
			joueur = monde.joueur; //joueur est égale à l'instance courant de monde
		} //fin constructeur
		
		function affiche():void{
			blessures_txt.text = "HP: " + joueur.blessures; //affiche le nombre de point de blessures dans la boîte dynamique blessures_txt
			niveau_txt.text = "Niveau: " + monde.niveauCourant; //affiche le numéro du niveau courant dans la boîte dynamique niveau_txt
		}
		
	
	}

}