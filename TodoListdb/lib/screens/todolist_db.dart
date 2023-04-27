import 'package:flutter/material.dart';
import 'package:todolist/models/todo.dart';
import 'package:mysql1/mysql1.dart';

class mysql extends StatefulWidget {
  const mysql({super.key});

  @override
  State<mysql> createState() => _mysqlState();
}

final GlobalKey<FormState> formKey = GlobalKey<FormState>();
late String title;
List<Todo> mysqltodoList = [];

AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

final myController = TextEditingController();

final TextField1 = TextEditingController();
final TextField2 = TextEditingController();
final TextField3 = TextEditingController();
final TextField4 = TextEditingController();
final TextField5 = TextEditingController();
final TextField6 = TextEditingController();

@override
void dispose() {
  myController.dispose();
}

class _mysqlState extends State<mysql> {
  @override
  void initState() {
    mysqlconn();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          onPressed: addTodo, child: const Icon(Icons.add)),
      drawer: const Drawer(),
      appBar: AppBar(
        title: const Text('Todo List'),
        actions: const [
          Icon(Icons.settings),
          SizedBox(
            width: 5,
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 1,
            child: Container(
              padding: const EdgeInsets.all(10),
              alignment: Alignment.center,
              color: Colors.grey,
              child: Form(
                key: formKey,
                child: TextFormField(
                  controller: myController,
                  autovalidateMode: autovalidateMode,
                  onSaved: (newValue) {
                    title = newValue!;
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Boş geçilemez!!";
                    } else {
                      return null;
                    }
                  },
                  decoration: const InputDecoration(
                      labelText: "Başlık", hintText: "Başlık giriniz"),
                ),
              ),
            ),
          ),
          Expanded(
              flex: 3,
              child: Container(
                padding: const EdgeInsets.all(10),
                alignment: Alignment.topCenter,
                child: ListView.separated(
                    separatorBuilder: (context, index) => const Divider(
                          height: 5,
                          color: Colors.transparent,
                        ),
                    padding: const EdgeInsets.all(5),
                    itemCount: mysqltodoList.length,
                    itemBuilder: (context, index) {
                      Todo item = mysqltodoList[index];
                      return ListTile(
                          tileColor: item.isComplated
                              ? Colors.green[100]
                              : Colors.red[100],
                          subtitle: const Text("Tıkla Ve Tamamla"),
                          leading: Checkbox(
                            activeColor: Colors.green[100],
                            checkColor: Colors.black,
                            onChanged: (value) {
                              setState(() {
                                item.isComplated = value!;
                                updateTodo(item.id, item.isComplated);
                              });
                            },
                            value: item.isComplated,
                          ),
                          trailing: IconButton(
                            onPressed: () {
                              setState(() {
                                deleteTodo(item.id);
                                mysqltodoList.remove(item);
                              });
                            },
                            icon: const Icon(Icons.delete),
                          ),
                          title: Text(
                            "${item.id} - ${item.title}",
                            style: item.isComplated
                                ? const TextStyle(
                                    decoration: TextDecoration.lineThrough)
                                : const TextStyle(),
                          ));
                    }),
              ))
        ],
      ),
    );
  }

  void addTodo() async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      final conn = await MySqlConnection.connect(ConnectionSettings(
          host: '93.89.225.127',
          port: 3306,
          user: 'ideftp1_testus',
          db: 'ideftp1_testdb',
          password: '123456aA+-'));
     await conn.query('insert into todo (title, iscomplated) values (?, ?)', [title,false]);
     var results = await conn.query("select * from todo");
      setState(() {
        mysqltodoList = [];
        for (var element in results) {
          mysqltodoList.add(Todo(id: element["id"], title: element["title"], isComplated: element["iscomplated"] == 1 ? true : false));
        }
      });
      

      debugPrint(const mysql().toString());
      formKey.currentState!.reset();
    } else {
      setState(() {
        autovalidateMode = AutovalidateMode.always;
      });
    }
  }

  void alertSuccess() {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              actionsAlignment: MainAxisAlignment.center,
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("Kapat"))
              ],
              content: SizedBox(
                height: 100,
                child: Column(
                  children: [
                    const Icon(
                      Icons.check_circle,
                      color: Colors.green,
                      size: 72,
                    ),
                    Container(
                        margin: const EdgeInsets.only(top: 5),
                        child: const Text("Kayıt Eklendi!")),
                  ],
                ),
              ),
            ));
  }
}

void updateTodo(int id, bool iscomplated) async {
   final conn = await MySqlConnection.connect(ConnectionSettings(
      host: '93.89.225.127',
      port: 3306,
      user: 'ideftp1_testus',
      db: 'ideftp1_testdb',
      password: '123456aA+-'));
      await conn.query('update todo set iscomplated=? where id =?', [iscomplated,id]);
}

void deleteTodo(int id) async {
 final conn = await MySqlConnection.connect(ConnectionSettings(
      host: '93.89.225.127',
      port: 3306,
      user: 'ideftp1_testus',
      db: 'ideftp1_testdb',
      password: '123456aA+-'));
      await conn.query('delete from todo where id = ?', [id]);
}

void mysqlconn() async {
  debugPrint("Bağlanmaya Calıştı");
  final conn = await MySqlConnection.connect(ConnectionSettings(
      host: '93.89.225.127',
      port: 3306,
      user: 'ideftp1_testus',
      db: 'ideftp1_testdb',
      password: '123456aA+-'));
  var results = await conn.query("select * from todo");
  debugPrint(results.toString());
}