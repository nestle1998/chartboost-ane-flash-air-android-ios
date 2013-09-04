introduce

flash air ane lib  for chartboost ad , ios and android full function  support include Interstitial ad and MoreAppPage 
================
reqiered :

air sdk 3.5 or later

ane is build base on Chartboost SDK ios 3.2.1 ,android 3.1.5

---------
usage:

1. add chartboost.ane to your flex air project

2.  add ane id in your xxx-app.xml  
<extensionID>so.cuo.ane.Chartboost</extensionID>
 
for android, need add 
WRITE_EXTERNAL_STORAGE,INTERNET,ACCESS_WIFI_STATE,ACCESS_NETWORK_STATE 
3. add code 
	
// app id and sign id created in chartboost.com site

AirChartboost.getInstance().startSession("4f7b433509b602538043000002", "dd2d41b69ac01b80f44443f5b6cf06096d457f82bd");
//then show chartboost Interstitial
	
AirChartboost.getInstance().showInterstitial(); 

//or show chartboost more app page
	
AirChartboost.getInstance().showMoreAppPage();

4.for more usage, see the demo project code



---------description:

this lib is very easy to use ,just need one or two line code,

and it is full function ,chartboost Interstitial ad and more app page is support ,
and all event is support 
it work well on android and ios (ipad,iphone,ipad) air device,
not support pc or web flash app

this lib is develped by cuo(www.cuo.so/),
 used some code of FreshPlanet.com ,and thanks  FreshPlanet
for 
more info about chartboost ref to http://chartboost.com
