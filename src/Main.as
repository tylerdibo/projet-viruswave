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

//CLASSE CRÉER PAR: Tyler D., Adrian G., John A.

package {	//Importer les clases nécessaires																		
	
	import flash.display.*;		//Ensemble des classes clés pour l'affichage visuelle en flash						
	import flash.events.*;		//Ensemble des classes clés pour l'utilisation de texte en flash					
	
	public class Main extends MovieClip{	//Création de la classe Main												
	
		static public var menuP:MenuPrinc; //Création de la variable statique menuP comme MovieClip MenuPrinc		
		private var monde:Monde; //Création de la variable monde comme MovieClip Monde 								
		static public var scores:Score;	//Création de la variable statique scores comme MovieClip Score				
		private var fin:Fin;	//Création de la variable fin comme Movieclip Fin									
		
		public function Main(){	//Création de la fonction Main														
			
			//Création du menuP principal et affichage.																
			menuP = new MenuPrinc();	//La variable menuP est un nouveau MovieClip MenuPrinc						
			addChild(menuP);	//Ajoute de menuP																	
			
			//Ajouter un écouteur d'événement pour commencer le jeu, donc fait appèl à la fonction partie			
			menuP.btnPartie.addEventListener(MouseEvent.CLICK, partie); 											
			scores = new Score();	//La varaible scores est un nouveau MovieClip Score								
			
			//trace(stats.children());
			
		} //Fin de la fonction Main																					
		function partie (event:MouseEvent):void {	//Création de la fonction partie								
			
			//Création du monde de jeu et ajoute-le à la scène.														
			if (monde != null) {	//Si la valeur de monde est différent de null, l'énoncé if effectue:			
				removeChild(monde);	//Enlève monde																	
			}	//Fin de l'énoncé if																				
			monde = new Monde();	//La variable monde est un nouveau Monde										
			addChild(monde);	//Ajoute de monde																	
			monde.init(); //Initialisation du monde																	
			
			//Enlever le menuP.																						
			menuP.visible = false;																					
		}	//Fin de la fonction partie																				
		
	}	//Fin de la classe Main																						
	
}	//Fin du package																								