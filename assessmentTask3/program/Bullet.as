package
{
    import flash.display.*;
    import flash.events.*;
	import flash.utils.Timer;
	
    public class Bullet extends MovieClip
    {
		private var core:       Object;
        private var stageRef:   Stage; //boundaries
        private var speed:      Number = 10; // bullet speed
        private var xVel:       Number = 0; //x velocity
        private var yVel:       Number = 0; //y velocity
     
        public function Bullet(stageRef:Stage, X:int, Y:int):void
        {
			core = MovieClip(root);
            this.stageRef = stageRef;
            this.x = X;
            this.y = Y;
			this.addEventListener(Event.ENTER_FRAME,loop);
			this.addEventListener(Event.REMOVED_FROM_STAGE, removeListeners);
        }
		
		public function loop(e:Event){
			
			this.y -= 10;
		
			if 	(this.y < 10){
				this.removeEventListener(Event.ENTER_FRAME,loop);
				parent.removeChild(this);
				//trace(core.numChildren);
				
			}
			
		}
		
		public function removeListeners(e:Event){
			this.removeEventListener(Event.ENTER_FRAME,loop);
		}
		
		//public function removeListeners()
		
		/*
		public var bulletList:Array = []; //new array for the bullets
        public function bullet():void
        {
            stage.addEventListener(MouseEvent.CLICK, shootBullet, false, 0, true);
            stage.addEventListener(Event.ENTER_FRAME, loopBullet, false, 0, true); //add an EventListener for the loop
        }
 
        public function loopBullet(e:Event):void //create the loop function
        {
            if(bulletList.length > 0) //if there are any bullets in the bullet list
            {
                for(var i:int = bulletList.length-1; i >= 0; i--) //for each one
                {
                    bulletList[i].loop(); //call its loop() function
                }
            }
        }
 
        public function shootBullet(e:MouseEvent):void
        {
            var bullet:Bullet = new Bullet(stage, this.x, this.y);
            bullet.addEventListener(Event.REMOVED_FROM_STAGE, bulletRemoved, false, 0, true); //triggers the "bulletRemoved()" function whenever this bullet is removed from the stage
            bulletList.push(bullet); //add this bullet to the bulletList array
            stage.addChild(bullet);
        }

        public function bulletRemoved(e:Event):void
        {
            e.currentTarget.removeEventListener(Event.REMOVED_FROM_STAGE, bulletRemoved); //remove the event listener so we don't get any errors
            bulletList.splice(bulletList.indexOf(e.currentTarget),1); //remove this bullet from the bulletList array
        }
	*/
	}
}