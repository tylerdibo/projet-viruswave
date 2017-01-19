package {
	
	import flash.display.*;
	
	public class Main extends MovieClip{
		private var menu:MenuPrinc;
		private var monde:Monde;
		public function Main(){
			
			menu = new MenuPrinc();
			addChild(menu);
		}
		function nPartie ():void {
			monde = new Monde();
			addChild(monde);
			monde.init();
			
			removeChild(menu);
		}
		
	}
	
}