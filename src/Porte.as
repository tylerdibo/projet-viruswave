 //CLASSE CRÉÉ PAR: Tyler D.
	
package{
	
	import flash.display.*; //importer les classes

	public class Porte extends MovieClip{
		
		public var active:Boolean; //défini active comme boolean
		
		public function Porte(){ //assure que la porte n'est pas activé quand le niveau commence
			active = false; 
		} //fin constructeur
		
		public function activer(){ //lorsque la porte est activé, joue un animation
			active = true;
			gotoAndPlay("activer");
		}
		
	} //fin classe

}//fin paquetage