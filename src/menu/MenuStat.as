// Classe par: Adrian Giammaria
package{
	import flash.events.Event; //importer les classes
	import flash.display.*;
	import flash.text.*;
	import flash.events.MouseEvent;
	
	public class MenuStat extends MovieClip{
			
			var affichage:String=""; //défini variable affichage comme une string
			var scores:Array = U4A3_ProjetFinal.scores.triBulles(); //défini variable scores comme une tableau
			
		public function MenuStat() {
			var monMessage:TextField = new TextField();  //défini variable monMessage comme champ de texte et crée une nouvelle champ de texte
			monMessage.x = 100; //position sur l'axe x est 100
			monMessage.y = 50; //position sur l'axe y est 50
			monMessage.autoSize = TextFieldAutoSize.CENTER; //centrer le text dans monMessage
			monMessage.textColor = 0xffffff; //défini couleur du text dans monMessage comme blanc
			
			affichage=""
			for (var i=0; i<10; i++) //boucle for répète 10 fois avant d'arrêter
				{
					if (scores[i] != null) { //assure qu'une rang dans scores existe
					affichage = affichage + scores[i].nom + " points: " + scores[i].score + "\n"; //affiche le nom du joueur et le nombre de points obtenu
					}
				}
			monMessage.text = affichage; //text dans momMessage est égale au string affichage
			addChild(monMessage); //affiche text au document
		}
		
		
	}
}