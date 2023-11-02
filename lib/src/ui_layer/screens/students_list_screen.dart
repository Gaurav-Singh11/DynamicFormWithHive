// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:nsl_task/src/data_layer/local_db/user_state_hive_helper.dart';
import 'package:nsl_task/src/data_layer/res/styles.dart';
import 'package:nsl_task/src/nsl_task_app.dart';
import 'package:nsl_task/src/ui_layer/helpers/progress_helper.dart';
import 'package:nsl_task/src/ui_layer/helpers/screen_navigation_helper.dart';
import 'package:nsl_task/src/ui_layer/screens/add_students_screen.dart';
import 'package:nsl_task/src/ui_layer/widgets/progress_bar_widget.dart';
import 'package:nsl_task/src/ui_layer/widgets/students_card_widget.dart';

class StudentsListScreen extends StatefulWidget {
  const StudentsListScreen({Key? key}) : super(key: key);

  @override
  State<StudentsListScreen> createState() => _StudentsListScreenState();
}

class _StudentsListScreenState extends State<StudentsListScreen> {

  void _refreshState(){
    if(mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return _mainApp(context);
  }

  Widget _mainApp(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Students List"),
        actions: [
          IconButton(
            onPressed: () {
              navigatorKey.currentState?.push(
                ScreenNavigation.createRoute(widget: const AddStudentsScreen()),
              ).then((value) {
                if(value != null && value!){
                  _refreshState();
                }
              });
            },
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: SafeArea(
        child: _screenContent(),
      ),
    );
  }

  Widget _screenContent() {
    return FutureBuilder(
      future: UserStateHiveHelper.instance.getAllStudents(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const ProgressBar();
        } else if (snapshot.data != null) {
          return ListView.separated(
            padding: AppStyles.pd20,
            physics: const ClampingScrollPhysics(),
            itemBuilder: (context, index) {
              return StudentCardWidget(
                studentDataModel: snapshot.data![index],
                onEditTap: (){
                  navigatorKey.currentState?.push(
                    ScreenNavigation.createRoute(widget: AddStudentsScreen(
                      studentDataModel: snapshot.data![index],
                    )),
                  ).then((value) {
                    if(value != null && value!){
                      _refreshState();
                    }
                  });
                },
                onDeleteTap: () async {
                  Loader.display(context);
                  await UserStateHiveHelper.instance.deleteStudent(snapshot.data![index].id!);
                  Loader.close(context);
                  _refreshState();
                },
              );
            },
            separatorBuilder: (context, index) {
              return AppStyles.sbHeight15;
            },
            itemCount: snapshot.data!.length,
          );
        } else {
          return Container();
        }
      },
    );
  }
}
