package{

	import flash.utils.Timer;
	import flash.events.TimerEvent;

	public class IAAdware{
		
		private var adware:IControlable;
		private var monde:Monde;
		private var timer:Timer;
		
		public function IAAdware(adware:IControlable, monde:Monde):void{
			this.adware = adware;
			this.monde = monde;
			
			timer = new Timer(100); //Créer un nouveau Timer qui donne un événement à chaque 5 secondes.
			timer.addEventListener(TimerEvent.TIMER, periodique);
			timer.start();
		}
		
		function periodique(event:TimerEvent):void{
			 adware.setVitesseX(0);
			 adware.setVitesseY(0);
			 adware.clic(monde.joueur.x + monde.joueur.width/2, monde.joueur.y + monde.joueur.height/2);
		}
		
		public function loop():void{
			
		}
		
	}

}