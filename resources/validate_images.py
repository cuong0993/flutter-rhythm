import os

from util import grep

used_textures = list(map(lambda x: x.replace('\'', '').replace('.png', ''),
                         sorted(grep("img_.*\'", "../lib", '.dart'))))
texture_files = list(map(lambda x: x.replace('.svg', ''),
                         sorted(os.listdir('images'))))
diff = [item for item in texture_files if item not in used_textures] + [item for item in used_textures if
                                                                        item not in texture_files]
if len(diff) != 0:
    raise Exception(diff)
