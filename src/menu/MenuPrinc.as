package{
	import flash.events.Event;
	import flash.display.*;
	import flash.events.MouseEvent;
	
	public class MenuPrinc extends MovieClip{
		
		public function MenuPrinc():void{
			
			btnPartie.addEventListener(MouseEvent.CLICK, partie);
			
			btnOptions.addEventListener(MouseEvent.CLICK, options);
			
			btnStats.addEventListener(MouseEvent.CLICK, stats);
			
			btnAide.addEventListener(MouseEvent.CLICK, aide);
			
			btnQuitter.addEventListener(MouseEvent.CLICK, quitter);
		
		} //fin de fonction publique
		
		function partie (event:MouseEvent):void {
			Main.nPartie();
		}
		
		function options (event:MouseEvent):void {
			trace("test");
		}
		
		function stats (event:MouseEvent):void {
			trace("test");
		}	
		
		function aide (event:MouseEvent):void {
			trace("test");
		}
		
		function quitter (event:MouseEvent):void {
			trace("tests");
		}
		
	}

}