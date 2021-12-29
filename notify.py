# python -m pip install win10toast
from win10toast import ToastNotifier
import os
# One-time initialization
toaster = ToastNotifier()
text = "_____________\n"
if os.path.isfile("notify.txt"):
    with open("notify.txt","r") as noti_file:
        while(line := noti_file.readline().rstrip()):
            text += line
    # Show notification whenever needed
    toaster.show_toast("Price Alert!", text, threaded=True,
                    icon_path=None, duration=10)  # 3 seconds

# To check if any notifications are active,
# use `toaster.notification_active()`
import time
while toaster.notification_active():
    time.sleep(0.1)
