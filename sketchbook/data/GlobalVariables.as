package sketchbook.data
{
	import flash.utils.Dictionary;
	
	/**
	 * as2における _global を表現したシングルトンクラス
	 * 
	 * setData, getDataでデータにアクセスできる 
	 **/
	public class GlobalVariables
	{
		private var dataDictionary:Dictionary
		private var finalDictionary:Dictionary	
		private static var _instance:GlobalVariables
		
		public function GlobalVariables()
		{
			dataDictionary = new Dictionary()
			finalDictionary = new Dictionary()
		}
		
		/** singleton */
		public static function getInstance():GlobalVariables
		{
			if(_instance==null)
				_instance = new GlobalVariables()
			return _instance
		}
		
		/**
		 * 指定IDで登録されたデータを取り出します。
		 * 
		 * @param 登録時に使ったID
		 * @return IDと対応するオブジェクト
		 */
		public function getData(id:String):*
		{
			return dataDictionary[id]
		}
		
		/**
		 * idをキーにオブジェクトを登録します。
		 * <br/>すでに存在するIDに値を登録する場合、前の値は上書きされます。
		 * 
		 * @param 登録につかうID
		 * @param 登録したい値
		 * @param 上書きをできなくするかどうかのフラグ
		 */
		public function setData(id:String, value:*, isFinal:Boolean=false):void
		{
			if( dataDictionary[id] == value ) return
			
			if(isFinal==true){
				if(finalDictionary[id]==undefined){
					dataDictionary[id] = value
					finalDictionary[id] = true
				}else{
					throw new Error("GlobalVariables.setData"+ id + " is already used as final")
				}
			}else{
				dataDictionary[id] = value
			}
		}
	}
}