from util import grep

used_strings = list(map(lambda x: x.replace('"', ''),
                        sorted(grep("\"txt_.*?\"", "../client", ('.kt', '.java')))))
strings_raw = sorted(grep("txt_.*=", "../client/core/assets/bundles", '.properties'))
strings = list(map(lambda x: x.replace('=', ''),
                   sorted(grep("txt_.*=", "../client/core/assets/bundles", '.properties'))))
diff = [item for item in used_strings if item not in strings] + [item for item in strings if item not in used_strings]
if len(diff) != 0:
    raise Exception(diff)
