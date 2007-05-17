package sketchbook.colors
{
	import flash.display.BitmapData;
	import flash.display.Bitmap;
	import sketchbook.colors.*
	
	/**
	 * Colorオブジェクトを配列として管理するクラス
	 * 
	 * <p>24ビット数値の配列、Colorオブジェクトの配列、Bitmap, BitmapDataから一連のカラーオブジェクトを生成できる</p>
	 * <p>TODO: 明度順、彩度順、色相順、特定の色との近似色準といった具合にソート可能にすること！！
	 * 
	 * <p>TODO Flex2フレームワークと融合してArrayCollectionのサブクラスにすべきか？その場合CS3では使えるのか？</p>
	 */
	public class Palette
	{
		protected var _colors:Array
		
		public function Palette(sourceObj:Object)
		{	
			initPalette(sourceObj)
		}
		
		/** パレットからランダムにColorSBオブジェクトを取得する */
		public function getRandom():ColorSB
		{
			return _colors[ Math.floor( Math.random()*_colors.length)]
		}
		
		/** パレットからランダムに色値を取得する */
		public function getRandomValue():uint
		{
			return getRandom().value
		}
		
		/** パレット内の色の個数 */
		public function get count():uint
		{
			return _colors.length
		}
		
		/** 
		 * ColorSBオブジェクトを格納した配列
		 */
		public function get colors():Array
		{
			return _colors.concat()
		}
		
		/*
		---------------------------------------------------------------------------
		internal use only
		---------------------------------------------------------------------------
		*/
		
		//渡されたデータ [Number, Number...] or [Color, Color...] or Bitmap or BitmapData からパレットを作成
		protected function initPalette(source:Object):void
		{
			_colors = new Array()
			
			if(source is Array){
				parseArray(source as Array)
			}else if(source is Bitmap){
				var bmd:BitmapData = Bitmap(source).bitmapData
				parseBitmapData(bmd)
			}else if(source is BitmapData){
				parseBitmapData(source as BitmapData)
			}
		}
		
		//色の値からパレットを作る
		protected function parseArray(ar:Array):void
		{
			var imax:int = ar.length
			for(var i:int=0; i<imax; i++)
			{
				var val:* = ar[i]
				if(val is ColorSB){
					_colors.push( ColorSB(val).clone() )
				}else if(val is Number){
					_colors.push( new ColorSB( val as Number))
				}
			}
		}
		
		
		//bitmapDataからパレットを作る
		protected function parseBitmapData(bmd:BitmapData):void
		{
			var xmax:int = bmd.width
			var ymax:int = bmd.height
			for(var x:uint=0; x<xmax; x++)
			{
				for(var y:uint=0; y<ymax; y++)
				{
					var value:Number = bmd.getPixel(x,y)
					_colors.push( new ColorSB(value))
				}
			}
		}
	}
}