package {
	
	import flash.display.*;
	import flash.events.*;
	
	public class Entree extends MovieClip{
		
		static var upPress:Boolean = false;
		static var downPress:Boolean = false;
		static var leftPress:Boolean = false;
		static var rightPress:Boolean = false;
		static var leftClick:Boolean = false;
		
		private var controlable:IControlable;
		
		public function Entree(controle:IControlable):void{
			controlable = controle;
		}
		
		function init():void{
			stage.addEventListener(KeyboardEvent.KEY_DOWN, keyDown);
			stage.addEventListener(KeyboardEvent.KEY_UP, keyUp);
			stage.addEventListener(MouseEvent.MOUSE_DOWN, mouseDown);
			stage.addEventListener(MouseEvent.MOUSE_UP, mouseUp);
		}
		
		function keyDown(event:KeyboardEvent):void{
			switch(event.keyCode){
				case 37:
				case 65:
					leftPress = true;
					break;
				case 39:
				case 68:
					rightPress = true;
					break;
				case 38:
				case 87:
					upPress = true;
					break;
				case 40:
				case 83:
					downPress = true;
					break;
			}
			controlable.setVitesseX(int(rightPress)-int(leftPress));
			controlable.setVitesseY(int(downPress)-int(upPress));
		}
		
		function keyUp(event:KeyboardEvent):void{
			switch(event.keyCode){
				case 37:
				case 65:
					leftPress = false;
					break;
				case 39:
				case 68:
					rightPress = false;
					break;
				case 38:
				case 87:
					upPress = false;
					break;
				case 40:
				case 83:
					downPress = false;
					break;
			}
			controlable.setVitesseX(int(rightPress)-int(leftPress));
			controlable.setVitesseY(int(downPress)-int(upPress));
		}
		
		function mouseDown(event:MouseEvent):void{
			leftClick = true;
			controlable.clic(mouseX, mouseY);
		}
		
		function mouseUp(event:MouseEvent):void{
			leftClick = false;
		}
		
	}
	
}