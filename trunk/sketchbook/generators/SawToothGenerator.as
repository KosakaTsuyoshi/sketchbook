package sketchbook.generators
{
	/**
	 * ノコギリ波を生成するジェネレーター 
	 */
	public class SawToothGenerator extends SineGenerator
	{
		public function SawToothGenerator(amplitude:Number, period:Number, offset:Number=0)
		{
			super(amplitude, period, offset)
		}
		
		
		override public function clone():IGenerator
		{
			var sg:SawToothGenerator = new SawToothGenerator(_amplitude,_period,_offset)
			sg.time = time
			return sg
		}
		
		override protected function updateValue():void
		{
			trace("SawToothGenerator.updateValue is not tested yet")
			var ratio:Number = _period / time
			var val:Number
			
			if(ratio<0.5){
				val = 2 * ratio
			}else{
				val = 2 * (ratio - 1)
			}
			
			_value = val * _amplitude + _offset
		}
	}
}