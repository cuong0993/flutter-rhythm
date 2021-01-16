import os
import subprocess

multipliers = [
    0.75,
    1.0,
    1.5,
    2.0,
    3.0,
    4.0
]
folders = [
    "mipmap-ldpi",
    "mipmap-mdpi",
    "mipmap-hdpi",
    "mipmap-xhdpi",
    "mipmap-xxhdpi",
    "mipmap-xxxhdpi"
]
inkscape_default_dpi = 96

svg_default_folder = 'android-images'
root = '../android/app/src/main/res'

file_paths = []
file_names = os.listdir(svg_default_folder)
for svg_file_name in file_names:
    file_paths.append(os.path.join(svg_default_folder, svg_file_name))

for index in range(len(multipliers)):
    folder = os.path.join(root, folders[index])
    os.makedirs(folder, exist_ok=True)

    dpi = int(inkscape_default_dpi * multipliers[index])
    print('Generating assets for', folder)
    for file_path in file_paths:
        svg_file_name_with_ext = os.path.basename(file_path)
        svg_file_name, svg_file_ext = os.path.splitext(svg_file_name_with_ext)
        png_file_path = os.path.join(folder, svg_file_name + '.png')
        call_params = ["inkscape",
                       "--vacuum-defs",
                       "--export-dpi=%s" % dpi,
                       "--export-filename=%s" % png_file_path,
                       file_path]
        subprocess.check_call(call_params, stdout=subprocess.DEVNULL, stderr=subprocess.STDOUT)
