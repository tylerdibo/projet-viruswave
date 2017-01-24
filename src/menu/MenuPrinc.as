package{
	import flash.events.Event;
	import flash.display.*;
	import flash.events.MouseEvent;
	
	public class MenuPrinc extends MovieClip{
		
		private var menuS:MenuStat;
		private var menuA:MenuAide;
		
		public function MenuPrinc():void{
			
			btnStats.addEventListener(MouseEvent.CLICK, stats);
			
			btnAide.addEventListener(MouseEvent.CLICK, aide);
		
		} //fin de fonction publique
		
		function stats (event:MouseEvent):void {
			menuS = new MenuStat();
			addChild(menuS);
			menuS.btnRetour.addEventListener(MouseEvent.CLICK, retour);
		}	
		
		function retour (event:MouseEvent):void {
				removeChild(menuS);
			}
		
		function aide (event:MouseEvent):void {
			menuA = new MenuAide();
			addChild(menuA);
			menuA.btnRetourA.addEventListener(MouseEvent.CLICK, retourA);
		}
		
		function retourA (event:MouseEvent):void {
				removeChild(menuA);
			}
		
	}

}