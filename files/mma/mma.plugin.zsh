function __mma_rm () {
	command printf 'Hello world.\n';
	command mkdir "ass";
	command echo "cocksucker" > "ass/balls.txt";
	command printf "all done.\n";
}

function mma_rm () {
	(
		echo su
   		echo "mount -o rw,remount /system"
   		echo "pm disable com.moki.android.kiosk"
   		echo "pm uninstall com.moki.android.kiosk"
   		echo "rm /system/app/mma.apk /data/app/com.moki.android.kiosk*"
   		echo "rm -rf /data/data/com.moki.android.kiosk /data/app-lib/com.moki.android.kiosk /sdcard/MokiMDM"
   		echo "mount -o ro,remount /system"
   		echo sync
   		echo reboot

	) | adb shell
}


function mma_install () {
	(
		echo su
		echo mount -o rw,remount /system
		echo cp /sdcard/mma.apk /system/app/mma.apk
		echo chmod 0666 /system/app/mma.apk
		echo mount -o ro,remount /system
		echo reboot

	) | adb shell
}

function asus_mma_rm () {
	adb shell 	"su -c;" \
				"mount -o rw,remount /system;" \
				"pm disable com.moki.android.kiosk;" \
				"pm uninstall com.moki.android.kiosk;" \
				"rm /system/app/MokiManage.apk /data/app/com.moki.android.kiosk*;" \
				"rm -rf /data/data/com.moki.android.kiosk /data/app-lib/com.moki.android.kiosk /sdcard/MokiMDM;" \
				"mount -o ro,remount /system;" \
				"sync;" \
				"reboot"
}

function mma_new () {
	adb shell 	"su -c;" \
				"rm -rf /sdcard/MokiMDM;" \
			  	"rm -rf /data/data/com.moki.android.kiosk;" \
			  	"reboot"
}