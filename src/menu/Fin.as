package{
	import flash.events.Event;
	import flash.display.*;
	import flash.events.MouseEvent;
	import flash.text.*
	
	public class Fin extends MovieClip{
		
			var affichage:String="";
			var affichageFin:String="";
		
		public function Fin():void{
		
		
		
			var monMessage:TextField = new TextField();
			monMessage.x = 100;
			monMessage.y = 50;
			monMessage.autoSize = TextFieldAutoSize.CENTER;
			monMessage.textColor = 0xffffff;
			trace(Stats.affiche(Stats.ELIM));
			
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
			
		} //fin de fonction publiquek
	
	}

}