package {
	
	//Importer les classes nécessaires.
	import flash.display.*;
	
	public class Terrain extends MovieClip{
		
		//Déclaration et initialisation des variables.
		public var murs:Array = new Array();
		public var mursLaser:Array = new Array();
		public var ennemis:Array = new Array();
		public var joueur:Joueur;
		public var porte:Porte;
		public var porteActive:Boolean = false;
		public var niveau:uint;
		
		public function Terrain():void{
			
		}
		
		//Fonction pour ajouter une case au terrain.
		public function ajouterCase(case1:MovieClip, trou:Boolean):void{
			//Si la case est un mur ou un trou, ajoute-le au tableau des murs.
			//Dans les deux cas, ajouter la case à la scène.
			if(case1 is Mur){
				murs.push(case1);
				addChild(case1);
				if(!trou){ //Si la case est un mur et non un trou, ajoute-le au tableau des murs qui bloquent les lasers.
					mursLaser.push(case1); 
				}
			}else{
				addChild(case1);
			}
		}
		
		//Fonction quand un ennemi est tué.
		public function ennemiMort(nEnnemi:uint){
			ennemis[nEnnemi].ia.mort(); //Supprimer le IA de l'ennemi mort.
			removeChild(ennemis[nEnnemi]); //Enlever l'ennemi de la scène.
			//Algorithme de recherche pour trouver l'ennemi dans la liste, puis l'enlever.
			for (var i:uint=nEnnemi; i < ennemis.length; i++){
				ennemis[i] = ennemis[i+1]; //Déplacer chaque ennemi vers le commencement du tableau en supprimant l'ennemi mort.
			}
			ennemis.pop(); //Enlever la copie de l'ennemi sur le bout.

			if(ennemis.length <= 0){ //S'il n'y a plus d'ennemis, ouvre la porte.
				porte.gotoAndPlay(2); //Jouer l'animation de la porte ouverte.
				porteActive = true; //Enregistrer que la porte est ouverte.
			}
		}
		
	}
	
}