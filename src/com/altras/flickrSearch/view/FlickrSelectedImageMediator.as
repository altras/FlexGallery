package com.altras.flickrSearch.view
{
	import com.altras.flickrSearch.model.FlickrSearchModel;
	import com.altras.flickrSearch.view.components.FlickrSelectedImage;
	
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.net.URLRequest;
	import flash.net.navigateToURL;
	
	import mx.controls.Image;
	import mx.events.CloseEvent;
	import mx.managers.PopUpManager;
	
	import org.robotlegs.mvcs.Mediator;
	import org.swiftsuspenders.Injector;
	import org.swiftsuspenders.injectionresults.InjectValueResult;
	
	public class FlickrSelectedImageMediator extends Mediator
	{
		[Inject]
		public var view:FlickrSelectedImage;
		[Inject]
		public var model:FlickrSearchModel;
		
		private var _loaded:Boolean = false;
		
<<<<<<< HEAD
		override public function onRegister():void
		{
			trace("FlickrSelectedImageMediator onRegister");
			view.title = "Loading Image";
			
=======
		
		
		override public function onRegister():void
		{
			trace("FlickrSelectedImageMediator onRegister");
			view.isPopUp = true;
			view.title = "Loading Image";
>>>>>>> 8e9f6e7b2507b468fa1d8e38c790824e7f2547e0
			view.bigImage.source = model.selectedThumb.bigImageSrc;
	
			eventMap.mapListener(view.clickButton,MouseEvent.CLICK,onLinkClick,MouseEvent);
			eventMap.mapListener(view,CloseEvent.CLOSE,onClose,CloseEvent);
			eventMap.mapListener(view.bigImage,Event.COMPLETE,onImageLoadComplete,Event);
		}
		
		private function onLinkClick(event:MouseEvent):void
		{
			navigateToURL(new URLRequest(model.selectedThumb.link),'_blank');
		}
		
		private function onImageLoadComplete(event:Event):void
		{
			view.title = model.selectedThumb.title;
			view.imgLoader.includeInLayout=view.imgLoader.visible=false;
			view.bigImage.includeInLayout=view.clickButton.includeInLayout=false;
			view.bigImage.percentHeight = view.bigImage.percentWidth = 100;
			view.percentWidth= view.percentHeight = 100;
			
			PopUpManager.centerPopUp(view);
			view.showEffect.play();
			
			_loaded=true;
		}
		
		private function onClose(event:CloseEvent):void {
			if(!_loaded) {
				view.bigImage.source = null;
			
			}
			
			PopUpManager.removePopUp(view);
			mediatorMap.removeMediator(this);
		}
	}
}