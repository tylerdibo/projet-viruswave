package {
	
	import flash.display.*;
	import flash.events.*;
	
	public class Main extends MovieClip{
		private var menu:MenuPrinc;
		private var monde:Monde;
		public function Main(){
			
			menu = new MenuPrinc();
			addChild(menu);
			menu.btnPartie.addEventListener(MouseEvent.CLICK, partie);
			
		}
		function partie (event:MouseEvent):void {
			monde = new Monde();
			addChild(monde);
			monde.init();
			
			removeChild(menu);
		}
		
	}
	
}