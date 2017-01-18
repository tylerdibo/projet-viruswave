package{

	public class MenuPrinc extends MovieClip{
		
		public MenuPrinc(){
			
			btnPartie.addEventListener(MouseEvent.CLICK, partie);
			
			btnOptions.addEventListener(MouseEvent.CLICK, options);
			
			btnStats.addEventListener(MouseEvent.CLICK, stats);
			
			btnAide.addEventListener(MouseEvent.CLICK, aide);
			
			btnQuitter.addEventListener(MouseEvent.CLICK, quitter);
		} //fin de fonction publique
		
		
		
	}

}