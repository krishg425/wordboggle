package  
{
	import flash.events.*;
	import flash.display.MovieClip;
	import flash.filters.GlowFilter;
	
	public dynamic class Tile extends MovieClip
	{

		public function Tile() 
		{
			
			this.addEventListener(MouseEvent.CLICK,mouseClickListener);
			
			// constructor code
		}
		public function mouseClickListener(evt:MouseEvent)
		{
			var glow:GlowFilter = new GlowFilter(0x00aa72,1.0,7.0,7.0,4,3);
			if(Main.currentI == -1 && Main.currentJ == -1)
			{
				Main.currentI = this["i"];
				Main.currentJ = this["j"];
				this.filters = [glow];
				Main.selectedTilesArray.push(this);
			}
			else
			{
				if(Main.currentI == this["i"] && Main.currentJ == this["j"])
				{
					trace("clicked on same tile");
					this.filters = [];
					Main.selectedTilesArray.splice(0);
					Main.currentI = -1;
					Main.currentJ = -1;
					return;
				}
				
				
				var absI:int = Math.abs(this["i"] - Main.currentI);
				var absJ:int = Math.abs(this["j"] - Main.currentJ);
				
				if(absI > 1 || absJ > 1)//is not a neighbour
				{
					for(var i:int = 0; i < Main.selectedTilesArray.length;i++)
					{
						Main.selectedTilesArray[i].filters=[];
						
					}
					Main.selectedTilesArray.splice(0);
					Main.currentI = -1;
					Main.currentJ = -1;
				}
				else
				{
					this.filters = [glow];
					Main.selectedTilesArray.push(this);
					Main.currentI = this["i"];
					Main.currentJ = this["j"];
				}
				
				
			}
			
			
			
			
			
		}
		

	}
	
}
