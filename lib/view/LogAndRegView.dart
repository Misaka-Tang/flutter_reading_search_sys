import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_novel_sys/view/NovelView.dart';

class LogAndRegView extends StatefulWidget {
  const LogAndRegView({Key? key}) : super(key: key);

  @override
  State<LogAndRegView> createState() => _LogAndRegViewState();
}

class _LogAndRegViewState extends State<LogAndRegView> {
  late TextEditingController accController;
  late TextEditingController passController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    accController = TextEditingController();
    passController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 50,),
              Text('Budy Your novel reading system',
              style: TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 38,
                ),
              ),
              SizedBox(height: 40,),
              accountView(context, accController),
              SizedBox(height: 20,),
              passView(context, passController),
              SizedBox(height: 40,),
              Center(child: Row(
                children: [
                  SizedBox(width: 20,),
                  ElevatedButton(onPressed: (){
                    print('register');
                  }, child: Text('Register')),
                  SizedBox(width: 20,),
                  ElevatedButton(onPressed: (){
                    print('Log in');
                  }, child: Text('Log in')),
                ],
              )
              )
            ],
          ),
        ),
      ),
    );
  }

Widget accountView(BuildContext context, TextEditingController controller) {
    return Flexible(
        child: Container(
          child: Row(
            children: [
              SizedBox(width: 20,),
              Text('Account: ',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),),
              SizedBox(width: 20,),
              Flexible(
                  child: TextField(
                    controller: controller,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'input your account'
                    ),
                  )
              ),
              SizedBox(width: 40,),
            ],
          ),
        )
      );
}

Widget passView(BuildContext context, TextEditingController controller) {
  return Flexible(
      child: Container(
        child: Row(
          children: [
            SizedBox(width: 20,),
            Text('Password: ',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
              ),),
            SizedBox(width: 20,),
            Flexible(
                child: TextField(
                  controller: controller,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'input your password'
                  ),
                )
            ),
            SizedBox(width: 40,),
          ],
        ),
      )
  );
}
}
