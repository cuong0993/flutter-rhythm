from util import grep

used_strings = list(map(lambda x: x.replace('S.of(context).', '').replace(')', '').replace(',', '').split('(', 1)[0],
                        sorted(grep("S\.of\(context\)\.txt_.*?\,", "../lib", '.dart'))))
strings = sorted(grep("\"txt_.*?\"", "../lib/l10n", '.arb'))
diff = [item for item in used_strings if item not in strings] + [item for item in strings if item not in used_strings]
if len(diff) != 0:
    raise Exception(diff)
