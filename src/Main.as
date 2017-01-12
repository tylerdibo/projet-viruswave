package {
	
	import flash.display.*;
	
	public class Main extends MovieClip{
		
		private var monde:Monde;
		
		public function Main(){
			monde = new Monde();
			addChild(monde);
			monde.init();
		}
		
	}
	
}