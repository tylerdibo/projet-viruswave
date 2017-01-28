//CLASSE CRÉEE PAR: Tyler D.
package {	//Importer les classes nécessaires
	
	import flash.geom.Point;	//Ensemble des classes pour l'utilisation de l'orientation du curseur
	import flash.display.*;		//Ensemble des classes clés pour l'affichage visuelle en flash
	import flash.events.Event;	//Ensemble de classes clés pour l'utilisation du souris en flash
	
	public class Laser extends MovieClip{
		
		private const VITESSE_LASER:int = 10; //Sauvegarder la vitesse du laser.
		
		//Déclarer les variables.
		private var laserDeplace:Point;
		private var terrain:Terrain;
		private var cibleEnnemi:Boolean;
		
		public function Laser(xOrigine:int, yOrigine:int, xCible:int, yCible:int, terrain:Terrain, cibleEnnemi:Boolean):void{
			//Prendre les variables des paramètres du constructeur.
			this.cibleEnnemi = cibleEnnemi;
			this.terrain = terrain;
			this.x = xOrigine;
			this.y = yOrigine;
			//Tourner le laser pour viser sa cible;
			this.rotation = (180/Math.PI)*Math.atan2(yCible - this.y, xCible - this.x); 
			//Créer un vecteur de mouvement pour le laser.
			laserDeplace = new Point(xCible - this.x, yCible - this.y);
			laserDeplace.normalize(VITESSE_LASER);
			this.addEventListener(Event.ENTER_FRAME, loop); //Ajouter un écouteur d'événement.
		}
		
		private function removeThis(){
			//Supprimer le laser et son écouteur d'événement.
			this.removeEventListener(Event.ENTER_FRAME, loop);
			terrain.removeChild(this);
		}
		
		private function loop(event:Event){
			//Actualiser la position.
			this.x += laserDeplace.x;
			this.y += laserDeplace.y;
			
			//Si c'est tiré par le joueur, détecter si le laser touche un ennemi.
			if(cibleEnnemi){
				for(var e:uint = 0; e<terrain.ennemis.length; e++){
					if(hitTestObject(terrain.ennemis[e])){
						//Si le laser touche un ennemi, tue-le, ajoute aux statistiques, et supprime le laser.
						terrain.ennemiMort(e);
						Stats.addition(Stats.ELIM);
						Stats.addition(Stats.TIRSR);
						removeThis();
						break;
					}
				}
			}else{ //Si c'est tiré par un ennemi, détecter si le laser touche le joueur.
				if(hitTestObject(terrain.joueur)){
					//Si le laser touche le joueur, enlève un point de blessures et supprime le laser
					terrain.joueur.frappe();
					removeThis();
				}
			}
			
			//Supprimer le laser si il touche un mur.
			for(var i:uint = 0; i<terrain.mursLaser.length; i++){
				if(hitTestObject(terrain.mursLaser[i])){
					removeThis();
					break;
				}
			}
		}
		
	}
	
}