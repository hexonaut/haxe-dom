package hxdom;

#if js
typedef StorageInfo = js.html.StorageInfo;
#else
class StorageInfo {
	
	public static inline var PERSISTENT : Int = 1;

	public static inline var TEMPORARY : Int = 0;

	public function queryUsageAndQuota( storageType : Int, ?usageCallback : StorageInfoUsageCallback, ?errorCallback : StorageInfoErrorCallback ) : Void {
		
	}

	public function requestQuota( storageType : Int, newQuotaInBytes : Int, ?quotaCallback : StorageInfoQuotaCallback, ?errorCallback : StorageInfoErrorCallback ) : Void {
		
	}
	
}
#end