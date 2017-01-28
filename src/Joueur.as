//CLASSE CRÉER PAR: Tyler D.
package {
	
	import flash.display.*;	//Ensemble des classes clés pour l'affichage visuelle en flash
	
	public class Joueur extends MovieClip implements IControlable{	//Création de la fonction Joueur qui étend MovieClip et inclut IControlable
	
		private var vitesse:int = 5;	//Établie la variable vitesse qui a une valeur initial de 5
		private var vx:int = 0;			//Établie la variable vx qui a une valeur initial de 0
		private var vy:int = 0;			//Établie la varaible vy qui a une valeur initial de 0
		private var monde:Monde;		//Établie la variable monde
		public var blessures:int = 3;	//Établie la variable blessure qui est un int 3
		//private var hitbox:Rectangle;
		
		public function Joueur(monde:Monde):void{	//Création de la fonction joueur
			this.monde = monde;	//Lie monde à monde
		}	//Fin de la fonction joueur
		
		public function clic(xCible:int, yCible:int):void{	//Création de la fonction clic
			var laser:Laser = new Laser(this.x + this.width/2, this.y + this.height/2, xCible, yCible, monde.terrain, true);	//Crée l'objet Laser
			monde.terrain.addChild(laser);	//Ajoute laser
			laser.stop();	//Arrête l'animation du laser
			Stats.addition(Stats.TIRS);	//Ajoute au nombre de tirs
		}	//Fin de la fonction clic
		
		public function updatePositionX():void{	//Création de la fonction updatePositionX
			//Actualiser la position x et tester pour une collision.
			this.x += vx;
			testCollisionX();	//Vérifie la collisionX
		}	//Fin de la fonction updatePositionX
		
		public function updatePositionY():void{	//Création de la fonction updatePositionY
			//Actualiser la position y et tester pour une collision.
			this.y += vy;
			testCollisionY();	//Vérifie la collisionY
		}	//Fin de la fonction updatePositionY
		
		public function setVitesseX(vitx:int):void{	//Création de la fonction setVitesseX
			//Modifier la vitesse.
			vx = vitx * vitesse;
		}	//Fin de la fonction setVitesseX
		
		public function setVitesseY(vity:int):void{	//Création de la fonction setVitesseY
			//Modifier la vitesse.
			vy = vity * vitesse;
		}	//Fin de la fonction setVitessey
		
		public function frappe():void{	//Création de la fonction frappe qui détermine les vies du joueur
			//Enlever un point de blessures.
			blessures--;
			if(blessures == 0){	//À zéro vies le joueur est mort.
				monde.mort();
			}
		}	//Fin de la fonction frappe
		
		private function testCollisionX():Boolean{	//Création de la fonction testCollisionX qui détermine s'y il a un collision sur l'axe x
			//Assurer que l'entité ne touche pas un mur.
			for(var i:uint = 0; i<monde.terrain.murs.length; i++){
				if(hitTestObject(monde.terrain.murs[i])){ //Si hitTestObject détecte un mur, l'énoncé if effectue:
					do{
						if(vx > 0){ //Si vx est plus que 0, retourner vers la gauche:
							this.x--;
						}else{ //Si non, retourner vers la droite:
							this.x++;
						}
					}while(hitTestObject(monde.terrain.murs[i])); //Continuer à retourner si il est encore dans le mur.
					return true;
				}
			}
			return false;
		}
		
		private function testCollisionY():Boolean{	//Création de la fonction testCollisionY qui détermine s'y il a un collision sur l'axe y
			//Assurer que l'entité ne touche pas un mur.
			for(var i:uint = 0; i<monde.terrain.murs.length; i++){
				if(hitTestObject(monde.terrain.murs[i])){ //Si hitTestObject détecte un mur, l'énoncé if effectue:
					do{
						if(vy > 0){ //Si vx est plus que 0, retourner vers le haut:
							this.y--;
						}else{ //Si non, retourner vers le bas:
							this.y++;
						}
					}while(hitTestObject(monde.terrain.murs[i])); //Continuer à retourner si il est encore dans le mur.
					return true;
				}
			}
			return false;
		}
	}	//Fin de la classe Joueur
	
}	//Fin du package