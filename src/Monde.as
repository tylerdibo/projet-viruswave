package{
	
	import flash.display.*;
	import flash.events.*;
	
	public class Monde extends MovieClip{
		
		public var terrain:Terrain;
		public var niveauCourant:uint = 0;
		public var joueur:Joueur;
		private var entree:Entree;
		private var ennemi:Adware;
		private var adware:IAAdware;
		private var fin:Fin;
		private var blessures:Blessures;
		private var maps:Array = new Array();
		
		public function Monde():void{
			Stats.supprime(-1);
			
			maps.push(new map01(0, 0));
			maps.push(new map02(0, 0));
			maps.push(new map03(0, 0));
			maps.push(new map04(0, 0));
			maps.push(new map05(0, 0));
			maps.push(new map06(0, 0));
			maps.push(new map07(0, 0));
			maps.push(new map08(0, 0));
			maps.push(new map09(0, 0));
			maps.push(new map10(0, 0));
			
			var quadrants:Array = new Array();
			for(var q:uint = 0; q < 4; q++){
				quadrants[q] = maps[int(Math.random()*10)].clone();
			}			
			niveauCourant++;
			terrain = TerrainGen.creerTerrain(quadrants, this, niveauCourant);
			addChild(terrain);
			
			joueur = new Joueur(this);
			joueur.x = 200;
			joueur.y = 300;
			addChild(joueur);
			terrain.joueur = joueur;
			entree = new Entree(joueur);
			addChild(entree);
			blessures = new Blessures(this);
			blessures.x = 0;
			blessures.y = 20;
			addChild(blessures);
		}
		
		function init(){
			entree.init();
			for(var enm:uint; enm < terrain.ennemis.length; enm++){
				terrain.ennemis[enm].ia.init();
			}
			stage.addEventListener(Event.ENTER_FRAME, loop);
		}
		
		private function prochainNiveau():void{
			removeChild(terrain);
			
			var quadrants:Array = new Array();
			for(var q:uint = 0; q < 4; q++){
				quadrants[q] = maps[int(Math.random()*10)].clone();
			}			
			niveauCourant++;
			terrain = TerrainGen.creerTerrain(quadrants, this, niveauCourant);
			addChild(terrain);
			terrain.joueur = joueur;
			addChild(terrain);
			setChildIndex(joueur, getChildIndex(terrain));
			setChildIndex(terrain, getChildIndex(joueur)-1);
			for(var enm:uint; enm < terrain.ennemis.length; enm++){
				terrain.ennemis[enm].ia.init();
			}
			
			Stats.addition(Stats.NCOMPLETE);
		}
		
		function loop(event:Event):void{
			joueur.updatePositionX();
			joueur.updatePositionY();
			blessures.affiche();
			
			if(terrain.porteActive){
				if(joueur.x + joueur.width/2 >= terrain.porte.x && 
				   		joueur.x + joueur.width/2 <= (terrain.porte.x + terrain.porte.width) &&
				   		joueur.y + joueur.height/2 >= terrain.porte.y && 
				   		joueur.y + joueur.height/2 <= (terrain.porte.y + terrain.porte.height)){
					prochainNiveau();
				}
			}
			
			for(var i:uint = 0; i < terrain.ennemis.length; i++){
				terrain.ennemis[i].ia.loop();
				terrain.ennemis[i].updatePositionX();
				terrain.ennemis[i].updatePositionY();
			}
		}
		
		function mort():void{
			Stats.addition(Stats.JELIM);
			
			for(var i:uint = 0; i < terrain.ennemis.length; i++){
				terrain.ennemis[i].ia.mort();
			} 
			 removeChild(terrain);
			 removeChild(joueur);
			 entree.remove();
			 removeChild(entree);
			 removeChild(blessures);
			 fin = new Fin();
			 stage.addChild(fin);
			 fin.btnRetourF.addEventListener(MouseEvent.CLICK, recommence);
				
		} // fin mort
		
		function recommence(event:MouseEvent):void{
			//Class(Main).menuP.visible = true;
			//var menuP:MenuPrinc = Main.getChildByName("menuP");
			stage.removeChild(fin);
			Main.menuP.visible = true;
		}
	}	

}