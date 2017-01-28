//CLASSE CRÉÉ PAR: Adrian G.

package{
	import flash.events.Event; //importer les classes
	import flash.display.*;
	import flash.events.MouseEvent;
	
	public class MenuPrinc extends MovieClip{
		
		private var menuS:MenuStat; //variables défini comme movieClip
		private var menuA:MenuAide;
		
		public function MenuPrinc():void{
			
			btnStats.addEventListener(MouseEvent.CLICK, stats); //ajouter les écouteurs d'évènements pour vérifier si l'utilisateur clique sur les bouttons
			
			btnAide.addEventListener(MouseEvent.CLICK, aide);
		
		} //fin constructeur
		
		function stats (event:MouseEvent):void { //affiche menuStat 
			menuS = new MenuStat();
			addChild(menuS);
			menuS.btnRetour.addEventListener(MouseEvent.CLICK, retour); //ajoute écouteur d'évènement pour btnRetour dans menuStat
		}	
		
		function retour (event:MouseEvent):void { //retourner au menu principale
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
		
	} //fin classe

} //fin paquetage