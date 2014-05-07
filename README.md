introduce

this is flash air ane lib  for chartboost ad , ios and android full function  support

include Interstitial ad and MoreAppPage 

======================================

project home:https://code.google.com/p/chartboost-sdk/

chartboost site: http://chartboost.com

reqiered :

air sdk 4.0 or later

ane is build base on Chartboost SDK ios 4.0.0 ,android 4.0.0

---------
usage:

1. add chartboost.ane to your flex air project

2.  add ane id in your xxx-app.xml 

 <extensionID>so.cuo.ane.Chartboost</extensionID>
 
for android, need add

WRITE_EXTERNAL_STORAGE,

INTERNET,

ACCESS_WIFI_STATE,

ACCESS_NETWORK_STATE 

permission

3. add code 
	Chartboost.getInstance().setInterstitialKeys("4f7b433509b602538043000002", "dd2d41b69ac01b80f44443f5b6cf06096d457f82bd");// app id and sign id created in
chartboost.com site

//	then show chartboost Interstitial
	Chartboost.getInstance().showInterstitial(); 
//        or show chartboost more app page
	Chartboost.getInstance().showMoreApp();
	
4. for more usage, see the demo project code


description:

this lib is very easy to use ,just need one or two line code,

and it is full function ,chartboost Interstitial ad and more app page is support ,and all event is support

it work well on android and ios (ipad,iphone,ipad) air device,not support pc or web flash app


