package pl.mateuszmackowiak.nativeANE.properties
{
	import flash.events.Event;
	import flash.events.StatusEvent;
	import flash.external.ExtensionContext;
	import flash.system.Capabilities;
	import flash.utils.Dictionary;

	public class SystemProperties
	{
		/**
		 * IOS Android
		 */
		public static const OS:String = 'os';
		/**
		 * Android
		 */
		public static const LANGUAGE:String = 'language';
		/**
		 * Android
		 */
		public static const ARCHITECTURE:String = 'arch';
		/**
		 * IOS Android
		 */
		public static const VERSION:String = 'version';
		/**
		 * Android
		 */
		public static const PACKAGE_NAME:String = 'packageName';
		/**
		 * Android
		 */
		public static const PACKAGE_DIRECTORY:String = 'sourceDir';
		/**
		 * Android
		 */
		public static const APP_UID:String = 'AppUid';
		/**
		 * IOS Android
		 */
		public static const UID:String = 'UID';
		
		public static function getProperites():Dictionary
		{
			try{
				var context:ExtensionContext = ExtensionContext.createExtensionContext('pl.mateuszmackowiak.nativeANE.NativeAlert','SystemProperites');
				const d:Dictionary = context.call('getSystemProperty') as Dictionary;
				context.dispose();
				return d;
			}catch(e:Error){
				trace(e.message);
				if(context!=null)
					context.dispose();
			}
			return null;
		}
		

		public static function isSupported():Boolean{
			if(Capabilities.os.indexOf("Linux")>-1 || Capabilities.os.indexOf("iPhone")>-1)
				return true;
			else
				return false;
		}
	}
}