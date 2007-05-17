package sketchbook.display
{
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.display.Graphics;
	import flash.geom.Matrix;
	import flash.geom.Point;
	import flash.display.BitmapData;
	import flash.geom.ColorTransform;
	import sketchbook.graphics.GraphicsHelper
	import flash.events.KeyboardEvent;
	
	/**
	 * Sprite,MovieClipおよび、各種Helperに関する一般的な処理のショートカットを集約したヘルパークラス。
	 * <br/>イベントリスナやマトリックス変換等の工数軽減用です。
	 */
	public class SpriteHelper
	{
		/** Event.ADDEDに対応するコールバック */
		public var onAdded:Function
		/** Event.REMOVEDに対応するコールバック */
		public var onRemoved:Function
		/** MouseEvent.CLICKに対応するコールバック */
		public var onClick:Function
		/** MouseEvent.MOUSE_DOWNに対応するコールバック */
		public var onMouseDown:Function
		/** MouseEvent.MOUSE_UPに対応するコールバック */
		public var onMouseUp:Function
		/** 
		 * MouseEvent.MOUSE_WHEELに対応するコールバック。
		 * 関数には回転量delta:Numberが渡される。
		 **/
		public var onMouseWheel:Function
		
		
		protected var _target:Sprite
		protected var _graphicsHelper:GraphicsHelper
		
		public function SpriteHelper(sprite:Sprite):void
		{
			target = sprite
			_graphicsHelper = new GraphicsHelper(target.graphics)
		}
		
		/*
		----------------------------------------------------------------------------
		target property shortcut
		returns number prop accessor for tweener
		----------------------------------------------------------------------------
		*/
		
		public function get alpha():Number
		{
			return _target.alpha
		}
		
		public function set alpha(value:Number):void
		{
			_target.alpha = value
		}
		
		public function get x():Number
		{
			return _target.x
		}
		
		public function set x(value:Number):void
		{
			_target.x = value
		}
		
		public function get y():Number
		{
			return _target.y
		}
		
		public function set y(value:Number):void
		{
			_target.y = value
		}
		
		public function get width():Number
		{
			return _target.width
		}
		
		public function set width(value:Number):void
		{
			_target.width = value
		}
		
		public function get height():Number
		{
			return _target.height
		}
		
		public function set height(value:Number):void
		{
			_target.height = value
		}
		
		public function get scaleX():Number
		{
			return _target.scaleX 
			
		}
		
		public function set scaleX(value:Number):void
		{
			_target.scaleX = value
		}
		
		public function get scaleY():Number
		{
			return _target.scaleY 
			
		}
		
		public function set scaleY(value:Number):void
		{
			_target.scaleY = value
		}
		
		public function get rotation():Number
		{
			return _target.rotation
		}
		
		public function set rotation(value:Number):void
		{
			_target.rotation = value
		}
		
		/*
		----------------------------------------------------------------------------
		matrix shortcut
		----------------------------------------------------------------------------
		*/
		
		/** matrixへのショートカット */
		public function get matrix():Matrix
		{
			return _target.transform.matrix
		}
		
		public function set matrix(mat:Matrix):void
		{
			_target.transform.matrix = mat
		}
		
		/** matrix.translate へのショートカット */
		public function translate(dx:Number, dy:Number):void
		{
			var mat:Matrix = _target.transform.matrix
			mat.translate(dx,dy)
			_target.transform.matrix = mat
		}
		
		/** matrix.rotate へのショートカット */
		public function rotete(angle:Number):void
		{
			var mat:Matrix = _target.transform.matrix
			mat.rotate(angle)
			_target.transform.matrix = mat
		}
		
		/** matrix.scale へのショートカット */
		public function scale(sx:Number, sy:Number):void
		{
			var mat:Matrix = _target.transform.matrix
			mat.scale(sx, sy)
			_target.transform.matrix = mat
		}
		
		/** matrixへのショートカット */
		public function get concatenatedMatrix():Matrix
		{
			return _target.transform.concatenatedMatrix
		}
		
		
		/*
		----------------------------------------------------------------------------
		positioning shortcut
		----------------------------------------------------------------------------
		*/
		
		/**あるローカル座標系から、別のローカル座標系に変換する*/
		public static function localToLocal(pt:Point, fromCordinate:DisplayObject, toCordinate:DisplayObject):Point
		{
			pt = fromCordinate.localToGlobal(pt);
			pt = toCordinate.globalToLocal(pt)
			return pt
		}
		
		/** localToGlobalによるグローバル系座標のショートカット */
		public function get globalPoint():Point
		{
			var pt:Point = new Point(_target.x, _target.y)
			pt = _target.parent.localToGlobal(pt)
			return pt
		}
		
		/** ステージ上でのグローバル座標からSpriteの位置を決定する */
		public function set globalPoint(pt:Point):void
		{
			pt = _target.parent.globalToLocal(pt)
			_target.x = pt.x
			_target.y = pt.y
		}
		
		/** localToGlobalによるグローバル系座標のショートカット */
		public function get globalX():Number
		{
			return globalPoint.x
		}
		
		public function set globalX(x:Number):void
		{
			var pt:Point = new Point(x, globalY)
			globalPoint = pt
		}
		
		/** localToGlobalによるグローバル系座標のショートカット */
		public function get globalY():Number
		{
			return globalPoint.y
		}
		
		public function set globalY(y:Number):void
		{
			var pt:Point = new Point(globalX, y)
			globalPoint = pt
		}
		
		/*
		----------------------------------------------------------------------------
		graphics shortcut
		----------------------------------------------------------------------------
		*/
		
		/** graphicsオブジェクトへのショートカット */
		public function get graphics():Graphics
		{
			return _target.graphics
		}
		
		/** graphics.beginFillへのショートカット */
		public function beginFill(color:uint, alpha:Number=1.0):void
		{
			_target.graphics.beginFill(color,alpha)
		}
		
		/** graphics.clearへのショートカット */
		public function clear():void
		{
			_target.graphics.clear()
		}
		
		public function curveTo(controlX:Number, controlY:Number, anchorX:Number, anchorY:Number):void
		{
			_target.graphics.curveTo(controlX, controlY, anchorX, anchorY)
		}
		
		public function drawRect(x:Number, y:Number, width:Number, height:Number):void{
			_target.graphics.drawRect(x,y,width,height)
		}
		
		public function drawCircle(x:Number, y:Number, radius:Number):void
		{
			_target.graphics.drawCircle(x,y,radius)
		}
		
		public function drawEllipse(x:Number, y:Number, width:Number, height:Number):void
		{
			_target.graphics.drawEllipse(x,y,width,height)
		}
		
		public function drawRoundRect(x:Number,y:Number,width:Number,height:Number,ellipseWidth:Number,ellipseHeight:Number):void
		{
			_target.graphics.drawRoundRect(x,y,width,height,ellipseWidth,ellipseHeight)
		}
		
		public function drawRoundRectComplex(x:Number,y:Number,width:Number,height:Number, topLeftRadius:Number, topRightRadius:Number, bottomLeftRadius:Number, bottomRightRadius:Number):void
		{
			_target.graphics.drawRoundRectComplex(x,y,width,height,topLeftRadius,topRightRadius,bottomLeftRadius,bottomRightRadius)
		}
		
		public function endFill():void
		{
			_target.graphics.endFill()
		}
		
		public function moveTo(x:Number, y:Number):void
		{
			_target.graphics.moveTo(x,y)
		}
		
		public function lineTo(x:Number, y:Number):void
		{
			_target.graphics.lineTo(x,y)
		}
		
		public function lineStyle(thickness:Number=0,
			color:uint=0,alpha:Number=1,
			pixelHinting:Boolean=false,
			scaleMode:String = "normal",
			caps:String=null,
			joints:String=null,
			miterLimit:Number=3):void
		{
			_target.graphics.lineStyle(thickness, color, alpha, pixelHinting, scaleMode, caps, joints, miterLimit)
		}
		
		public function beginBitmapFill(bitmap:BitmapData,matrix:Matrix=null,repeat:Boolean=true,smooth:Boolean=false):void
		{
			_target.graphics.beginBitmapFill(bitmap,matrix,repeat,smooth)
		}
		
		public function beginGradientFill(type:String, color:Array, alphas:Array, ratios:Array, matrix:Matrix=null, spreadMethod:String="pad", interpolationMethod:String="rgb",focalPointRation:Number=0.0):void
		{
			_target.graphics.beginGradientFill(type, color, alphas, ratios, matrix, spreadMethod, interpolationMethod,focalPointRation)
		}
		
		public function lineGradientStyle( type:String,colors:Array,alphas:Array,ratios:Array,matrix:Matrix=null,spreadMethod:String="pad",interpolationMethod:String="rgb",focalPointRatio:Number  = 0.0):void
		{
			_target.graphics.lineGradientStyle(type,colors,alphas,ratios,matrix,spreadMethod,interpolationMethod,focalPointRatio)
		}
		
		/*
		----------------------------------------------------------------------
		graphicsHelper
		----------------------------------------------------------------------
		*/
		
		/** Spriteと関連付けられたGraphicsHelperへのショートカット */
		public function get graphicsHelpder():GraphicsHelper
		{
			return _graphicsHelper
		}
		
		/**
		 * 複数のPointを繋げて線を描く。
		 * 
		 * @param Pointオブジェクトを格納した配列
		 * @param パスを閉じるかどうかのフラグ
		 **/
		public function drawLines( points:Array, closePath:Boolean=false):void
		{
			_graphicsHelper.drawLines( points, closePath )
		}
		
		/** 4点から矩形を描く */
		public function drawQuad(x0:Number,y0:Number, x1:Number,y1:Number, x2:Number,y2:Number, x3:Number,y3:Number):void
		{
			_graphicsHelper.drawQuad(x0,y0,x1,y1,x2,y2,x3,y3)
		}
		
		/** 3点から三角形を描く */
		public function drawPolygon(x0:Number,y0:Number,x1:Number,y1:Number,x2:Number,y2:Number):void
		{
			_graphicsHelper.drawPolygon(x0,y0,x1,y1,x2,y2)
		}
		
		/**
		 *  ☆などを描く 
		 * 
		 * @param 中心のX座標
		 * @param 中心のY座標
		 * @param 外周半径
		 * @param 内周半径
		 * @param 分割数
		 */
		public function drawStar(x:Number, y:Number, outerRadius:Number, innerRadius:Number, num:Number):void
		{	
			_graphicsHelper.drawStar(x,y,outerRadius,innerRadius,num)
		}
		
		/*
		----------------------------------------------------------------------
		colorTransform
		----------------------------------------------------------------------
		*/
		
		
		/** colorTransformへのショートカット */
		public function get colorTransform():ColorTransform
		{
			return _target.transform.colorTransform
		}
		
		public function set colorTransform(colt:ColorTransform):void
		{
			_target.transform.colorTransform = colt	
		}
		
		public function get redOffset():Number{
			return _target.transform.colorTransform.redOffset
		}
		
		public function get greenOffset():Number{
			return _target.transform.colorTransform.greenOffset
		}
		
		public function get blueOffset():Number{
			return _target.transform.colorTransform.blueOffset
		}
		
		public function get redMultiplier():Number{
			return _target.transform.colorTransform.redMultiplier
		}
		
		public function get greenMultiplier():Number{
			return _target.transform.colorTransform.greenMultiplier
		}
		
		public function get blueMultiplier():Number{
			return _target.transform.colorTransform.blueMultiplier
		}
		
		/** Childrenに対してsortを行います。 */
		public function sortChildren(...args):void
		{
			throw new Error("Not yet implementd")
		}
		
		/**
		 * targetのChildrenを特定のプロパティの値でArray.sortを行います。
		 * @see Array.sort
		 */
		public function sort(fieldName:Object, options:Object=null):void
		{
			var i:int
			var ar:Array = new Array();
			for(i=0; i<_target.numChildren; i++)
				ar.push(_target.getChildAt(i));
			ar.sortOn(fieldName, options);
			
			for(i=0; i<_target.numChildren; i++)
				_target.setChildIndex(ar[i],i);
		}
		
		/*
		----------------------------------------------------------------------
		
		----------------------------------------------------------------------
		*/
		
		
		
		/** target display object that DisplayObjectHelper access */
		public function get target():Sprite
		{
			return _target
		}
		
		public function set target(sprite:Sprite):void
		{
			if(sprite == _target) return
			
			if(_target != null){
				//remove all listeners
				_target.removeEventListener(Event.ADDED, _added)
				_target.removeEventListener(Event.REMOVED, _removed)
				//MouseEvent
				_target.removeEventListener(MouseEvent.CLICK, _click)
				_target.removeEventListener(MouseEvent.DOUBLE_CLICK, _doubleClick)
				_target.removeEventListener(MouseEvent.ROLL_OVER, _rollOver)
				_target.removeEventListener(MouseEvent.ROLL_OUT,_rollOut)
				_target.removeEventListener(MouseEvent.MOUSE_DOWN, _mouseDown)
				_target.removeEventListener(MouseEvent.MOUSE_UP, _mouseUp)
				_target.removeEventListener(MouseEvent.MOUSE_WHEEL, _mouseWheel)
				_target.removeEventListener(MouseEvent.MOUSE_MOVE, _mouseMove)
				
				_target.removeEventListener(Event.ENTER_FRAME, _enterFrame)
				
				_target.stage.removeEventListener(MouseEvent.MOUSE_UP, _mouseUp)
				
				_target.stage.removeEventListener(KeyboardEvent.KEY_DOWN, _keyDown)
				_target.stage.removeEventListener(KeyboardEvent.KEY_DOWN, _keyUp)
			}
			
			_target = sprite
			
			if(_target != null){
				//ここはイベントハンドラ関数を定義した瞬間に、リスナ登録する方向に変更する予定
				
				//GeneralEvent
				_target.addEventListener(Event.ADDED, _added, false, 0, true)
				_target.addEventListener(Event.REMOVED, _removed, false, 0, true)
				
				//MouseEvent
				_target.addEventListener(MouseEvent.CLICK, _click, false, 0, true)
				
				_target.addEventListener(MouseEvent.MOUSE_DOWN, _mouseDown, false, 0, true)
				_target.addEventListener(MouseEvent.MOUSE_WHEEL, _mouseWheel, false, 0, true)
			}
		}
		
		/*
		----------------------------------------------------------------------
		event handler functions
		----------------------------------------------------------------------
		*/
		
		//store public handler functions
		private var _onKeyDownFunc:Function		
		private var _onKeyUpFunc:Function			
		private var _onEnterFrameFunc:Function		
		private var _onDoubleClickFunc:Function	
		private var _onMouseMoveFunc:Function
		private var _onRollOverFunc:Function
		private var _onRollOutFunc:Function
		
		/**
		 * キーがプレスされたときに呼ばれるイベントハンドラを定義できます。
		 * <p>イベント発行時にハンドラにはkeyCode:Numberが渡されます。</p>
		 */
		 
		public function set onKeyDown(func:Function):void
		{
			initEventHandler( func, "_onKeyDownFunc", _target.stage, KeyboardEvent.KEY_DOWN, _keyDown);
		}
		
		public function get onKeyDown():Function
		{
			return _onKeyDownFunc
		}
		
		private function _keyDown(e:KeyboardEvent):void
		{
			if(_onKeyDownFunc!=null)
				_onKeyDownFunc(e.keyCode);
		}
		
		
		/**
		 * キーがリリースされたときに呼ばれるイベントハンドラを定義できます。
		 * <p>イベント発行時にハンドラにはkeyCode:Numberが渡されます。</p>
		 */
		
		public function set onKeyUp(func:Function):void
		{
			initEventHandler( func, "_onKeyUpFunc", _target.stage, KeyboardEvent.KEY_UP, _keyUp);
		}
		
		public function get onKeyUp():Function
		{
			return _onKeyUpFunc
		}
		
		private function _keyUp(e:KeyboardEvent):void
		{
			if(_onKeyUpFunc!=null)
				_onKeyUpFunc(e.keyCode);
		}
		
		
		/**
		 * 毎フレーム呼ばれるイベントハンドラを定義できます。
		 */
		public function set onEnterFrame(func:Function):void
		{
			initEventHandler( func, "_onEnterFrameFunc", _target, Event.ENTER_FRAME, _enterFrame);
		}
		
		/** Event.ENTER_FRAMEに対応するコールバック */
		public function get onEnterFrame():Function
		{
			return _onEnterFrameFunc
		}
		
		private function _enterFrame(e:Event):void
		{
			if(onEnterFrame!=null)
				onEnterFrame()
		}
		
		
		/**
		 * ダブルクリックにに呼ばれるイベントハンドラを定義できます。
		 */
		public function set onDoubleClick(func:Function):void
		{
			_target.doubleClickEnabled = (func==null)? false : true	
			initEventHandler( func, "_onDoubleClickFunc", _target, MouseEvent.DOUBLE_CLICK, _doubleClick);
		}
		
		public function get onDoubleClick():Function
		{
			return _onDoubleClickFunc
		}
		
		private function _doubleClick(e:MouseEvent):void
		{
			if(onDoubleClick!=null)
				onDoubleClick()
		}
		
		
		/**
		 * MouseEvent.MOUSE_MOVEに対応するコールバック。
		 */
		public function set onMouseMove(func:Function):void
		{
			initEventHandler( func, "_onMouseMoveFunc", _target, MouseEvent.MOUSE_MOVE, _mouseMove);
		}
		
		/** Event.ENTER_FRAMEに対応するコールバック */
		public function get onMouseMove():Function
		{
			return _onMouseMoveFunc
		}
		
		private function _mouseMove(e:MouseEvent):void
		{
			if(onMouseMove!=null)
				onMouseMove()
		}
		
		
		/**
		 * MouseEvent.MOUSE_MOVEに対応するコールバック。
		 */
		public function set onRollOver(func:Function):void
		{
			initEventHandler( func, "_onRollOverFunc", _target, MouseEvent.ROLL_OVER, _rollOver);
		}
		
		/** Event.ENTER_FRAMEに対応するコールバック */
		public function get onRollOver():Function
		{
			return _onRollOverFunc
		}
		
		private function _rollOver(e:MouseEvent):void
		{
			if(onRollOver!=null)
				onRollOver()
		}
		
		
		/** MouseEvent.ROLL_OUTに対応するコールバック */
		public function set onRollOut(func:Function):void
		{
			initEventHandler( func, "_onRollOutFunc", _target, MouseEvent.ROLL_OUT, _rollOut);
		}
		
		public function get onRollOut():Function
		{
			return _onRollOutFunc
		}
		
		private function _rollOut(e:MouseEvent):void
		{
			if(onRollOut!=null)
				onRollOut()
		}
		
		
		//イベントハンドラ関数の設定を行うまとめ部分
		private function initEventHandler(eventHandler:Function, propName:String, eventTarget:Object, type:String, internalHandler:Function):void
		{
			if(eventHandler == this[propName])
				return
				
			eventTarget.removeEventListener(type, internalHandler);
				
			this[propName] = eventHandler
				
			if(eventHandler!=null)
				eventTarget.addEventListener(type, internalHandler, false, 0, true);
		}
		
		/*
		----------------------------------------------------------------------
		internal event handler
		----------------------------------------------------------------------
		*/
		
		private function _added(e:Event):void
		{
			if(onAdded!=null)
				onAdded()
		}
		
		
		
		private function _removed(e:Event):void
		{
			if(onRemoved!=null)
				onRemoved()
		}
		
		private function _click(e:MouseEvent):void
		{
			if(onClick!=null)
				onClick()
		}
		
		
		private function _mouseDown(e:MouseEvent):void
		{
			_target.stage.addEventListener(MouseEvent.MOUSE_UP, _mouseUp, false, 0, true)
			if(onMouseDown!=null)
				onMouseDown()
		}
		
		private function _mouseUp(e:MouseEvent):void
		{
			_target.stage.removeEventListener(MouseEvent.MOUSE_UP, _mouseUp)
			if(onMouseUp!=null)
				onMouseUp()
		}
		
		private function _mouseWheel(e:MouseEvent):void
		{
			if(onMouseWheel!=null)
				onMouseWheel(e.delta)
		}
	}
}