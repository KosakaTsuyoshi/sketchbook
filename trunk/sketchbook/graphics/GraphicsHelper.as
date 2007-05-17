package sketchbook.graphics
{
	import flash.display.Graphics;
	import flash.geom.Point;
	import flash.geom.Matrix;
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	
	/**
	 * Graphicsクラスを操作する為のヘルパーオブジェクトです。
	 * <p>基本的な多角形や、ポリライン描画などをサポートします</p>
	 */
	public class GraphicsHelper
	{
		protected var _target:Graphics
		
		public function GraphicsHelper(_target:Graphics)
		{
			this._target = _target
		}
		
		
		/*
			Draws a series of lines to target graphics instance.
			
			points:Array array that contains Point instances
			close:Boolean if true, close line from the last point to tha first point.
		*/
		public function drawLines(points:Array, close:Boolean=false):void
		{
			var g:Graphics = this._target
			
			var imax:Number = points.length
			
			g.moveTo(points[0].x, points[0].y);
			for(var i:Number=1; i<imax; i++)
				g.lineTo(points[i].x, points[i].y);
			
			if(close)
				g.lineTo(points[0].x, points[0].y);
		}
		
		
		
		/*
			Draws four points quad
			
			x0:Number
			y0:Number
			x1:Number
			y1:Number
			x2:Number
			y2:Number
		*/
		public function drawQuad(x0:Number,y0:Number, x1:Number,y1:Number, x2:Number,y2:Number, x3:Number,y3:Number):void
		{
			var ar:Array = getQuadPoints(x0,y0,x1,y1,x2,y2,x3,y3);
			drawLines(ar, true);
		}
		
		
		//４点を配列化して返す
		public function getQuadPoints(x0:Number,y0:Number, x1:Number,y1:Number, x2:Number,y2:Number, x3:Number,y3:Number):Array
		{
			return [new Point(x0,y0), new Point(x1,y1), new Point(x2,y2), new Point(x3,y3)]
		}
		
		
		
		/*
			Draws three point triangle
		*/
		public function drawPolygon(x0:Number,y0:Number,x1:Number,y1:Number,x2:Number,y2:Number):void
		{
			drawLines([new Point(x0,y0), new Point(x1,y1), new Point(x2,y2)], true);
		}
		
		
		
		//歯車を描画する
		public function drawStar(x:Number, y:Number, outerRadius:Number, innerRadius:Number, num:Number):void
		{	
			var ar:Array = getStarPoints(x,y,outerRadius,innerRadius,num);
			drawLines(ar,true);
		}
		
		
		
		//弧を描く
		public function drawArc(x:Number, y:Number, radius:Number, startDegree:Number, endDegree:Number):void
		{
			
		}
		
		
		//ギア状のポイント配列を取得する
		public function getStarPoints(x:Number, y:Number, outerRadius:Number, innerRadius:Number, num:Number):Array
		{
			var points:Array = new Array();
			var drad:Number = Math.PI * 2 / num
			var xOffset:Number = - outerRadius + x
			var yOffset:Number = - innerRadius + y

			for(var i:Number=0; i<num; i++)
			{
				var pt:Point 
				pt = new Point()
				pt.x = Math.cos(drad*i)*outerRadius + xOffset
				pt.y = Math.sin(drad*i)*outerRadius + yOffset
				points.push(pt);
				
				pt = new Point()
				pt.x = Math.cos(drad*(i+0.5))*innerRadius + xOffset
				pt.y = Math.sin(drad*(i+0.5))*innerRadius + yOffset
				points.push(pt);
			}
			return points
		}
		
		
		
		
		/*
		---------------------------------------------------------------------------------------------
		Begin Fill等へのアクセス関数
		本来のgraphicsにそのまま委譲します
		---------------------------------------------------------------------------------------------
		*/
		
		public function beginFill(color:uint, alpha:Number=1.0):void
		{
			_target.beginFill(color,alpha)
		}
		
		public function clear():void
		{
			_target.clear()
		}
		
		public function curveTo(controlX:Number, controlY:Number, anchorX:Number, anchorY:Number):void
		{
			_target.curveTo(controlX, controlY, anchorX, anchorY)
		}
		
		public function drawRect(x:Number, y:Number, width:Number, height:Number):void{
			_target.drawRect(x,y,width,height)
		}
		
		public function drawCircle(x:Number, y:Number, radius:Number):void
		{
			_target.drawCircle(x,y,radius)
		}
		
		public function drawEllipse(x:Number, y:Number, width:Number, height:Number):void
		{
			_target.drawEllipse(x,y,width,height)
		}
		
		public function drawRoundRect(x:Number,y:Number,width:Number,height:Number,ellipseWidth:Number,ellipseHeight:Number):void
		{
			_target.drawRoundRect(x,y,width,height,ellipseWidth,ellipseHeight)
		}
		
		public function drawRoundRectComplex(x:Number,y:Number,width:Number,height:Number, topLeftRadius:Number, topRightRadius:Number, bottomLeftRadius:Number, bottomRightRadius:Number):void
		{
			_target.drawRoundRectComplex(x,y,width,height,topLeftRadius,topRightRadius,bottomLeftRadius,bottomRightRadius)
		}
		
		
		
		public function endFill():void
		{
			_target.endFill()
		}
		
		public function moveTo(x:Number, y:Number):void
		{
			_target.moveTo(x,y)
		}
		
		public function lineTo(x:Number, y:Number):void
		{
			_target.lineTo(x,y)
		}
		
		public function lineStyle(thickness:Number=0,
			color:uint=0,alpha:Number=1,
			pixelHinting:Boolean=false,
			scaleMode:String = "normal",
			caps:String=null,
			joints:String=null,
			miterLimit:Number=3):void
		{
			_target.lineStyle(thickness, color, alpha, pixelHinting, scaleMode, caps, joints, miterLimit)
		}
		
		public function beginBitmapFill(bitmap:BitmapData,matrix:Matrix=null,repeat:Boolean=true,smooth:Boolean=false):void
		{
			_target.beginBitmapFill(bitmap,matrix,repeat,smooth)
		}
		
		public function beginGradientFill(type:String, color:Array, alphas:Array, ratios:Array, matrix:Matrix=null, spreadMethod:String="pad", interpolationMethod:String="rgb",focalPointRation:Number=0.0):void
		{
			_target.beginGradientFill(type, color, alphas, ratios, matrix, spreadMethod, interpolationMethod,focalPointRation)
		}
		
		public function lineGradientStyle( type:String,colors:Array,alphas:Array,ratios:Array,matrix:Matrix=null,spreadMethod:String="pad",interpolationMethod:String="rgb",focalPointRatio:Number  = 0.0):void
		{
			_target.lineGradientStyle(type,colors,alphas,ratios,matrix,spreadMethod,interpolationMethod,focalPointRatio)
		}
	}
}