import os
import subprocess

inkscape_default_dpi = 96
texture_pack_source_root_folder = '../storage/images'
svg_default_folder = 'images-instrument'

file_paths = []
file_names = os.listdir(svg_default_folder)
for svg_file_name in file_names:
    file_paths.append(os.path.join(svg_default_folder, svg_file_name))
os.system(texture_pack_source_root_folder)

folder = texture_pack_source_root_folder
os.makedirs(folder, exist_ok=True)
dpi = inkscape_default_dpi
print('Generating assets for', folder)
for file_path in file_paths:
    svg_file_name_with_ext = os.path.basename(file_path)
    svg_file_name, svg_file_ext = os.path.splitext(svg_file_name_with_ext)
    png_file_path = os.path.join(folder, svg_file_name + '.jpg')
    call_params = ["inkscape",
                   "--vacuum-defs",
                   "--export-dpi=%s" % dpi,
                   "--export-filename=%s" % png_file_path,
                   file_path]
    subprocess.check_call(call_params, stdout=subprocess.DEVNULL, stderr=subprocess.STDOUT)
