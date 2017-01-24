// Classe par: Adrian Giammaria
package{
	import flash.events.Event; //importer les classes nécessaires
	import flash.display.*;
	import flash.text.*;
	import flash.events.MouseEvent;
	
	public class MenuAide extends MovieClip{
			
			var affichage:String=""; //défini variable affichage comme une chaîne vide
			
		public function MenuAide() {
			var monMessage:TextField = new TextField(); //défini variable monMessage comme champ de text
			monMessage.x = 200; //position x du champ de text
			monMessage.y = 50; //position y du champ de text
			monMessage.autoSize = TextFieldAutoSize.CENTER; //centrer le text dans monMessage
			monMessage.textColor = 0xffffff; //définir le couleur du text dans monMessage 
			
			affichage="" //fait certain que affichage est vide
			affichage = affichage //définir le text contenu dans affichage
			+ "Utilise les touches fléchées pour bouger\n"  
			+ "Pour tirer, diriger la souris sur le point ou tu veut tirer et cliquer\n"
			+ "Lorsque tout les ennemis sur un écran sont éliminer, vous pouvez continuer\nau prochaine niveau\n"
			+ "Si vous êtes attaqué 5 fois il faut recommencer\n"; 
			monMessage.text = affichage; //le contenu de affichage serais mis dans le champ de text
			addChild(monMessage); //ajoute monMessage sur le scène
		} // fin constructeur
		
		
	} // fin classe
} // fin paquetage