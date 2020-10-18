from util import grep

resources = list(map(lambda x: x.replace('add("', '').replace('"', ''),
                     sorted(grep('add\(\"rsc_.*?\"', "../client", ('.kt', '.java')))))
used_resources = list(map(lambda x: x.replace('get("', '').replace('"', ''),
                          grep('get\(\"rsc_.*?\"', "../client", ('.kt', '.java')))) + list(
    map(lambda x: x.replace('"', '').replace('"', ''),
        grep('rsc_.*?\"', "../client", ('.kt', '.java'), ['AssetLoader.kt'])))
diff = [item for item in used_resources if item not in resources] + [item for item in resources if
                                                                     item not in used_resources]
if len(diff) != 0:
    raise Exception(diff)
