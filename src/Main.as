package {
	
	import flash.display.*; //importer les classes
	import flash.events.*;
	
	public class Main extends MovieClip{
		private var menu:MenuPrinc; //défini variable menu comme movieclip MenuPrinc
		private var monde:Monde; //défini variable monde comme movieclip Monde
		private var stats:XML;
		
		public function Main(){
			//Création du menu principal et affichage.
			menu = new MenuPrinc();
			addChild(menu);
			menu.btnPartie.addEventListener(MouseEvent.CLICK, partie); //Ajouter un écouteur d'événement pour commencer le jeu.
			stats = new XML(new Stats());
			trace(stats.children());
		} //fin de constructeur
		function partie (event:MouseEvent):void {
			//Création du monde de jeu et ajoute-le à la scène.
			monde = new Monde(); 
			addChild(monde);
			monde.init(); //Initialisation du monde.
			
			//Enlever le menu.
			removeChild(menu);
		}
		
	}
	
}