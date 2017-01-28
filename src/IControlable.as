package{

	//Interface pour les entités controlables qui définit les fonctions de base.
	public interface IControlable{
		function clic(xSouris:int, ySouris:int):void;
		function setVitesseX(vitx:int):void;
		function setVitesseY(vity:int):void;
	}

}