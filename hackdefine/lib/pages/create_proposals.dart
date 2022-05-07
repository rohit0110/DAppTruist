import 'package:flutter/material.dart';
import 'package:hackdefine/constants.dart';

class CreateProposal extends StatefulWidget {
  const CreateProposal({Key? key}) : super(key: key);

  @override
  State<CreateProposal> createState() => _CreateProposalState();
}

//add controllers
class _CreateProposalState extends State<CreateProposal> {
  String toCharity = "";
  String description = "";
  double celoAmount = 0.0;

  TextEditingController amtController = TextEditingController();
  TextEditingController descController = TextEditingController();
  TextEditingController addController = TextEditingController();

  void addProposal() {
    celoAmount = double.parse(amtController.text);
    description = descController.text;
    toCharity = addController.text;
    //createProposal Function from contract

    //exit screen
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create a Proposal"),
        backgroundColor: Colors.black,
      ),
      body: Container(
          padding: EdgeInsets.all(defaultPadding),
          child: Column(
            children: [
              TextField(
                controller: amtController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(
                        color: Colors.white,
                        width: 0.0,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.white,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(20)),
                    hintText: "Enter Amount in Celo",
                    hintStyle: const TextStyle(color: Colors.black),
                    filled: true,
                    fillColor: secondaryColor),
              ),
              SizedBox(
                height: defaultPadding,
              ),
              TextField(
                controller: addController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(
                        color: Colors.white,
                        width: 0.0,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.white,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(20)),
                    hintText: "Enter Charity Address",
                    hintStyle: const TextStyle(color: Colors.black),
                    filled: true,
                    fillColor: secondaryColor),
              ),
              SizedBox(
                height: defaultPadding,
              ),
              TextField(
                controller: descController,
                minLines: 5,
                maxLines: 10,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(
                        color: Colors.white,
                        width: 0.0,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.white,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(20)),
                    hintText: "Proposal Description",
                    hintStyle: const TextStyle(color: Colors.black),
                    filled: true,
                    fillColor: secondaryColor),
              ),
              SizedBox(
                height: defaultPadding,
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    addProposal();
                  });
                },
                child: const Text(
                  "Create Proposal",
                  style: TextStyle(color: Colors.black),
                ),
                style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all(const Size(200, 50)),
                    backgroundColor: MaterialStateProperty.all(secondaryColor)),
              )
            ],
          )),
    );
  }
}
