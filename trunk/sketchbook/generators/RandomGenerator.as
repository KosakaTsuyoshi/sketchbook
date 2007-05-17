package sketchbook.generators
{
	import sketchbook.generators.Generator;
	
	/**
	 * 指定範囲乱数を出力するジェネレーター
	 * <p>TODO: 将来的にメルセンヌツイスターを実装し、再現可能乱数にすること</p>
	 * <p>TODO: 引数をmin-maxから、-1～1の波を基準に、amplitudeとoffsetで定義するように変更すること</p>
	 */
	public class RandomGenerator extends Generator
	{
		public var amplitude:Number;
		public var offset:Number;
		
		public function RandomGenerator(amplitude:Number, offset:Number)
		{
			this.amplitude = amplitude
			this.offset = offset
			updateValue()
		}
		
		override public function clone():IGenerator
		{
			return new RandomGenerator(amplitude, offset)
		}
		
		override protected function updateValue():void
		{
			//ここ_differenceを作って効率化すること
			_value = (Math.random() *2-1)* amplitude + offset
		}		
	}
}