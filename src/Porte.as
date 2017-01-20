package{
	
	import flash.display.*;

	public class Porte extends MovieClip{
		
		public var active:Boolean;
		
		public function Porte(){
			active = false;
		}
		
		public function activer(){
			active = true;
			gotoAndPlay("activer");
		}
		
	}

}