import os
import subprocess

multipliers = {
    20: [1, 2, 3],
    29: [1, 2, 3],
    40: [1, 2, 3],
    60: [2, 3],
    76: [1, 2],
    83.5: [2],
    1024: [1]
}
inkscape_default_dpi = 96

svg_default_folder = 'ios-images'
root = '../ios/Runner/Assets.xcassets/AppIcon.appiconset'

for size, scales in multipliers.items():
    for scale in scales:
        png_file_path = os.path.join(root, f"Icon-App-{size}x{size}@{scale}x" + '.png')
        call_params = ["inkscape",
                       "--vacuum-defs",
                       "--export-dpi=%s" % int((size * scale) * 2),
                       "--export-filename=%s" % png_file_path,
                       os.path.join(svg_default_folder, 'ic_launcher.svg')]
        subprocess.check_call(call_params, stdout=subprocess.DEVNULL, stderr=subprocess.STDOUT)
