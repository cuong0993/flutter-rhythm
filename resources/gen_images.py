import os
import shutil
import subprocess
import sys

# python3 gen_images.py images/file.svg
# if file is not passed, this script will generate all files of default folder

multipliers = [
    1.0,
    1.5,
    2.0,
    3.0,
    4.0
]

folfers = [
    '',
    '1.5x',
    '2.0x',
    '3.0x',
    '4.0x'
]

inkscape_default_dpi = 96
root_folder = '../assets/images/'
svg_default_folder = 'images'

if len(sys.argv) == 1:
    file_paths = []
    file_names = os.listdir(svg_default_folder)
    for svg_file_name in file_names:
        file_paths.append(os.path.join(svg_default_folder, svg_file_name))
    shutil.rmtree(root_folder)
else:
    file_paths = []
    for i in range(1, len(sys.argv)):
        file_paths.append(sys.argv[i])

for index in range(len(multipliers)):
    folder = os.path.join(root_folder, str(folfers[index]))
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
