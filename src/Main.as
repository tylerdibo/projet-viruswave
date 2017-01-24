package {
	
	import flash.display.*; //importer les classes
	import flash.events.*;
	
	public class Main extends MovieClip{
		private var menu:MenuPrinc; //défini variable menu comme movieclip MenuPrinc
		private var monde:Monde; //défini variable monde comme movieclip Monde
		public function Main(){
			
			menu = new MenuPrinc();
			addChild(menu);
			menu.btnPartie.addEventListener(MouseEvent.CLICK, partie);
			
		} //fin de constructeur
		function partie (event:MouseEvent):void {
			monde = new Monde(); 
			addChild(monde);
			monde.init();
			
			removeChild(menu);
		}
		
	}
	
}