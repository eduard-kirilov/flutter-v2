import 'package:flutter/material.dart';
import 'package:flutter1/domain/workout.dart';
import 'package:flutter1/services/auth.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        appBar: AppBar(
            title: Text('MaxFit'),
            leading: Icon(Icons.fitness_center),
            actions: <Widget>[
              FlatButton.icon(
                onPressed: () {
                  context.read<AuthServise>().signOut();
                },
                icon: Icon(
                  Icons.logout,
                  color: Colors.white,
                ),
                label: SizedBox.shrink(),
              )
            ]),
        body: WorkoutsList(),
      ),
    );
  }
}

class WorkoutsList extends StatelessWidget {
  final workouts = <Workout>[
    Workout(
        title: 'Test1',
        author: 'Max',
        description: 'Test Workout',
        level: 'Beginer'),
    Workout(
        title: 'Test2',
        author: 'Max',
        description: 'Test Workout1',
        level: 'Intermidiate'),
    Workout(
        title: 'Test3',
        author: 'Max',
        description: 'Test Workout2',
        level: 'Advanced'),
    Workout(
        title: 'Test4',
        author: 'Max',
        description: 'Test Workout3',
        level: 'Beginer'),
    Workout(
        title: 'Test5',
        author: 'Max',
        description: 'Test Workout4',
        level: 'Beginer'),
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Container(
            child: ListView.builder(
                itemCount: workouts.length,
                itemBuilder: (context, i) {
                  return Card(
                    elevation: 2.0,
                    margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    child: Container(
                      decoration:
                          BoxDecoration(color: Color.fromRGBO(50, 65, 85, 0.9)),
                      child: ListTile(
                        contentPadding: EdgeInsets.symmetric(horizontal: 10),
                        leading: Container(
                          padding: EdgeInsets.only(right: 12),
                          child: Icon(Icons.fitness_center,
                              color:
                                  Theme.of(context).textTheme.headline1.color),
                          decoration: BoxDecoration(
                            border: Border(
                                right: BorderSide(
                                    width: 1, color: Colors.white24)),
                          ),
                        ),
                        title: Text(
                          workouts[i].title,
                          style: TextStyle(
                              color:
                                  Theme.of(context).textTheme.headline1.color,
                              fontWeight: FontWeight.bold),
                        ),
                        trailing: Icon(Icons.keyboard_arrow_right,
                            color: Theme.of(context).textTheme.headline1.color),
                        subtitle: subtitle(context, workouts[i]),
                      ),
                    ),
                  );
                })));
  }
}

Widget subtitle(BuildContext context, Workout workout) {
  var color = Colors.grey;
  double indicatorLevel = 0;
  switch (workout.level) {
    case 'Beginer':
      color = Colors.green;
      indicatorLevel = 0.33;
      break;
    case 'Intermidiate':
      color = Colors.yellow;
      indicatorLevel = 0.66;
      break;
    case 'Advanced':
      color = Colors.red;
      indicatorLevel = 1;
      break;
  }
  return Row(children: <Widget>[
    Expanded(
        flex: 1,
        child: LinearProgressIndicator(
          backgroundColor: Theme.of(context).textTheme.headline1.color,
          value: indicatorLevel,
          valueColor: AlwaysStoppedAnimation(color),
        )),
    SizedBox(width: 10),
    Expanded(
        flex: 3,
        child: Text(workout.level,
            style:
                TextStyle(color: Theme.of(context).textTheme.headline1.color))),
  ]);
}
