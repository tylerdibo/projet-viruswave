/*	Programmeurs:	Tyler Dibattista, Adrain Giammaria, John Atanasov	
	Date:			1/26/2017
	File Name:		Main.as
	Flash File: 	Main.fla
	SWF File:		Main.swf
	Description:	Projet pour examen ICS4U - Jeu «Viruswave»
					style jeu d'arcade sans fin où le joueur élimine
					des viruses.*/

//  IMPORTANT!!! Plusieurs fichier classes existes, tous écrits par différents
// 	membres de l'équipe. Les ressources visuels ont été créer par Adrian Giammaria.

/*Fichiers classes externes: Adware, Blessures, Ennemi, Entree, IAAdware, IATrojan
IControlable, Joueur, Laser, Monde, Porte, Score, Stats, Terrain, TerrainGen*/ 

/*Liste des modifications apporté au projet présent au lien Github : https://github.com/tylerdibo/projet-viruswave/ 
Tous les ressources visuelles son aussi présent sur Github.*/

package {	//Importer les clases nécessaires																		//Ajouté par Tyler D.
	
	import flash.display.*;		//Ensemble des classes clés pour l'affichage visuelle en flash						//Ajouté par Tyler D.
	import flash.events.*;		//Ensemble des classes clés pour l'utilisation de texte en flash					//Ajouté par
	
	public class Main extends MovieClip{	//Création de la class Main												//Ajouté par
	
		static public var menuP:MenuPrinc; //Création de la variable statique menuP comme MovieClip MenuPrinc		//Ajouté par
		private var monde:Monde; //Création de la variable monde comme MovieClip Monde 								//Ajouté par
		static public var scores:Score;	//Création de la variable statique scores comme MovieClip Score				//Ajouté par
		private var fin:Fin;	//Création de la variable fin comme Movieclip Fin									//Ajouté par
		
		public function Main(){	//Création de la fonction Main														//Ajouté par
			
			//Création du menuP principal et affichage.																//Ajouté par
			menuP = new MenuPrinc();	//La variable menuP est un nouveau MovieClip MenuPrinc						//Ajouté par
			addChild(menuP);	//Ajoute de menuP																	//Ajouté par
			
			//Ajouter un écouteur d'événement pour commencer le jeu, donc fait appèl à la fonction partie			//Ajouté par
			menuP.btnPartie.addEventListener(MouseEvent.CLICK, partie); 											//Ajouté par
			scores = new Score();	//La varaible scores est un nouveau MovieClip Score								//Ajouté par
			
			//trace(stats.children());
			
		} //Fin de la fonction Main																					//Ajouté par
		function partie (event:MouseEvent):void {	//Création de la fonction partie								//Ajouté par
			
			//Création du monde de jeu et ajoute-le à la scène.														//Ajouté par
			if (monde != null) {	//Si la valeur de monde est différent de null, l'énoncé if effectue:			//Ajouté par
				removeChild(monde);	//Enlève monde																	//Ajouté par
			}	//Fin de l'énoncé if																				//Ajouté par
			monde = new Monde();	//La variable monde est un nouveau Monde										//Ajouté par
			addChild(monde);	//Ajoute de monde																	//Ajouté par
			monde.init(); //Initialisation du monde																	//Ajouté par
			
			//Enlever le menuP.																						//Ajouté par
			menuP.visible = false;																					//Ajouté par
		}	//Fin de la fonction partie																				//Ajouté par
		
	}	//Fin de la class Main																						//Ajouté par
	
}	//Fin du package																								//Ajouté par		