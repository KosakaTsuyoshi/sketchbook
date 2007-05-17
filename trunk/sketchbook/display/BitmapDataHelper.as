package sketchbook.display{
	import flash.display.BitmapData;
	import flash.geom.Point;
	import flash.filters.BlurFilter;
	import flash.geom.Matrix;
	import flash.display.Bitmap;
	import flash.geom.Rectangle;
	
	public class BitmapDataHelper{
		private var _target:BitmapData
		private var _capture:BitmapData
		
		public function BitmapDataHelper(bitmapData:BitmapData)
		{
			_target = bitmapData
		}
		
		
		/** 全体に対してfillRectをかけます */
		public function fill(color:uint):void
		{
			_target.fillRect(_target.rect, color);
		}
		
		
		/** */
		public function blur(blurX:Number=4, blurY:Number=4, quality:uint=1):void
		{
			var bf:BlurFilter = new BlurFilter(blurX, blurY, quality);
			_target.applyFilter(_target, _target.rect, new Point(0,0), bf);
		}
		
		
		/** 画像にモザイクをかける */
		public function mosaic(size:Number):void
		{
			var nsize:Number = 1 / size;
			
			var smallBmd:BitmapData = new BitmapData(Math.floor(_target.width*nsize),Math.floor(_target.height*nsize),true,0x000000);
			var mat:Matrix = new Matrix(nsize,0,0,nsize,0,0);
			smallBmd.draw(_target, mat, null, null, null, true);
			
			mat = new Matrix(size,0,0,size,0,0);
			_target.draw(smallBmd, mat, null, null, null, true);
			
			smallBmd.dispose()
		}
		
		
		
		
		/** 現在の画像をキャプチャーして、一時保存します。*/
		public function capture():void
		{
			_capture = _target.clone()
		}
		
		/** 最後にキャプチャーした状態に戻します */
		public function restore():void
		{
			_target.copyPixels(_capture, _capture.rect, new Point(0,0));
		}
		
		/** bitmapData.scrollにループの選択肢を加えたものです */
		public function scroll(x:Number, y:Number, loop:Boolean=false):void
		{
			if(loop==false)
			{
				_target.scroll(x,y)
			}else{
				if(x!=0)
					loopScrollX(x)
				if(y!=0)
					loopScrollY(y)
			}
		}
		
		private function loopScrollY(x:Number):void
		{
			var w:Number = Math.abs(x)
			var tempBmd:BitmapData = new BitmapData( w, _target.height, _target.transparent, 0x000000 );
			if(x<0){
				tempBmd.copyPixels(_target, new Rectangle(0,0,w,_target.height),new Point(0,0));
				_target.scroll(x,0)
				_target.copyPixels( tempBmd, new Rectangle(0,0,tempBmd.width, tempBmd.height), new Point(_target.width-w,0));
			}else{
				
			}
		}
		
		private function loopScrollX(y:Number):void
		{
			if(y<0){
				
			}else{
				
			}
		}
	}
}