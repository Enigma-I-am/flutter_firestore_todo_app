
import 'package:flutter_firestore_todo_app/core/services/Api.dart';
import 'package:flutter_firestore_todo_app/core/viewmodels/CRUDModel.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt();
void setupLocator(){
  locator.registerLazySingleton(()=>Api("notes"));
  locator.registerLazySingleton(()=> CRUDModel());
}