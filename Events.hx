package;


import lime.system.CFFI;
import lime.system.JNI;


class Events {
	
	
	public static function sampleMethod (inputValue:Int):Int {
		
		#if android
		
		var resultJNI = events_sample_method_jni(inputValue);
		var resultNative = events_sample_method(inputValue);
		
		if (resultJNI != resultNative) {
			
			throw "Fuzzy math!";
			
		}
		
		return resultNative;
		
		#else
		
		return events_sample_method(inputValue);
		
		#end
		
	}
	
	
	private static var events_sample_method = CFFI.load ("events", "events_sample_method", 1);
	
	#if android
	private static var events_sample_method_jni = JNI.createStaticMethod ("org.haxe.extension.Events", "sampleMethod", "(I)I");
	#end
	
	
}