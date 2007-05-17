package sketchbook.generators
{
	import sketchbook.generators.Generator;
	
	/**
	 * 指定した周期でSine派を生成するGeneratorサブクラスです。
	 */
	public class SineGenerator extends Generator
	{
		protected var _time:Number
		
		protected var _offset:Number
		protected var _amplitude:Number
		protected var _period:Number
		
		/**
		 * 
		 * @param 波形の大きさ。4ならば±4の範囲で波が発生する。
		 * @param 波の周期。何回アップデートすれば波が繰り返すか。
		 * @param 波形の値に対するオフセット。
		 */
		public function SineGenerator(amplitude:Number, period:Number, offset:Number=0)
		{
			_time = 0
			_amplitude = amplitude
			_period = period
			_offset = offset
			updateValue()
		}
		
		public function set time(value:int):void
		{
			if(_time==value) return
			_time = value % _period
			updateValue()
		}
		
		public function get time():int
		{
			return _time
		}
		
		override public function clone():IGenerator
		{
			var sg:SineGenerator = new SineGenerator(_amplitude,_period,_offset)
			sg.time = time
			return sg
		}
		
		override protected function updateCounter():void
		{
			_time ++
			if(_time==_period)
				_time = 0
		}
		
		override protected function updateValue():void
		{
			_value = Math.sin(Math.PI * 2 * _time / _period  ) * _amplitude + _offset
		}
	}
}