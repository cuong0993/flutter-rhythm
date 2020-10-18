import os
import subprocess
import sys

# python3 gen_images.py images/file.svg
# if file is not passed, this script will generate all files of default folder

multipliers = [
    0.75,
    1.0,
    1.5,
    2.0,
    3.0,
    4.0
]

folfers = [
    'mipmap-ldpi',
    'mipmap-mdpi',
    'mipmap-hdpi',
    'mipmap-xhdpi',
    'mipmap-xxhdpi',
    'mipmap-xxxhdpi'
]

inkscape_default_dpi = 96
texture_pack_source_root_folder = '../client/core/assets-raw'
texture_pack_file_name = 'images'
texture_pack_generated_root_folder = '../client/core/assets/images'
svg_default_folder = 'images'

if len(sys.argv) == 1:
    file_paths = []
    file_names = os.listdir(svg_default_folder)
    for svg_file_name in file_names:
        file_paths.append(os.path.join(svg_default_folder, svg_file_name))
    os.system(texture_pack_generated_root_folder)
    os.system(texture_pack_source_root_folder)
else:
    file_paths = []
    for i in range(1, len(sys.argv)):
        file_paths.append(sys.argv[i])

for index in range(len(multipliers)):
    folder = os.path.join(texture_pack_source_root_folder, str(folfers[index]))
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
    call_params = ['java',
                   '-jar',
                   'runnable-texturepacker.jar',
                   folder,
                   os.path.join(texture_pack_generated_root_folder, str(folfers[index])),
                   texture_pack_file_name,
                   'texture-packer-setting.json']
    subprocess.check_call(call_params, stdout=subprocess.DEVNULL, stderr=subprocess.STDOUT)

svg_default_folder = 'images-not-pack'
root = '../android/app/src/main/res'

file_paths = []
file_names = os.listdir(svg_default_folder)
for svg_file_name in file_names:
    file_paths.append(os.path.join(svg_default_folder, svg_file_name))

for index in range(len(multipliers)):
    folder = os.path.join(root, str(folfers[index]))
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