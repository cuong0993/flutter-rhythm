import os
import subprocess

multipliers = {
    16: [1],
    32: [1],
    64: [1],
    128: [2],
    256: [1],
    512: [1],
    1024: [1]
}
inkscape_default_dpi = 96

svg_default_folder = 'ios-images'
root = '../macos/Runner/Assets.xcassets/AppIcon.appiconset'

for size, scales in multipliers.items():
    for scale in scales:
        png_file_path = os.path.join(root, f"app_icon_{size}" + '.png')
        call_params = ["inkscape",
                       "--vacuum-defs",
                       "--export-dpi=%s" % int(size * 2),
                       "--export-filename=%s" % png_file_path,
                       os.path.join(svg_default_folder, 'ic_launcher.svg')]
        subprocess.check_call(call_params, stdout=subprocess.DEVNULL, stderr=subprocess.STDOUT)
