package com.altras.flickrSearch.controller
{
	import com.altras.flickrSearch.events.ThumbSelectEvent;
	import com.altras.flickrSearch.model.FlickrSearchModel;
	import com.altras.flickrSearch.model.vo.FlickrThumbVO;
	import com.altras.flickrSearch.view.FlickrSelectedImageMediator;
	import com.altras.flickrSearch.view.components.FlickrSelectedImage;
	
	import mx.managers.PopUpManager;
	
	import org.robotlegs.mvcs.Command;

	public class ThumbSelectCommand extends Command
	{
		[Inject]
		public var thumbSelectEvent:ThumbSelectEvent;
		[Inject]
		public var model:FlickrSearchModel;
		
		override public function execute():void{
			trace("ThumbSelectCommand executed" + thumbSelectEvent._data.title);
			
			model.selectedThumb = thumbSelectEvent._data as FlickrThumbVO;
			
<<<<<<< HEAD
			//var selectedImage:FlickrSelectedImage = PopUpManager.createPopUp(contextView,FlickrSelectedImage, true)
			//	as FlickrSelectedImage;
			var selectedImage:FlickrSelectedImage  = new FlickrSelectedImage();
			//selectedImage.bigImage.source = model.selectedThumb.bigImageSrc;
			PopUpManager.addPopUp(selectedImage, contextView, true);
=======
			var selectedImage:FlickrSelectedImage = PopUpManager.createPopUp(contextView,FlickrSelectedImage, true)
				as FlickrSelectedImage;
			
>>>>>>> 8e9f6e7b2507b468fa1d8e38c790824e7f2547e0
			
			mediatorMap.createMediator(selectedImage);
			PopUpManager.centerPopUp(selectedImage);
			
		}
		
	}
}