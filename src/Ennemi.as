//CLASSE CRÉÉ PAR: Tyler D.
package{	//Importer les classes nécessaires

	import flash.display.*;	//Ensemble des classes clés pour l'affichage visuelle en flash

	public class Ennemi extends MovieClip implements IControlable{	//Création de la classe Ennemi qui étant le MovieClip in inclut IControlable
		
		private var vitesse:int = 5;	//Création de la variable vitesse qui est un int et a une valeur initial de 5
		private var vx:int = 0;	//Création de la variable vx qui est un int et a un valeur initial de 0
		private var vy:int = 0;	//Création de la variable vy qui est un int et a un valeur initial de 0
		private var terrain:Terrain;	//Création de la variable terrain
		
		public function Ennemi(terrain:Terrain){	//Création de la fonction Ennemi
			this.terrain = terrain;	//wut
		}	//Fin de la fonction Ennemi
		
		public function clic(xSouris:int, ySouris:int):void{	//Création de la fonction clic
			
		}	//Fin de la fonction clic
		
		public function updatePositionX():void{	//Création de la fonction updatePositionX
			this.x += vx;
			testCollisionX();
		}	//Fin de la fonction updatePositionX
		
		public function updatePositionY():void{	//Création de la fonction updatePositionY 
			this.y += vy;
			testCollisionY();
		}	//Fin de la fonction updatePositionY
		
		public function setVitesseX(vitx:int):void{	//Création de la fonction setVitesseX
			vx = vitx * vitesse;
		}	//Fin de la fonction setVitesseX
		
		public function setVitesseY(vity:int):void{	//Création de la fonction setVitesseY
			vy = vity * vitesse;
		}	//Fin de la fonction setVitesseY
		
		private function testCollisionX():Boolean{	//Cération de la fonction testCollisionX
			//Pour le boucle for, lorsque la valeur de i est moins que terrain.murs.length, l'énoncé effectue:
			for(var i:uint = 0; i<terrain.murs.length; i++){
				if(hitTestObject(terrain.murs[i])){	//Si hitTestObject detect un mur, l'énoncé if effectue:
					do{	//Fait
						if(vx > 0){	//Si vx est plus que 0, l'énoncé if effectue:
							this.x--;	//
						}else{	//Si non, fait:
							this.x++;	//
						}	//Fin de l'énoncé if et else
					}while(hitTestObject(terrain.murs[i]));	//L'énoncé do lorsque hitTestObject detect un mur
					return true;	//Retourne la valeur true
				}	//Fin de l'énoncé if
			}	//Fin de la boucle for
			return false;	//Retourne false
		}	//Fin de la fonction testCollisionX
		
		private function testCollisionY():Boolean{	//Création de la fonction testCollisionY
			//Pour le boucle for, lorsque la valeur de i est moins que terrain.murs.length, l'énoncé effectue:
			for(var i:uint = 0; i<terrain.murs.length; i++){
				if(hitTestObject(terrain.murs[i])){	//Si hitTestObject detect un mur, l'énoncé if effectue:
					do{	//Fait
						if(vy > 0){	//Si vy est plus que 0, l'énoncé if effectue:
							this.y--;	//
						}else{	//Si non, fait:
							this.y++;	//
						}	//Fin de l'énoncé if et else
					}while(hitTestObject(terrain.murs[i]));	//L'énoncé do lorsque hitTestObject detect un mur
					return true;	//Retourne la valeur true
				}	//Fin de l'énoncé if
			}	//Fin de la boucle for
			return false;	//Retourne false
		}	//Fin de la fonction testCollisionY
		
	}	//Fin de la classe Ennemi

}	//Fin du package