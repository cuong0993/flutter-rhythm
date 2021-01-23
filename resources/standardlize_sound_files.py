import os
import subprocess
os.environ["QT_QPA_PLATFORM"] = "offscreen"
for root, subdirs, files in os.walk('../storage/songs'):
    for name in files:
        if ".mid" in name:
            file_path = os.path.join(root, name)
            print(file_path)
            call_params = ["mscore3",
                           "-o%s" % file_path,
                           file_path]
            subprocess.check_output(call_params)
