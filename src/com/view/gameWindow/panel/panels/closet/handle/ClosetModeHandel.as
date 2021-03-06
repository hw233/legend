package com.view.gameWindow.panel.panels.closet.handle
{
	import com.model.business.fileService.constants.ResourcePathConstants;
	import com.model.configData.cfgdata.EquipCfgData;
	import com.model.consts.SexConst;
	import com.view.gameWindow.panel.panels.closet.ClosetData;
	import com.view.gameWindow.panel.panels.closet.ClosetDataManager;
	import com.view.gameWindow.panel.panels.hero.tab1.EntityModeInUIlHandle;
	import com.view.gameWindow.panel.panels.roleProperty.RoleDataManager;
	import com.view.gameWindow.panel.panels.roleProperty.cell.ConstEquipCell;
	import com.view.gameWindow.scene.entity.constants.ActionTypes;
	import com.view.gameWindow.scene.entity.model.EntityModelsManager;
	import com.view.gameWindow.scene.entity.model.base.EntityModel;
	import com.view.gameWindow.scene.entity.model.imageItem.ImageItem;
	import com.view.gameWindow.scene.entity.model.utils.EntityModelUtil;
	import com.view.gameWindow.util.UIEffectLoader;
	
	import flash.display.MovieClip;
	
	/**
	 * 衣橱模型处理类
	 * @author Administrator
	 */	
	public class ClosetModeHandel extends EntityModeInUIlHandle
	{
		private var _layer:MovieClip;
		private var _uiEffectLoader:UIEffectLoader;
		private var _type:int;
		
		public function ClosetModeHandel(layer:MovieClip)
		{
			_layer = layer;
			_layer.mouseEnabled = false;
			_layer.mouseChildren = false;
			_uiEffectLoader = new UIEffectLoader(_layer,0,0);
			super(layer);
		}
		
		override public function changeModel():void
		{
			if(_uiEffectLoader)
			{
				_uiEffectLoader.destroy();
				_uiEffectLoader = null;
			}
			EntityModelsManager.getInstance().unUseModel(_entityModel);
			_entityModel = null;
			if(_viewBitmap && _viewBitmap.bitmapData)
			{
				_viewBitmap.bitmapData = null;
			}
			reset();
			//
			var currentClosetData:ClosetData = ClosetDataManager.instance.currentClosetData();
			var equipCfgData:EquipCfgData = currentClosetData ? currentClosetData.equipCfgData() : null;
			if(equipCfgData)
			{
				_type = equipCfgData.type;
				switch(equipCfgData.type)
				{
					case ConstEquipCell.TYPE_HUANWU:
					case ConstEquipCell.TYPE_DOULI:
						dealSWFMode(equipCfgData);
						break;
					case ConstEquipCell.TYPE_SHIZHUANG:
						shizhuangPaths(equipCfgData);
						break;
					case ConstEquipCell.TYPE_CHIBANG:
						chibangPaths(equipCfgData);
						break;
					case ConstEquipCell.TYPE_ZUJI:
						zujiPaths(equipCfgData);
						break;
					default:
						break;
				}
			}
		}
		
		private function dealSWFMode(equipCfgData:EquipCfgData):void
		{
			var chestUrl:String = "chest/"+equipCfgData.chest_url+".swf";
			_uiEffectLoader = new UIEffectLoader(_layer,0,0,1,1,chestUrl);
		}
		
		private function shizhuangPaths(equipCfgData:EquipCfgData):void
		{
			isInit = false;
			var oldEntityModel:EntityModel = _entityModel;
			_entityModel = EntityModelUtil.getEntityModel(0, equipCfgData.id, 0, 0, 0, 0, 0, RoleDataManager.instance.sex, ActionTypes.NOACTION, EntityModel.N_DIRECTION_8);
			EntityModelsManager.getInstance().unUseModel(oldEntityModel);
		}
		
		private function chibangPaths(equipCfgData:EquipCfgData):void
		{
			isInit = false;
			var currentClosetData:ClosetData = ClosetDataManager.instance.currentClosetData();
			var equipCfgDataId:int = currentClosetData.equipCfgId()
			var clothPath:String = "";
			var sex:int,_cloth:int,_weapon:int;
			sex = RoleDataManager.instance.sex;
			if (sex == SexConst.TYPE_MALE)
			{
				clothPath = equipCfgData.male_large_wing + "/";
			}
			else if (sex == SexConst.TYPE_FEMALE)
			{
				clothPath = equipCfgData.female_large_wing + "/";
			}
			clothPath = ResourcePathConstants.ENTITY_RES_PLAYER_LOAD + clothPath;
			var oldEntityModel:EntityModel = _entityModel;
			_entityModel = EntityModelsManager.getInstance().getAndUseEntityModel(clothPath, "", "", "", "", "", "", "", EntityModel.N_DIRECTION_8);
			EntityModelsManager.getInstance().unUseModel(oldEntityModel);
		}
		
		private function zujiPaths(equipCfgData:EquipCfgData):void
		{
			
		}
		
		override protected function updatePostion(imageItem:ImageItem):void
		{
			var offestY:int = _type == ConstEquipCell.TYPE_SHIZHUANG ? 50 : (_type == ConstEquipCell.TYPE_CHIBANG ? 100 : 0);
			_viewBitmap.x = -_entityModel.width/2 + imageItem.offsetX;
			_viewBitmap.y = -_entityModel.height + _entityModel.shadowOffset + imageItem.offsetY + offestY;
		}
		
		override public function destroy():void
		{
			if(_uiEffectLoader)
			{
				_uiEffectLoader.destroy();
				_uiEffectLoader = null;
			}
			_layer = null;
			super.destroy();
		}
	}
}