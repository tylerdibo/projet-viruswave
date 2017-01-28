package{
	import flash.events.Event; //importer les classes
	import flash.display.*;
	import flash.events.MouseEvent;
	import flash.text.*
	
	public class Fin extends MovieClip{
		
			var affichage:String=""; //défini variable affichage comme un string
			
		
		public function Fin():void{
			var monMessage:TextField = new TextField(); //défini les propriétés du textfield monMessage
			monMessage.x = 100;
			monMessage.y = 50;
			monMessage.autoSize = TextFieldAutoSize.CENTER;
			monMessage.textColor = 0xffffff;
			
			affichage=affichage  //affiche les statistiques
			+ "\n" + "nombre de niveaux complété:" + " " + (Stats.affiche(Stats.NCOMPLETE)) 
			+ "\n" + "nombre d'éliminations:" + " " + (Stats.affiche(Stats.ELIM)) 
			+ "\n" + "nombre de fois éliminé:" + " " + (Stats.affiche(Stats.JELIM)) 
			+ "\n" + "nombre de tirs:" + " " + (Stats.affiche(Stats.TIRS)) 
			+ "\n" + "nombre de tirs réussi:" + " " + (Stats.affiche(Stats.TIRSR))
			+ "\n" + "score final: " + (Stats.affiche(Stats.ELIM) - Stats.affiche(Stats.TIRS) + (Stats.affiche(Stats.NCOMPLETE) * 30));
			monMessage.text = affichage;
			addChild(monMessage);
			
		} //fin constructeur
	
	}

}