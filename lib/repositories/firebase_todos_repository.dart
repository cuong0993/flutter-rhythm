// Copyright 2018 The Flutter Architecture Sample Authors. All rights reserved.
// Use of this source code is governed by the MIT license that can be found
// in the LICENSE file.

import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/todo.dart';
import 'todos_repository.dart';

class FirebaseTodosRepository implements TodosRepository {
  final todoCollection = Firestore.instance.collection('todos');

  @override
  Future<void> addNewTodo(Todo todo) {
    //return todoCollection.add(todo.toEntity().toDocument());
  }

  @override
  Future<void> deleteTodo(Todo todo) async {
    return todoCollection.document(todo.id).delete();
  }

  @override
  Stream<List<Todo>> todos() {
    // return todoCollection.snapshots().map((snapshot) {
    //   return snapshot.documents
    //       .map((doc) => Todo.fromEntity(TodoEntity.fromSnapshot(doc)))
    //       .toList();
    // });
  }

  @override
  Future<void> updateTodo(Todo update) {
    // return todoCollection
    //     .document(update.id)
    //     .updateData(update.toEntity().toDocument());
  }
}
