package{

	import flash.utils.Timer;
	import flash.events.TimerEvent;
	import flash.events.Event;
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Loader;
	
	
	


	public class IAAdware{
		
		private static var animation:BitmapData;
		private static var animationTab:Vector.<BitmapData>; 
		
		private var adware:IControlable;
		private var monde:Monde;
		private var timer:Timer;
		private var bitmap:Bitmap;
		private var image:int;
		
		//public static function anim
		
		public function IAAdware(adware:IControlable, monde:Monde):void{
			this.adware = adware;
			this.monde = monde;
			
			timer = new Timer(1000); //Créer un nouveau Timer qui donne un événement à chaque 5 secondes.
			timer.addEventListener(TimerEvent.TIMER, periodique);
			//timer.start();
			/*if (!animation) {
			var charge:Loader = new Loader();
			//charge.contentLoaderInfo.addEventListener(Event.COMPLETE, onLoadComplete);
			charge.load(new URLRequest("spywareTir_Animation 1_0.png"));*/
		}
		
		function periodique(event:TimerEvent):void{
			 adware.setVitesseX(0);
			 adware.setVitesseY(0);
			 adware.clic(monde.joueur.x + monde.joueur.width/2, monde.joueur.y + monde.joueur.height/2);
		}
		
		public function loop():void{
			//adware.setVitesseX(1);
		}
		
		/********************************************************************
		contrôler les animations*/
		
		function anim():void {
			
		}
	}

}