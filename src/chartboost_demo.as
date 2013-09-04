package
{

	import flash.display.Graphics;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.text.TextField;

	import so.cuo.ane.chartboost.AirChartboost;
	import so.cuo.ane.chartboost.AirChartboostEvent;

//for android rememer add   WRITE_EXTERNAL_STORAGE,INTERNET,ACCESS_WIFI_STATE,ACCESS_NETWORK_STATE
	public class chartboost_demo extends Sprite
	{
		private var ad:TextField=new TextField();
		private var moreApp:TextField=new TextField();

		public function chartboost_demo()
		{
			super();

			var g:Graphics=this.graphics;
			g.beginFill(0x00ff00);
			g.drawCircle(100, 100, 100);
			g.endFill();
			ad.text="show ad";
			this.addChild(ad);
			moreApp.text="more app";
			moreApp.x=100;
			moreApp.y=100;
			this.addChild(moreApp);
			ad.addEventListener(MouseEvent.CLICK, onClick);
			moreApp.addEventListener(MouseEvent.CLICK, onClickShowMoreApp);
			initChartBoost();
		}


		/**create and init chartboost，**/
		private function initChartBoost():void
		{
			//chartboost android test
			var appId:String="4f7b433509b6025804000002";
			var appSignature:String="dd2d41b69ac01b80f443f5b6cf06096d457f82bd";
			//chartboost ios test
			//var appId:String="4f21c409cd1cb2fb7000001b";
			//var appSignature:String="92e2de2fd7070327bdeb54c15a5295309c6fcd2d";
			if (AirChartboost.getInstance().isChartboostSupported)
			{
				AirChartboost.getInstance().addEventListener(AirChartboostEvent.DID_CACHE_INTERSTITIAL, onChartEvent);
				AirChartboost.getInstance().addEventListener(AirChartboostEvent.DID_CLICK_INTERSTITIAL, onChartEvent);
				AirChartboost.getInstance().addEventListener(AirChartboostEvent.DID_CLOSE_INTERSTITIAL, onChartEvent);
				AirChartboost.getInstance().addEventListener(AirChartboostEvent.DID_DISMISS_INTERSTITIAL, onChartEvent);
				AirChartboost.getInstance().addEventListener(AirChartboostEvent.DID_FAIL_TO_LOAD_INTERSTITIAL, onChartEvent);
				AirChartboost.getInstance().addEventListener(AirChartboostEvent.DidCacheMoreApps, onChartEvent);
				AirChartboost.getInstance().addEventListener(AirChartboostEvent.DidFailToLoadMoreApps, onChartEvent);
				AirChartboost.getInstance().startSession(appId, appSignature);
				AirChartboost.getInstance().cacheInterstitial();
				AirChartboost.getInstance().cachedMoreAppPage();
			}
		}

		protected function onClick(event:MouseEvent):void
		{
			trace("click show ad");
			if (AirChartboost.getInstance().isChartboostSupported)
			{
				AirChartboost.getInstance().showInterstitial(); //show a Interstitial ad
			}
		}

		protected function onClickShowMoreApp(event:MouseEvent):void
		{
			trace("click show more app");
			AirChartboost.getInstance().showMoreAppPage();
		}

		protected function onChartEvent(event:AirChartboostEvent):void
		{
			trace(event.type, "chartboost ane event");
			if (event.type == AirChartboostEvent.DID_CACHE_INTERSTITIAL)
			{
				AirChartboost.getInstance().showInterstitial();
			}
		}
	}
}
