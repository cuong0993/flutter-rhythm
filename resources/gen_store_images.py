import os
import subprocess
from shutil import copyfile

inkscape_default_dpi = 96

svg_default_folder = 'metadata'
root1 = '../fastlane'

file_paths = []
file_paths1 = []

for root, subdirs, files in os.walk(svg_default_folder):
    for name in files:
        if ".svg" in name:
            print(os.path.join(root, name))
            file_paths.append(os.path.join(root, name))
        if ".png" in name:
            print(os.path.join(root, name))
            if "tmp" in name:
                os.remove(os.path.join(root, name))
                print("Removed")
            else:
                file_paths1.append(os.path.join(root, name))

for file_path in file_paths:
    png_file_path = os.path.join(root1, file_path.replace("svg", "png"))
    os.makedirs(os.path.dirname(png_file_path), exist_ok=True)
    call_params = ["inkscape",
                   "--vacuum-defs",
                   "--export-dpi=%s" % inkscape_default_dpi,
                   "--export-filename=%s" % png_file_path,
                   file_path]
    subprocess.check_call(call_params, stdout=subprocess.DEVNULL, stderr=subprocess.STDOUT)
    print('Generated {0}'.format(file_path))

for file_path in file_paths1:
    file_path1 = file_path.replace(".png", "")
    png_file_path = os.path.join(root1, file_path)
    os.makedirs(os.path.dirname(png_file_path), exist_ok=True)
    text_file = open(file_path1 + ".txt")
    text = text_file.read()
    if 'phoneScreenshots' in file_path:
        subprocess.call(['sh', './localize_phone_images.sh', file_path, text])
    elif 'sevenInchScreenshots' in file_path:
        subprocess.call(['sh', './localize_tablet_images.sh', file_path, text])
    print('Localized {0}'.format(file_path))
    copyfile(file_path + ".4tmp.png", png_file_path)
