//CLASSE CRÉÉE PAR: Tyler D.
package {	//Importer les classes nécessaires
	
	import flash.display.*;
	import flash.events.*;
	
	public class Entree extends MovieClip{ //Création de la classe Entree qui prends les entrées du clavier et de la souris
		
		//Établie les variables des clés de claviers et souris
		static var upPress:Boolean = false;
		static var downPress:Boolean = false;
		static var leftPress:Boolean = false;
		static var rightPress:Boolean = false;
		static var leftClick:Boolean = false;
		
		private var controlable:Joueur;
		
		public function Entree(controle:Joueur):void{	//Création de la fonction Entree qui permet de controler l'avatar du joueur
			controlable = controle;
		}
		
		function init():void{	//Création de la fonction init qui rends tous les entrées à l'écoute (initialiser)
			stage.addEventListener(KeyboardEvent.KEY_DOWN, keyDown);
			stage.addEventListener(KeyboardEvent.KEY_UP, keyUp);
			stage.addEventListener(MouseEvent.MOUSE_DOWN, mouseDown);
			stage.addEventListener(MouseEvent.MOUSE_UP, mouseUp);
		}
		
		function remove():void{	//Création de la fonction remove qui enlève les entrées lorsque le match n'est pas active
			stage.removeEventListener(KeyboardEvent.KEY_DOWN, keyDown);
			stage.removeEventListener(KeyboardEvent.KEY_UP, keyUp);
			stage.removeEventListener(MouseEvent.MOUSE_DOWN, mouseDown);
			stage.removeEventListener(MouseEvent.MOUSE_UP, mouseUp);
		}
		
		function keyDown(event:KeyboardEvent):void{	//Création de la fonction qui initialise d'autres clés (W, A, S, D,  ESC) activé
			switch(event.keyCode){
				case 37:
				case 65:
					leftPress = true;
					break;
				case 39:
				case 68:
					rightPress = true;
					break;
				case 38:
				case 87:
					upPress = true;
					break;
				case 40:
				case 83:
					downPress = true;
					break;
				case 27:
					while(controlable.blessures > 0){
						controlable.frappe();
					}
					break;
			}
			//Modifier la vitesse à partir des touches de clavier.
			controlable.setVitesseX(int(rightPress)-int(leftPress));
			controlable.setVitesseY(int(downPress)-int(upPress));
		}
		
		function keyUp(event:KeyboardEvent):void{	//Création de la fonction qui initialise d'autres clés (W, A, S, D,  ESC) inactivé
			switch(event.keyCode){
				case 37:
				case 65:
					leftPress = false;
					break;
				case 39:
				case 68:
					rightPress = false;
					break;
				case 38:
				case 87:
					upPress = false;
					break;
				case 40:
				case 83:
					downPress = false;
					break;
			}
			//Modifier la vitesse à partir des touches de clavier.
			controlable.setVitesseX(int(rightPress)-int(leftPress));
			controlable.setVitesseY(int(downPress)-int(upPress));
		}
		
		function mouseDown(event:MouseEvent):void{	//Création de la fonction mouseDown 
			leftClick = true;	//Le bouton gauche sur la souris est activé
			controlable.clic(mouseX, mouseY);	//Prends les coordonnés de la souris pour déterminer l'orientation du tir
		}
		
		function mouseUp(event:MouseEvent):void{
			leftClick = false;	//Le bouton gauche sur la souris est nonactivé
		}
		
	}
	
}