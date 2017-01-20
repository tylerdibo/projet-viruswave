package{
	import flash.events.Event;
	import flash.display.*;
	import flash.events.MouseEvent;
	
	public class MenuPrinc extends MovieClip{
		
		private var menuS:MenuStat;
		
		public function MenuPrinc():void{
			
			btnOptions.addEventListener(MouseEvent.CLICK, options);
			
			btnStats.addEventListener(MouseEvent.CLICK, stats);
			
			btnAide.addEventListener(MouseEvent.CLICK, aide);
		
		} //fin de fonction publique
		
		function options (event:MouseEvent):void {
			trace("test");
		}
		
		function stats (event:MouseEvent):void {
			menuS = new MenuStat();
			addChild(menuS);
			menuS.btnRetour.addEventListener(MouseEvent.CLICK, retour);
		}	
		
		function retour (event:MouseEvent):void {
				removeChild(menuS);
			}
		
		function aide (event:MouseEvent):void {
			menuO = new MenuStat();
			addChild(menuO);
			menuO.btnRetour.addEventListener(MouseEvent.CLICK, retour);
		}
		
	}

}