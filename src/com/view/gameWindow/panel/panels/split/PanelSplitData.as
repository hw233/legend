package com.view.gameWindow.panel.panels.split
{
	/**
	 * 拆分道具数据类
	 * @author Administrator
	 */	
	public class PanelSplitData
	{
		private static var _storage:int = -1;
		private static var _slot:int = -1;
		private static var _id:int = -1;
		private static var _type:int = -1;
		private static var _cout:int = -1;
		
		public function PanelSplitData()
		{
		}

		public static function get id():int
		{
			var _id2:int = _id;
			_id = -1;
			return _id2;
		}

		public static function set id(value:int):void
		{
			_id = value;
		}

		public static function get type():int
		{
			var _type2:int = _type;
			_type = -1
			return _type2;
		}

		public static function set type(value:int):void
		{
			_type = value;
		}

		public static function get cout():int
		{
			var _cout2:int = _cout;
			_cout = -1;
			return _cout2;
		}

		public static function set cout(value:int):void
		{
			_cout = value;
		}

		public static function get slot():int
		{
			var _slot2:int = _slot;
			_slot = -1;
			return _slot2;
		}

		public static function set slot(value:int):void
		{
			_slot = value;
		}

		public static function get storage():int
		{
			var _storage2:int = _storage;
			_storage = -1;
			return _storage2;
		}

		public static function set storage(value:int):void
		{
			_storage = value;
		}


	}
}