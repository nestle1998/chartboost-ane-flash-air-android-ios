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
		
		private var chartboost:Chartboost;
		public static function isIOS():Boolean {
			return Capabilities.manufacturer.indexOf("iOS") != -1;
		}
		public function demo()
		{
			super();
			
			stage.align=StageAlign.TOP_LEFT;
			initUI();
			chartboost= Chartboost.getInstance();
			if (chartboost.supportDevice)
			{
				if (isIOS()) {
					chartboost.setChartboostKeys("your  appid ", "your  app  sign");
				}else{
					chartboost.setChartboostKeys("appid ", "app sign");
				}
				chartboost.addEventListener(ChartboostEvent.onInterstitialReceive, onAdReceived);
			}
		}
		
		private function initUI():void
		{
			stage.align=StageAlign.TOP_LEFT;
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
