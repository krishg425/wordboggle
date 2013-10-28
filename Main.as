package  
{
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	
	public dynamic class Main extends MovieClip
	{
		private var boggledTiles:Array;
		public static  var currentI:int = -1;
		public static var currentJ:int = -1;
		public static var selectedTilesArray:Array;
		private var myDictionary:MyDictionary;
		public function Main() 
		{
			selectedTilesArray = new Array();
			var settings:TileSettings = new TileSettings();
			myDictionary = new MyDictionary();
			settings.init();
			boggledTiles = new Array();
			boggledTiles = settings.getBoggledTiles();
			
			var loopIndex:int =-1;
			for(var i:int = 0; i < 5; i++)
			{
				for(var j:int = 0; j < 5; j++)
				{
					++loopIndex;
					var tile:MovieClip = boggledTiles[loopIndex];
					this.addChild(tile);
					tile.x = 10+ j * tile.width + j * 5;
					tile.y = 10+ i* tile.height + i * 5;
					
				}
			}
			mcFoundWords["wordsCounter"] = 0;
			mcEnterWord.addEventListener(MouseEvent.CLICK,wordEnteredListener);
			
			// constructor code
		}
		public function wordEnteredListener(evt:MouseEvent)
		{
			var foundWord:String="";
			for(var i:int = 0; i < selectedTilesArray.length;i++)
			{
				var selectedTile:MovieClip = selectedTilesArray[i];				
				foundWord += selectedTile.txtAlphabet.text;
			}
			var mcFoundWord:FoundWord = new FoundWord();
			
			mcFoundWords.addChild(mcFoundWord);
			mcFoundWord["txtFoundWord"].text = foundWord;
			mcFoundWord.x = 10;
			mcFoundWord.y = mcFoundWord.height * mcFoundWords["wordsCounter"] + 5 *  mcFoundWords["wordsCounter"];
			
			//mcFoundWord.validate();
			if(myDictionary.isValid(foundWord)==true)
			{
				trace('word is valid');
				var tick:mcCorrect = new mcCorrect();
				mcFoundWords.addChild(tick);
				tick.x = 150
				tick.y = mcFoundWord.y;
				
			}
			else
			{
				trace('word is invalid');
				var wrong:mcWrong = new mcWrong();
				mcFoundWords.addChild(wrong);
				wrong.x = 150;
				wrong.y = mcFoundWord.y;
				
			}
			for(var c:int = 0; c < selectedTilesArray.length;c++)
			{
				selectedTilesArray[c].filters=[];
				
			}
			selectedTilesArray.splice(0);
			currentI = -1;
			currentJ = -1;
			mcFoundWords["wordsCounter"] += 1;		
		}
		

	}
	
}
