import io
import os
import re


def grep(regex, base_dir, extension, skip_files=[]):
    used_resources = set()
    for root, _, files in os.walk(base_dir):
        for file in files:
            if file.lower().endswith(extension):
                if file in skip_files:
                    continue
                try:
                    with io.open(os.path.join(root, file), 'r', encoding='utf8') as f:
                        content = f.read()
                        match_list = re.findall(regex, content)
                        if match_list:
                            for i in match_list:
                                used_resources.add(i)
                except UnicodeDecodeError:
                    print('Cannot read {0} as text'.format(os.path.join(root, file)))
    return used_resources
