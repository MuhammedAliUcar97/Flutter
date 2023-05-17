import 'package:flutter/material.dart';
import 'package:myapp/models/todo.dart';
import 'package:myapp/screens/calculator.dart';
import 'package:myapp/screens/nalan.dart';
import 'package:myapp/screens/tododetail.dart';
import 'package:mysql1/mysql1.dart';
import 'package:myapp/utils/drawer.dart';

class mysql extends StatefulWidget {
  const mysql({super.key});

  @override
  State<mysql> createState() => _mysqlState();
}

final GlobalKey<FormState> formKey = GlobalKey<FormState>();
late String title;
List<Todo> mysqltodoList = [];
bool isEdit = false;
late Todo editableTodo;
AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

final titlecontroler = TextEditingController();

final TextField1 = TextEditingController();
final TextField2 = TextEditingController();
final TextField3 = TextEditingController();
final TextField4 = TextEditingController();
final TextField5 = TextEditingController();
final TextField6 = TextEditingController();

@override
void dispose() {
  titlecontroler.dispose();
}

bool passwordVisible = false;

class _mysqlState extends State<mysql> {
  @override
  void initState() {
    mysqlconn();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      floatingActionButton: FloatingActionButton(
          onPressed: isEdit ? updateTodo : addTodo,
          child: const Icon(Icons.add)),
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Todo List',
        ),
        backgroundColor: const Color(0xff764abc),
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
              child: Form(
                key: formKey,
                child: TextFormField(
                  obscureText: passwordVisible,
                  controller: titlecontroler,
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
                  decoration: InputDecoration(
                      labelText: "Başlık",
                      suffixIcon: IconButton(
                        icon: Icon(passwordVisible
                            ? Icons.visibility
                            : Icons.visibility_off),
                        onPressed: () {
                          setState(
                            () {
                              passwordVisible = !passwordVisible;
                            },
                          );
                        },
                      ),
                      hintText: "Başlık giriniz"),
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
                                updateTodo();
                              });
                            },
                            value: item.isComplated,
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    item.isfavorite = !item.isfavorite!;
                                    updateIsfav(item.id, item.isfavorite!);
                                  });
                                },
                                child: Icon(Icons.star,
                                    color: item.isfavorite!
                                        ? Colors.yellow
                                        : Colors.black),
                              ),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    isEdit = !isEdit;
                                    editableTodo = item;
                                    if (isEdit) {
                                      titlecontroler.text = item.title;
                                    } else {
                                      titlecontroler.text = '';
                                    }
                                  });
                                },
                                child: Icon(Icons.edit,
                                    color: isEdit && editableTodo == item
                                        ? Colors.blue
                                        : Colors.black),
                              ),
                              InkWell(
                                child: const Icon(Icons.close),
                                onTap: () {
                                  setState(() {
                                    deleteTodo(item.id);
                                    mysqltodoList.remove(item);
                                  });
                                },
                              ),
                              InkWell(
                                child: const Icon(Icons.more_vert),
                                onTap: () {
                                  setState(() {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                TodoDetail(todo: item)));
                                  });
                                },
                              ),
                            ],
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
      final conn = await mysqlConn();

      await conn.query(
          'insert into todo (title, iscomplated,isstar) values (?, ?,?)',
          [title, false, false]);
      var results = await conn.query("select * from todo");
      setState(() {
        mysqltodoList = [];
        for (var element in results) {
          mysqltodoList.add(
            Todo(
                id: element["id"],
                title: element["title"],
                isComplated: element["iscomplated"] == 1 ? true : false),
          );
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

  void alertSuccess(String msg) {
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
                        child: Text(msg)),
                  ],
                ),
              ),
            ));
  }

  static Future<MySqlConnection> mysqlConn() async {
    final conn = await MySqlConnection.connect(ConnectionSettings(
        host: '93.89.225.127',
        port: 3306,
        user: 'ideftp1_testus',
        db: 'ideftp1_testdb',
        password: '123456aA+-'));
    return conn;
  }

  void mysqlconn() async {
    debugPrint("Bağlanmaya Calıştı");
    final conn = await mysqlConn();

    var results = await conn.query("select * from todo");

    debugPrint(results.toString());
    setState(() {
      mysqltodoList = [];
      for (var element in results) {
        mysqltodoList.add(Todo(
            id: element["id"],
            title: element["title"],
            isComplated: element["iscomplated"] == 1 ? true : false));
      }
    });
  }

  Future updateTodo() async {
    alertSuccess("Kayıt Güncellendi!");
    final conn = await mysqlConn();
    conn.query("update todo set title =? where id=?",
        [titlecontroler.text, editableTodo.id]);
    mysqltodoList
        .map((e) => {
              if (e == editableTodo)
                {
                  setState(() {
                    e.title = titlecontroler.text;
                  })
                }
            })
        .toList();
    titlecontroler.text = "";
  }

  void deleteTodo(int id) async {
    final conn = await mysqlConn();

    await conn.query('delete from todo where id = ?', [id]);
  }

  void updateIsfav(int id, bool fav) async {
    final conn = await mysqlConn();
    await conn.query('update todo set isStar=? where id=?', [fav, id]);
  }
}
