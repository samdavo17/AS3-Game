/************************************************************************
Sam Davison
Character.as
Last edited on 7.2.2020

Sets characters starting position, speed and collision detection.
Keyboard inputs and character movement are controlled with booleans.

************************************************************************/

package  {
	
	import flash.display.MovieClip;
	import flash.events.*;
	import flash.events.MouseEvent;
	import flash.ui.Keyboard;
	
	
	public class Character extends MovieClip {
		
		private var core:         Object; 
		private var leftPressed:  Boolean = false;
		private var rightPressed: Boolean = false;
		private var upPressed:    Boolean = false;
		private var downPressed:  Boolean = false;
		private var mySpeed:      Number = 5;
		
		//BEGIN GAME
		public function Character() {
			this.addEventListener(Event.ADDED_TO_STAGE, onAdd);
		}
		
		//STARTING POSITION
		function onAdd(e:Event) :void{
			core = MovieClip(root);
			
			//Set position
			this.y = 900;
			this.x = stage.stageWidth/2;
			
			this.addEventListener(Event.ENTER_FRAME,loop);
		}

		//LOOP - COLLISION DETECTION
		function loop(e:Event){
			
			//Enable all event listeners
			stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyPress);
			stage.addEventListener(KeyboardEvent.KEY_UP, onKeyRelease);
			stage.addEventListener(Event.ENTER_FRAME, keyControl);	
			
			//Bullet Event Listener:
			//stage.addEventListener(MouseEvent.CLICK, onClick, false,0,true);
			
			//Call the boundaries function
			bound();
			
			//Collision Detection
			for(var i = 3; i<core.numChildren; i++){
				var target:MovieClip = core.getChildAt(i);	
				if (this.hitTestObject(target)){
					/*
					//Remove all Listeners
					stage.removeEventListener(KeyboardEvent.KEY_DOWN, onKeyPress);
					stage.removeEventListener(KeyboardEvent.KEY_UP, onKeyRelease);
					stage.removeEventListener(Event.ENTER_FRAME, keyControl);
					this.removeEventListener(Event.ENTER_FRAME, loop);
					this.removeEventListener(Event.ADDED_TO_STAGE, onAdd);
					*/
					//Remove the Zombie
					core.removeChild(target);
					
					//Remove the Character
					//core.removeChild(this);
					
				}
			}
		}
		
		//MOVEMENT - SPEED
		function keyControl(e:Event):void{
			
			//Set a constant speed
			mySpeed = 5;
			
			if(leftPressed){
				x -= mySpeed;
			}
			if(rightPressed){
				x += mySpeed;
			}
			if(upPressed){
				y -= mySpeed;
			}
			if(downPressed){
				y += mySpeed;
			}
		}  
		
		//MOVEMENT - KEYBOARD PRESS
		function onKeyPress(e:KeyboardEvent): void{
			if(e.keyCode == Keyboard.LEFT){
				leftPressed = true;
			}
			if(e.keyCode == Keyboard.RIGHT){
				rightPressed = true;
			}
			if(e.keyCode == Keyboard.UP){
				upPressed = true;
			}
			if(e.keyCode == Keyboard.DOWN){
				downPressed = true;
			}	
		}
		
		//MOVEMENT - KEYBOARD RELEASE
		function onKeyRelease(e:KeyboardEvent):void{
			
			if(e.keyCode == Keyboard.LEFT){
				leftPressed = false;
			}
			if(e.keyCode == Keyboard.RIGHT){
				rightPressed = false;
			}
			if(e.keyCode == Keyboard.UP){
				upPressed = false;
			}
			if(e.keyCode == Keyboard.DOWN){
				downPressed = false;
			}
		}
		
		//BOUNDARIES
		function bound():void{
			
			if(leftPressed && this.x + this.width/2 < 0){
				this.x = this.width/2 + stage.stageWidth;
			}
			
			else{
				mySpeed = 5;
			}
			
			
			if(rightPressed && this.x - this.width/2 > stage.stageWidth){
				this.x = 0 - this.width/2;
			}
			
			else{
				mySpeed = 5;
			}
			
			if(upPressed && this.y - this.height/2 <= 0){
				this.y = this.height/2;
			}
			
			else{
				mySpeed = 5;
			}
			
			if(downPressed && this.y + this.height/2 >= stage.stageHeight){
				this.y = stage.stageHeight - this.height/2;
			}
			
			else{
				mySpeed = 5;
				}
			}        
    
		public function removeCharacter(){
			core.removeEventListener(Event.ADDED_TO_STAGE, onAdd);
			stage.removeEventListener(KeyboardEvent.KEY_DOWN, onKeyPress);
			stage.removeEventListener(KeyboardEvent.KEY_UP, onKeyRelease);
			stage.removeEventListener(Event.ENTER_FRAME, keyControl);
		}
	}
}