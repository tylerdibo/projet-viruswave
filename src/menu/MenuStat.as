// Classe par: Adrian Giammaria
package{
	import flash.events.Event;
	import flash.display.*;
	import flash.text.*;
	import flash.events.MouseEvent;
	
	public class MenuStat extends MovieClip{
			
			var affichage:String="";
			
		public function MenuStat() {
			var monMessage:TextField = new TextField();
			monMessage.x = 100;
			monMessage.y = 50;
			monMessage.autoSize = TextFieldAutoSize.CENTER;
			monMessage.textColor = 0xffffff;
			
			affichage=""
			affichage = affichage 
			+ "\n" + "temps joué:" + " " + (Stats.affiche(Stats.TEMPS))
			+ "\n" + "nombre de niveaux complété:" + " " + (Stats.affiche(Stats.NCOMPLETE)) 
			+ "\n" + "nombre d'éliminations:" + " " + (Stats.affiche(Stats.ELIM)) 
			+ "\n" + "nombre de fois éliminé:" + " " + (Stats.affiche(Stats.JELIM)) 
			+ "\n" + "nombre de tirs:" + " " + (Stats.affiche(Stats.TIRS)) 
			+ "\n" + "nombre de tirs réussi:" + " " + (Stats.affiche(Stats.TIRSR));
			monMessage.text = affichage;
			addChild(monMessage);
		}
		
		
	}
}