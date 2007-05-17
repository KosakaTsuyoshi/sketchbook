package sketchbook.generators
{
	import sketchbook.generators.Generator;
	
	/**
	 * 指定した範囲で整数の乱数を返すGeneratorです。
	 * 
	 * <p>TODO: 引数をmin-maxから、-1～1の波を基準に、amplitudeとoffsetで定義するように変更すること</p>
	 * 
	 * @example <listing version="3.0">
	 * var generator:IGenerator = new RandomIntGenerator(0,100);
	 * trace(generator.value);
	 * trace(generator.update());
	 * trace(generator.value);</listing>
	*/
	public class RandomIntGenerator extends Generator
	{
		public var min:int
		public var max:int
		
		public function RandomIntGenerator(min:int, max:int)
		{
			this.min = min
			this.max = max
			
			updateValue()
		}
		
		override public function clone():IGenerator
		{
			return new RandomIntGenerator(min, max)
		}
		
		override protected function updateValue():void
		{
			_value = min + Math.floor(Math.random()*(max+1-min) )
		}
	}
}