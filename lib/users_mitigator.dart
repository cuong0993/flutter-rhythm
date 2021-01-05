import 'dart:collection';
import 'dart:convert';
import 'dart:io';

void main() {
  File('database/db.json')
      .readAsString()
      .then((fileContents) => json.decode(fileContents))
      .then((jsonData) {
    final collections = jsonData['__collections__'];
    final users = collections['users'];
    (users as Map).forEach((key, value) {
      final newValue = HashMap();
      newValue['__collections__'] = value['__collections__'];
      newValue['id'] = value['id'];
      newValue['playedNotes'] =
          (value['playedNotes'] == null) ? 0 : value['playedNotes'];
      newValue['stars'] = (value['stars'] == null) ? 0 : value['stars'];
      newValue['playedTime'] =
          (value['playedTime'] == null) ? 0 : value['playedTime'];
      newValue['instrumentId'] = value['instrumentId'];
      newValue['notificationTokens'] = value['notificationTokens'];
      users[key] = newValue;
    });
    collections['users'] = users;
    jsonData['__collections__'] = collections;
    File('database/db.json').writeAsStringSync(json.encode(jsonData));
  });
}
