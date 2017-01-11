// Classe écrit par: Adrian Giammaria
package{
	
	public class Stats {
		private static var nTemps:int;
		public static const TEMPS:int = 0;
		
		private static var nComplete:int;
		public static const NCOMPLETE:int = 1;
		
		private static var nElim:int;
		public static const ELIM:int = 2;
		
		private static var nJElim:int;
		public static const JELIM:int = 3;
		
		private static var nTirs:int;
		public static const TIRS:int = 4;
		
		private static var nTirsR:int;
		public static const TIRSR:int = 5;
		
	public function Stats() {
			nTemps = 0;
			nComplete = 0;
			nElim = 0;
			nJElim = 0;
			nTirs = 0;
			nTirsR = 0;
		} //fin constructeur
		
	static function addition(variable:int):void {
		switch(variable)
			{ // switch 
			case TEMPS:
				nTemps++;
				break;
			case NCOMPLETE:
				nComplete++;
				break;
			case ELIM:
				nElim++;
				break;
			case JELIM:
				nJElim++;
				break;
			case TIRS:
				nTirs++;
				trace(nTirs);
				break;
			case TIRSR:
				nTirsR++;
				break;
			} //fin switch
	} // fin fonction addition
	
	
	static function supprime(variable:int):void {
		switch(variable)
			{ // switch 
			case TEMPS:
				nTemps = 0;
				break;
			case NCOMPLETE:
				nComplete = 0;
				break;
			case ELIM:
				nElim = 0;
				break;
			case JELIM:
				nJElim = 0;
				break;
			case TIRS:
				nTirs = 0;
				break;
			case TIRSR:
				nTirsR = 0;
				break;
			default:
				nTemps = 0;
				nComplete = 0;
				nElim = 0;
				nJElim = 0;
				nTirs = 0;
				nTirsR = 0;
				break;
			} //fin switch
	} //fin fonction supprime
		
	} //fin classe publique
}//fin paquetage