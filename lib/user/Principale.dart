import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:projet_stn/classes/craftman.dart';

import 'craftman_profile.dart';

class Userprincipal extends StatefulWidget {
  const Userprincipal({super.key});
  @override
  State<Userprincipal> createState() => _UserprincipalState();
}

class _UserprincipalState extends State<Userprincipal> {
  bool _isready = false;
  Stream<QuerySnapshot>? CraftmenStream;

  @override
  void initState() {
    getcraftmenlist();
    super.initState();
  }

  getcraftmenlist() async {
    CraftmenStream =
        await FirebaseFirestore.instance.collection("craftman").snapshots();
    setState(() {
      _isready = true;
    });
    print(CraftmenStream!.length);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(),
      resizeToAvoidBottomInset: true,
      appBar: AppBar(),
      body: Container(
        child: _isready
            ? StreamBuilder<QuerySnapshot>(
                stream: CraftmenStream,
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasError) {
                    return const Text('Something went wrong');
                  }

                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: Text("Loading"));
                  }

                  return Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 7, vertical: 10),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        border: Border.all(
                          color: Colors.blue,
                          width: 2.0,
                        ),
                      ),
                      child: ListView(
                        shrinkWrap: true,
                        children: snapshot.data!.docs
                            .map((DocumentSnapshot document) {
                          Map<String, dynamic> data =
                              document.data()! as Map<String, dynamic>;
                          return ListTile(
                            onTap: () {
                              Navigator.push(
                                  (context),
                                  MaterialPageRoute(
                                      builder: (context) => CraftmanProfile(
                                            craftman: Craftman(
                                                data['craftname'],
                                                data['firstname'],
                                                data['lastname'],
                                                data['email'],
                                                data['location'],
                                                data['phonenumber'],
                                                data['uid']),
                                          )));
                            },
                            title: Text(
                                "${data['firstname']} ${data['lastname']}"),
                            subtitle: Row(
                              children: [
                                Text(
                                    "${data['craftname']}, ${data['location']}"),
                                const Icon(Icons.location_history_rounded),
                              ],
                            ),
                            trailing: const Icon(Icons.person_sharp),
                          );
                        }).toList(),
                      ),
                    ),
                  );
                },
              )
            : const Center(
                child: CircularProgressIndicator(),
              ),
      ),
    );
  }
}
