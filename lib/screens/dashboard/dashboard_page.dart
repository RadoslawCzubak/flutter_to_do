import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todo_app/screens/dashboard/cubit/dashboard_cubit.dart';
import 'package:flutter_todo_app/screens/dashboard/dashboard_in_progress.dart';
import 'package:flutter_todo_app/screens/dashboard/dashboard_main_list.dart';
import 'package:flutter_todo_app/screens/dashboard/dashboard_todo_list.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DashboardCubit>(
      create: (context) => DashboardCubit(),
      child: Scaffold(
          body: SafeArea(
              child: SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const DashboardUserProfile(),
                  BlocBuilder<DashboardCubit, DashboardState>(
                    builder: (context, state) {
                      return MainComponent(
                        projects: state.projects,
                      );
                    },
                  ),
                  ToDoComponent(),
                  InProgressComponent()
                ]),
          )),
          bottomNavigationBar: _buildBottomNav()),
    );
  }

  Widget _buildBottomNav() {
    return BottomNavigationBar(items: [
      const BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
            color: Colors.orange,
          ),
          label: ''),
      const BottomNavigationBarItem(
          icon: Icon(
            Icons.search,
            color: Colors.orange,
          ),
          label: ''),
      const BottomNavigationBarItem(
          icon: Icon(
            Icons.check_box,
            color: Colors.orange,
          ),
          label: ''),
      const BottomNavigationBarItem(
          icon: Icon(
            Icons.notifications,
            color: Colors.orange,
          ),
          label: ''),
      BottomNavigationBarItem(
          icon: ClipOval(
            child: Image.asset(
              'assets/images/Profile_avatar_placeholder_large.png',
              width: 24.0,
              height: 24.0,
            ),
          ),
          label: '')
    ]);
  }
}

class DashboardUserProfile extends StatelessWidget {
  const DashboardUserProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16.0, 4.0, 16.0, 8.0),
      child: Row(
        children: [
          ClipOval(
            child: Image.asset(
              'assets/images/Profile_avatar_placeholder_large.png',
              height: 35.0,
              width: 35.0,
            ),
          ),
          const SizedBox(
            width: 10.0,
          ),
          const Text('Hello, ',
              style: TextStyle(fontSize: 18.0, fontFamily: 'Poppins')),
          const Text(
            'Amanda',
            style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'Poppins'),
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/addtask');
              },
              child: Text('add task')),
          ElevatedButton(
              onPressed: () {
                BlocProvider.of<DashboardCubit>(context).getProjects();
              },
              child: Text('refresh')),
        ],
      ),
    );
  }
}
