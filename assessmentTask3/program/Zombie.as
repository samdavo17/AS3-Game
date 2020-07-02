/************************************************************************
Sam Davison
Zombie.as
Last edited on 7.2.2020

Sets zombie starting position, movement, speed and collision detection.

References:
The Code Village. Action Script 3 Tutorial - Space Shooter – 3: Spawning Enemies 
with Basic AI. Mark Bennison.
http://www.markbennison.com/actionscript/as3-space-shooter/3-spawning-enemies-
with-basic-ai/

************************************************************************/

package  {
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.TimerEvent;
	
	public class Zombie extends MovieClip {
		
		private var core:Object; 
		private var speed:int = 2;
		
		public function Zombie() {
			this.addEventListener(Event.ADDED_TO_STAGE, onStart);
			this.addEventListener(Event.ENTER_FRAME,loop);
		}
		
		function onStart(e:Event): void{
			
			//Set starting position
			this.x = Math.random() * stage.stageWidth;
			this.y = 0 - this.height;
			
			//trace("Zombie #" + MovieClip(root).numZombies);
			
			//speed += (MovieClip(root).numZombies)/2;
			
			//Set speed, dependent on number of zombies already spawned
			
			//Never got this change in speed code working properly, ended up leaving it out.
			/*
			if ((MovieClip(root).numZombies) < 10){
				speed += 0;
				trace("numZombies < 10");
			}
			
			else if (10 < (MovieClip(root).numZombies) < 20){
				speed += 1;
				trace("numZombies < 20");
			}
			else if (20 < (MovieClip(root).numZombies) < 30){
				speed += 2;
				trace("numZombies < 30");
			}
			
			else if (30 < (MovieClip(root).numZombies)){
				speed += 3;
				trace("numZombies > 30");
				}
			trace(speed);*/
		}
		
		//SPEED AND MOVEMENT
		function loop(e:Event){
			
			this.y += speed;
			
		}
		
		
		public function removeZombie(){
			this.removeEventListener(Event.ADDED_TO_STAGE, onStart);
			this.removeEventListener(Event.ENTER_FRAME,loop);
		}/*
		//The below collision detection was removed, as there was no need for 
		both the zombie and the character to have collision detection.

		//COLLISION DETECTION
		function collison(): void {
			for (var i:uint = 0; i <= core.numChildren; i++){
				var target:MovieClip = core.getChilAt(i);
				if (this.hitTestObject(target)){
					
					this.removeEventListener(Event.ADDED_TO_STAGE, onStart);
					this.removeEventListener(Event.ENTER_FRAME, loop);
					
					core.removeChild(this);
				}
				
			}
		}
	*/}
}