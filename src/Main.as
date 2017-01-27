package {
	
	import flash.display.*; //importer les classes
	import flash.events.*;
	
	public class Main extends MovieClip{
		private var menuP:MenuPrinc; //défini variable menuP comme movieclip MenuPrinc
		private var monde:Monde; //défini variable monde comme movieclip Monde
		private var stats:XML;
		private var fin:Fin;
		
		public function Main(){
			//Création du menuP principal et affichage.
			menuP = new MenuPrinc();
			addChild(menuP);
			menuP.btnPartie.addEventListener(MouseEvent.CLICK, partie); //Ajouter un écouteur d'événement pour commencer le jeu.
			stats = new XML(new Stats());
			//trace(stats.children());
		} //fin de constructeur
		function partie (event:MouseEvent):void {
			//Création du monde de jeu et ajoute-le à la scène.
			if (monde != null) {
				removeChild(monde);
			}
			monde = new Monde(); 
			addChild(monde);
			monde.init(); //Initialisation du monde.
			
			//Enlever le menuP.
			//menuP.visible = false;
		}
		
	}
	
}