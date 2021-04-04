import 'dart:convert';
import 'dart:io';

void main() {
  File('database/db.json')
      .readAsString()
      .then((fileContents) => json.decode(fileContents) as Map)
      .then((jsonData) {
    final collections = jsonData['__collections__'] as Map;
    final users = collections['users'] as Map<String, Map>;
    users.forEach((key, value) {
      final newValue = <String, dynamic>{};
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
