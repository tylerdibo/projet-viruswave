﻿package{
	
	import flash.display.*;
	import flash.events.*;
	
	public class Monde extends MovieClip{
		
		public var terrain:Terrain;
		private var terrainsListe:Array = new Array();
		public var joueur:Joueur;
		private var entree:Entree;
		private var ennemi:Adware;
		private var adware:IAAdware;
		private var fin:Fin;
		
		public function Monde():void{
			var maps:Array = new Array();
			maps.push(new map01(0, 0));
			maps.push(new map02(0, 0));
			maps.push(new map03(0, 0));
			maps.push(new map04(0, 0));
			terrain = TerrainGen.creerTerrain(maps, this);
			addChild(terrain);
			joueur = new Joueur(this);
			joueur.x = 200;
			joueur.y = 300;
			addChild(joueur);
			terrain.joueur = joueur;
			entree = new Entree(joueur);
			addChild(entree);
		}
		
		function init(){
			entree.init();
			stage.addEventListener(Event.ENTER_FRAME, loop);
		}
		
		function loop(event:Event):void{
			joueur.updatePositionX();
			joueur.updatePositionY();
			/*for(var i:uint = 0; i < terrain.ennemis.length; i++){
				terrain.ennemis[i].ia.loop();
				terrain.ennemis[i].updatePositionX();
				terrain.ennemis[i].updatePositionY();
			} */
			//adware.loop();
			//ennemi.updatePositionX();
			//ennemi.updatePositionY();
		}
		
		function mort():void{
			for(var i:uint = 0; i < terrain.ennemis.length; i++){
				terrain.ennemis[i].ia.mort();
			} 
			 removeChild(terrain);
			 removeChild(joueur);
			 entree.remove();
			 removeChild(entree);
			 fin = new Fin();
			 stage.addChild(fin);
			 fin.btnRetourF.addEventListener(MouseEvent.CLICK, recommence);
				
		} // fin mort
		
		function recommence(event:MouseEvent):void{
			//Class(Main).menuP.visible = true;
			//var menuP:MenuPrinc = Main.getChildByName("menuP");
			stage.removeChild(fin);
		}
	}	

}