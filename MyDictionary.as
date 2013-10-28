package  
{
	import flash.events.*;
	import flash.net.URLRequest;
	import flash.net.URLLoader;

	public class MyDictionary 
	{
		private var allWords:String = "";
		private var wordsArray:Array;
		private var loader:URLLoader;
		public function MyDictionary() 
		{			
			var url:URLRequest = new URLRequest("british.txt");
			loader = new URLLoader();
			loader.load(url);
			loader.addEventListener(Event.COMPLETE, loaderComplete);
		}
		function loaderComplete(e:Event):void
		{
			var filteredWords:String = "";
			allWords = loader.data;
			filteredWords = allWords;
			wordsArray = allWords.split("\n");
			//trace("wordsArray:"+wordsArray);
			
			var newString:String;
			var findCarriageReturnRegExp:RegExp = new RegExp("\r", "gi");
			newString = allWords.replace(findCarriageReturnRegExp, " ");
			var findNewLineRegExp:RegExp = new RegExp("\n", "gi");
			newString = newString.replace(findNewLineRegExp, " ");
			trace( newString );
			allWords = newString;
		}
		public function isValid(word:String):Boolean
		{
			//trace('allwords'+allWords);
			//trace('test word:'+wordsArray[0]);
			word = word.toLowerCase();
			trace('word:'+word);
			var flag:Boolean = false;
			word = " "+word+" ";
			trace('index of '+word+' is '+allWords.search(word));
			if(allWords.search(word) != -1 )
			{
				flag = true;
			}
			
			return flag;
		}
	}
}
