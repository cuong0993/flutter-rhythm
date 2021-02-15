import os
import subprocess

multipliers = [
    1,
    2,
    3,
]
inkscape_default_dpi = 96

svg_default_folder = 'ios-launch-images'
root = '../ios/Runner/Assets.xcassets/LaunchImage.imageset'

file_paths = []
file_names = os.listdir(svg_default_folder)
for svg_file_name in file_names:
    file_paths.append(os.path.join(svg_default_folder, svg_file_name))

for scale in multipliers:
    for file_path in file_paths:
        png_file_path = os.path.join(root, f"LaunchImage@{scale}x" + '.png')
        if scale == 1:
            png_file_path = os.path.join(root, f"LaunchImage" + '.png')
        call_params = ["inkscape",
                       "--vacuum-defs",
                       "--export-dpi=%s" % int(scale * inkscape_default_dpi),
                       "--export-filename=%s" % png_file_path,
                       file_path]
        subprocess.check_call(call_params, stdout=subprocess.DEVNULL, stderr=subprocess.STDOUT)
