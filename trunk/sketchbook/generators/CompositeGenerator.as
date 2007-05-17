package sketchbook.generators
{
	import mx.events.IndexChangedEvent;
	
	/**
	 * 複数の波形を合成した波を返すGenerator
	 * <p>複数のGeneratorを配列形式で渡し、その合成値を返すGeneratorになります。</p>
	 * <p>クローンや更新の方法を色々考えること！</p>
	 */
	public class CompositeGenerator extends Generator
	{
		public var amplitude:Number
		public var offset:Number
		protected var _generators:Array
		
		public function CompositeGenerator(generators:Array, amplitude:Number=1, offset:Number=0)
		{
			this.amplitude = amplitude
			this.offset = offset
			
			_generators = new Array();
			
			var imax:int = generators.length
			for(var i:int=0; i<imax; i++)
				_generators.push( IGenerator(generators.shift()).clone() )
			
			updateValue();
		}
		
		
		override public function clone():IGenerator
		{
			return new CompositeGenerator(_generators,amplitude,offset);
		}
		
		
		override protected function updateCounter():void
		{
			var imax:int = _generators.length
			for(var i:int=0; i<imax; i++)
				IGenerator(_generators[i]).update()
		}
		
		override protected function updateValue():void
		{
			_value = 0
			var imax:int = _generators.length
			for(var i:int=0; i<imax; i++)
				_value += IGenerator(_generators[i]).value
				
			_value = offset + _value * amplitude
		}
	}
}