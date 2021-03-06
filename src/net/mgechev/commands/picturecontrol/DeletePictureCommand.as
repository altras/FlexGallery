package net.mgechev.commands.picturecontrol
{
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	
	import mx.controls.Alert;
	import mx.core.UIComponent;
	import mx.rpc.IResponder;
	
	import net.mgechev.business.DelegatesQueue;
	import net.mgechev.business.picturecontrol.DeletePictureDelegate;
	import net.mgechev.events.picturecontrol.DeletePictureEvent;
	import net.mgechev.model.ViewModelLocator;
	
	public class DeletePictureCommand implements ICommand, IResponder
	{
		public var modelLocator:ViewModelLocator = ViewModelLocator.getInstance();
		
		private var delegate:DeletePictureDelegate;
		private var delegatesQueue:DelegatesQueue = DelegatesQueue.instance;
		
		public function execute(event:CairngormEvent):void
		{
			var deletePictureEvent:DeletePictureEvent = event as DeletePictureEvent;
			delegate = new DeletePictureDelegate(this, deletePictureEvent.pictureName);
			
			delegatesQueue.registerDelegate(delegate);
		}
		
		public function result(event:Object):void
		{
			delegatesQueue.unregisterDelegate(delegate);
		}
		
		public function fault(event:Object):void
		{
			delegatesQueue.unregisterDelegate(delegate);
		}
	}
}