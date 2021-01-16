from util import grep

used_functions = list(map(lambda x: x.replace('getHttpsCallable("', '').replace('"', ''),
                          sorted(grep("getHttpsCallable\(\".*?\"", "../client", ('.kt', '.java')))))
functions = list(map(lambda x: x.replace('exports.', '').replace(' = functions', ''),
                     sorted(grep("exports.*? = functions", "../functions/functions/src", '.ts'))))

diff = [item for item in used_functions if item not in functions] + [item for item in functions if
                                                                     item not in used_functions and item != 'onUserDeleted' and item != 'onUserSignUp' and item != 'checkIfExpiredSubscriptionsRenewed' and item != 'sendNewSongNotification']
if len(diff) != 0:
    raise Exception(diff)
