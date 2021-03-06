package com.view.gameWindow.tips.toolTip.icon
{
	import com.model.configData.cfgdata.EquipBaptizeSuiteCfgData;
	import com.model.consts.StringConst;
	import com.view.gameWindow.panel.panels.hero.HeroDataManager;
	import com.view.gameWindow.panel.panels.roleProperty.RoleDataManager;
	import com.view.gameWindow.panel.panels.roleProperty.cell.ConstEquipCell;
	import com.view.gameWindow.scene.entity.constants.EntityTypes;
	import com.view.gameWindow.tips.toolTip.BaseTip;
	import com.view.gameWindow.util.HtmlUtils;
	import com.view.gameWindow.util.propertyParse.CfgDataParse;
	
	import flash.text.TextField;

	public class EquipBaptizeSuiteTip extends BaseTip
	{
		public function EquipBaptizeSuiteTip()
		{
			//TODO: implement function
			super();
			_skin = new BigTextTipSkin();
			addChild(_skin);
			initView(_skin);
		}
		
		override public function setData(obj:Object):void
		{
			this._data=obj;
			width=260;
			var curCfg:EquipBaptizeSuiteCfgData = obj.cur as EquipBaptizeSuiteCfgData;
			var nextCfg:EquipBaptizeSuiteCfgData = obj.next as EquipBaptizeSuiteCfgData;
			var type:int = obj.type as int;

			var title:String=HtmlUtils.createHtmlStr(0xebe85f,StringConst.TIP_BAPTIZE_001,16);
			addProperty(title,19,10);
			maxHeight=40;
			
			initCurProp(curCfg,type);
			initNextProp(nextCfg,type);
			maxHeight+=8;
			height=maxHeight;
		}
		
		private function initNextProp(nextCfg:EquipBaptizeSuiteCfgData,type:int):void
		{
			if(nextCfg!=null)
			{
				var levelStr:String = HtmlUtils.createHtmlStr(0xb98448,StringConst.TIP_UPGRADE_004)+HtmlUtils.createHtmlStr(0xa5a5a5,nextCfg.level+"");
				addProperty(levelStr,19,maxHeight);
				maxHeight+=22;
				
				var isComple:Boolean = initDetails(nextCfg,type);
				initAttrs(nextCfg,type,isComple);
			}
		}
		
		private function initCurProp(curCfg:EquipBaptizeSuiteCfgData,type:int):void
		{
			if(curCfg!=null)
			{
				var levelStr:String = HtmlUtils.createHtmlStr(0xb98448,StringConst.TIP_UPGRADE_002)+HtmlUtils.createHtmlStr(0xecb75e,curCfg.level+"");
				addProperty(levelStr,19,maxHeight);
				maxHeight+=22;
				
				var isComple:Boolean = initDetails(curCfg,type);
				initAttrs(curCfg,type,isComple);
			}
		}
		
		private function initDetails(cfg:EquipBaptizeSuiteCfgData,type:int):Boolean
		{
			var stateStr:String ="";
			var countText:TextField = addProperty(stateStr,19,maxHeight);
			maxHeight+=22;
			
			var equipStrs:String="";
			var count:int=0;
			/**---------------------------------------------------------------------------------**/
			var wuqi:String = ConstEquipCell.getEquipName(ConstEquipCell.TYPE_WUQI);
			var wuqiState:Boolean;
			if(type==EntityTypes.ET_PLAYER)
			{
				wuqiState = getRoleEquipBaptizeState(ConstEquipCell.CP_WUQI,cfg.level);
			}else
			{
				wuqiState = getHeroEquipBaptizeState(ConstEquipCell.HP_WUQI,cfg.level);
			}
			
			if(wuqiState)
			{
				equipStrs+=HtmlUtils.createHtmlStr(0x46bb39,wuqi);
				count++;
			}else
			{
				equipStrs+=HtmlUtils.createHtmlStr(0xbfbfbf,wuqi);
			}
			equipStrs+="  ";
			/**---------------------------------------------------------------------------------**/
			
			var yifu:String = ConstEquipCell.getEquipName(ConstEquipCell.TYPE_YIFU);
			var yifuState:Boolean
			if(type==EntityTypes.ET_PLAYER)
			{
				yifuState = getRoleEquipBaptizeState(ConstEquipCell.CP_YIFU,cfg.level);
			}else
			{
				yifuState = getHeroEquipBaptizeState(ConstEquipCell.HP_YIFU,cfg.level);
			}
			
			if(yifuState)
			{
				equipStrs+=HtmlUtils.createHtmlStr(0x46bb39,yifu);
				count++;
			}else
			{
				equipStrs+=HtmlUtils.createHtmlStr(0xbfbfbf,yifu);
			}
			equipStrs+="  ";
			
			/**---------------------------------------------------------------------------------**/
			var toukui:String = ConstEquipCell.getEquipName(ConstEquipCell.TYPE_TOUKUI);
			var toukuiState:Boolean;
			if(type==EntityTypes.ET_PLAYER)
			{
				toukuiState = getRoleEquipBaptizeState(ConstEquipCell.CP_TOUKUI,cfg.level);
			}else
			{
				toukuiState = getHeroEquipBaptizeState(ConstEquipCell.HP_TOUKUI,cfg.level);
			}
			if(toukuiState)
			{
				equipStrs+=HtmlUtils.createHtmlStr(0x46bb39,toukui);
				count++;
			}else
			{
				equipStrs+=HtmlUtils.createHtmlStr(0xbfbfbf,toukui);
			}
			equipStrs+="  ";
			/**---------------------------------------------------------------------------------**/
			
			var xianglian:String = ConstEquipCell.getEquipName(ConstEquipCell.TYPE_XIANGLIAN);
			var xianglianState:Boolean;
			if(type==EntityTypes.ET_PLAYER)
			{
				xianglianState = getRoleEquipBaptizeState(ConstEquipCell.CP_XIANGLIAN,cfg.level);
			}else
			{
				xianglianState = getHeroEquipBaptizeState(ConstEquipCell.HP_XIANGLIAN,cfg.level);
			}
			if(xianglianState)
			{
				equipStrs+=HtmlUtils.createHtmlStr(0x46bb39,xianglian);
				count++;
			}else
			{
				equipStrs+=HtmlUtils.createHtmlStr(0xbfbfbf,xianglian);
			}
			equipStrs+="  ";
			
			/**---------------------------------------------------------------------------------**/
			var showzhuo:String = ConstEquipCell.getEquipName(ConstEquipCell.TYPE_SHOUZHUO);
			var showzhouState:Boolean;
			if(type==EntityTypes.ET_PLAYER)
			{
				showzhouState = getRoleEquipBaptizeState(ConstEquipCell.CP_SHOUZHUO_LEFT,cfg.level);
			}else
			{
				showzhouState = getHeroEquipBaptizeState(ConstEquipCell.HP_SHOUZHUO_LEFT,cfg.level);
			}
			
			if(showzhouState)
			{
				equipStrs+=HtmlUtils.createHtmlStr(0x46bb39,showzhuo);
				count++;
			}else
			{
				equipStrs+=HtmlUtils.createHtmlStr(0xbfbfbf,showzhuo);
			}
			equipStrs+="\n";
			
			if(type==EntityTypes.ET_PLAYER)
			{
				showzhouState = getRoleEquipBaptizeState(ConstEquipCell.CP_SHOUZHUO_RIGHT,cfg.level);
			}else
			{
				showzhouState = getHeroEquipBaptizeState(ConstEquipCell.HP_SHOUZHUO_RIGHT,cfg.level);
			}
			
			if(showzhouState)
			{
				equipStrs+=HtmlUtils.createHtmlStr(0x46bb39,showzhuo);
				count++;
			}else
			{
				equipStrs+=HtmlUtils.createHtmlStr(0xbfbfbf,showzhuo);
			}
			equipStrs+="  ";
			
			/**---------------------------------------------------------------------------------**/
			var jiezhi:String = ConstEquipCell.getEquipName(ConstEquipCell.TYPE_JIEZHI);
			var jiezhiState:Boolean;
			if(type==EntityTypes.ET_PLAYER)
			{
				jiezhiState = getRoleEquipBaptizeState(ConstEquipCell.CP_JIEZHI_LEFT,cfg.level);
			}else
			{
				jiezhiState = getHeroEquipBaptizeState(ConstEquipCell.HP_JIEZHI_LEFT,cfg.level);
			}
			
			if(jiezhiState)
			{
				equipStrs+=HtmlUtils.createHtmlStr(0x46bb39,jiezhi);
				count++;
			}else
			{
				equipStrs+=HtmlUtils.createHtmlStr(0xbfbfbf,jiezhi);
			}
			equipStrs+="  ";
			
			if(type==EntityTypes.ET_PLAYER)
			{
				jiezhiState = getRoleEquipBaptizeState(ConstEquipCell.CP_JIEZHI_RIGHT,cfg.level);
			}else
			{
				jiezhiState = getHeroEquipBaptizeState(ConstEquipCell.HP_JIEZHI_RIGHT,cfg.level);
			}
			if(jiezhiState)
			{
				equipStrs+=HtmlUtils.createHtmlStr(0x46bb39,jiezhi);
				count++;
			}else
			{
				equipStrs+=HtmlUtils.createHtmlStr(0xbfbfbf,jiezhi);
			}
			equipStrs+="  ";
			
			/**---------------------------------------------------------------------------------**/
			var yoadai:String = ConstEquipCell.getEquipName(ConstEquipCell.TYPE_YAODAI);
			var yaodaiState:Boolean;
			if(type==EntityTypes.ET_PLAYER)
			{
				yaodaiState = getRoleEquipBaptizeState(ConstEquipCell.CP_YAODAI,cfg.level);
			}else
			{
				yaodaiState = getHeroEquipBaptizeState(ConstEquipCell.HP_YAODAI,cfg.level);
			}
			if(yaodaiState)
			{
				equipStrs+=HtmlUtils.createHtmlStr(0x46bb39,yoadai);
				count++;
			}else
			{
				equipStrs+=HtmlUtils.createHtmlStr(0xbfbfbf,yoadai);
			}
			equipStrs+="  ";
			
			var xiezi:String = ConstEquipCell.getEquipName(ConstEquipCell.TYPE_XIEZI);
			var xieziState:Boolean;
			if(type==EntityTypes.ET_PLAYER)
			{
				xieziState = getRoleEquipBaptizeState(ConstEquipCell.CP_XIEZI,cfg.level);
			}else
			{
				xieziState = getHeroEquipBaptizeState(ConstEquipCell.HP_XIEZI,cfg.level);
			}
			if(xieziState)
			{
				equipStrs+=HtmlUtils.createHtmlStr(0x46bb39,xiezi);
				count++;
			}else
			{
				equipStrs+=HtmlUtils.createHtmlStr(0xbfbfbf,xiezi);
			}
			addProperty(equipStrs,19,maxHeight);
			var isComple:Boolean = count>=10;
			if(isComple)
			{
				countText.htmlText= HtmlUtils.createHtmlStr(0xb7dde8,cfg.name+"  ("+count+"/10)  ")+HtmlUtils.createHtmlStr(0x46bb39,StringConst.TIP_UPGRADE_003);
			}else
			{
				countText.htmlText= HtmlUtils.createHtmlStr(0xb7dde8,cfg.name+"  ("+count+"/10)  ")+HtmlUtils.createHtmlStr(0xbfbfbf,StringConst.TIP_UPGRADE_005);
			}
			maxHeight+=40;
			return isComple;
		}
		
		private function initAttrs(cfg:EquipBaptizeSuiteCfgData,type:int,isComple:Boolean):void
		{
			var typeName:String;
			var attrs:String;
			if(cfg.type==1)
			{
				if(type==EntityTypes.ET_PLAYER)
				{
					typeName=StringConst.ENTITY_TYPE_PLAYER;
					attrs = cfg.chr_attr;
				}else
				{
					typeName=StringConst.ENTITY_TYPE_HERO;
					attrs = cfg.hero_attr;
				}
			}else
			{
				if(type==EntityTypes.ET_PLAYER)
				{
					typeName=StringConst.ENTITY_TYPE_HERO;
					attrs = cfg.hero_attr;
				}else
				{
					typeName=StringConst.ENTITY_TYPE_PLAYER;
					attrs = cfg.chr_attr;
				}
			}
			var attrsVec:Vector.<String> = CfgDataParse.getAttStringArray(attrs);
			var props:String="";
			
			var color:Number;
			if(isComple)
			{
				color=0xecb75e;
			}else
			{
				color=0xbfbfbf;
			}
			
			for each(var att:String in attrsVec)
			{
				var attHtml:String = HtmlUtils.createHtmlStr(color,typeName+att,12,false,4);
				addProperty(attHtml,19,maxHeight);
				maxHeight+=19;
			}
			maxHeight+=10;
		}
		
		private function getRoleEquipBaptizeState(slot:int,level:int):Boolean
		{
			return RoleDataManager.instance.checkEquipBaptizeLevel(slot,level);
		}
		
		private function getHeroEquipBaptizeState(slot:int,level:int):Boolean
		{
			return HeroDataManager.instance.checkEquipBaptizeLevel(slot,level);
		}
		
	}
}