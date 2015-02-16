package
{
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.system.Capabilities;
	
	import so.cuo.platform.chartboost.Chartboost;
	import so.cuo.platform.chartboost.ChartboostEvent;

	public class demo extends Sprite
	{
		public var appid:String="51bdcf7616ba475450000005";
		public var sign:String="28c18ae143999b71468de4a7b50eff51ce83fac0";
		private var chartboost:Chartboost;
		public static function isIOS():Boolean {
			return Capabilities.manufacturer.indexOf("iOS") != -1;
		}
		public function demo()
		{
			super();
			
			stage.align=StageAlign.TOP_LEFT;
//			stage.scaleMode=StageScaleMode.NO_SCALE;
			initUI();
			chartboost= Chartboost.getInstance();
			if (chartboost.supportDevice)
			{
				if (isIOS()) {
					chartboost.setChartboostKeys("4f21c409cd1cb2fb7000001b", "92e2de2fd7070327bdeb54c15a5295309c6fcd2d");
				}else{
					chartboost.setChartboostKeys("4f7b433509b6025804000002", "dd2d41b69ac01b80f443f5b6cf06096d457f82bd");
				}
//				chartboost.setChartboostKeys(appid,sign);
				chartboost.addEventListener(ChartboostEvent.onInterstitialReceive, onAdReceived);
			}
		}

		private function initUI():void
		{
			stage.align=StageAlign.TOP_LEFT;
//			stage.scaleMode=StageScaleMode.NO_SCALE;
			var ui:UI=new UI(onClick);
			addChild(ui);
			ui.addButton("more app", 200, 20);
			ui.addButton("video", 20, 120);
			ui.addButton("interstitial", 200, 120);
		}

		private function onClick(label:String):void
		{
			trace("click label:",label,chartboost.isInterstitialReady(),chartboost.isMoreAppReady(),chartboost.isVideoReady());
			if(label=="more app"){
				if(chartboost.isMoreAppReady()){
					chartboost.showMoreApp();
				}else{
					chartboost.cacheMoreApp();
				}
			}
			else if(label=="video"){
				if(chartboost.isVideoReady()){
					chartboost.showVideo();
				}else{
					chartboost.cacheVideo();
				}
			}
			else if(label=="interstitial"){
				if(chartboost.isInterstitialReady()){
					chartboost.showInterstitial();
				}else{
					chartboost.cacheInterstitial();
				}
			}
		}

		protected function onAdReceived(event:ChartboostEvent):void
		{
			chartboost.showInterstitial();
		}
	}
}
