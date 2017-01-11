package{

	import flash.utils.Timer;
	import flash.events.TimerEvent;

	public class IAAdware{
		
		private var adware:IControllable;
		
		public function IAAdware(adware:IControllable):void{
			this.adware = adware;
			
			var timer:Timer = new Timer(5000); //Créer un nouveau Timer qui donne un événement à chaque 5 secondes.
			timer.addEventListener(TimerEvent.TIMER, periodique);
		}
		
		function periodique(event:TimerEvent){
			 
		}
		
		public function loop(){
			
		}
		
	}

}