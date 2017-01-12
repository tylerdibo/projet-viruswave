package{

	import flash.utils.Timer;
	import flash.events.TimerEvent;

	public class IATrojan{
		
		private var trojan:IControllable;
		private var vitesse:int = 5;
		
		public function IATrojan(trojan:IControllable):void{
			this.trojan = trojan;
			
			var timer:Timer = new Timer(5000); //Créer un nouveau Timer qui donne un événement à chaque 5 secondes.
			timer.addEventListener(TimerEvent.TIMER, periodique);
		}
		
		function periodique(event:TimerEvent){
			vitesse = 0;
			var laser:Laser = new Laser(this.x + this.width/2, this.y + this.height/2, joueurX, joueurY, terrain);
			stage.addChild(laser);
		}
		
		public function loop(){
			
		}
		
	}

}