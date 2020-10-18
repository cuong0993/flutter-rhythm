import colorsys
import operator

from pip._vendor.msgpack.fallback import xrange

from util import grep


def get_hls(rgb):
    rgb = rgb.lstrip("#")  # in case you have Web color specs
    r, g, b = (int(rgb[i:i + 2], 16) / 255.0 for i in xrange(0, 5, 2))
    return colorsys.rgb_to_hls(r, g, b)


used_by_image_colors_raw = grep("fill=\"#.*?\"", "./images", '.svg') | grep("fill=\"#.*?\"", "./android-mipmap", '.svg')
hls_colors = dict()
for item in used_by_image_colors_raw:
    color = item.replace('fill=\"#', '').replace('"', '')
    hls = get_hls(color)
    hls_colors[color] = hls[0]
sorted_d = sorted(hls_colors.items(), key=operator.itemgetter(1))
for i in sorted_d:
    print('val var_' + str(i[0]) + '= Color.valueOf("#' + str(i[0]) + '") // ' + str(i[1]), end="\n")
# sorted_x = sorted(hsv_colors.items(), key=operator.itemgetter(1))
