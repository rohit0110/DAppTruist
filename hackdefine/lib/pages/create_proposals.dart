import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hackdefine/constants.dart';
import 'package:web3_connect/web3_connect.dart';
import 'package:web3dart/web3dart.dart';

class CreateProposal extends StatefulWidget {
  CreateProposal({Key? key, required this.w3c, required this.client})
      : super(key: key);

  Web3Connect w3c;
  Web3Client client;
  @override
  State<CreateProposal> createState() => _CreateProposalState();
}

class _CreateProposalState extends State<CreateProposal> {
  String toCharity = "";
  String description = "";
  double celoAmount = 0.0;

  TextEditingController amtController = TextEditingController();
  TextEditingController descController = TextEditingController();
  TextEditingController addController = TextEditingController();

  Future<DeployedContract> getContract() async {
    String abiFile = await rootBundle.loadString("assets/abi.json");
    String contractAddress = "0xC65aF5476d77300A8F06faD3Dd21e5bdf508E8E8";
    final contract = DeployedContract(
        ContractAbi.fromJson(abiFile, "CharloDao"),
        EthereumAddress.fromHex(contractAddress));
    return contract;
  }

  Future<void> createTheProposal() async {
    final contract = await getContract();
    final function = contract.function("createProposal");
    final transaction = Transaction.callContract(
        contract: contract,
        function: function,
        from: EthereumAddress.fromHex(widget.w3c.account),
        maxGas: 100000,
        gasPrice: EtherAmount.inWei(BigInt.from(100)),
        parameters: [
          description,
          EthereumAddress.fromHex(toCharity),
          BigInt.from(celoAmount),
        ]);
    await widget.client
        .sendTransaction(widget.w3c.credentials, transaction, chainId: 44787);
  }

  snackBar({String? label}) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label!),
          const CircularProgressIndicator(
            color: Colors.white,
          )
        ],
      ),
      duration: const Duration(days: 1),
      backgroundColor: Colors.blue,
    ));
  }

  void addProposal() async {
    celoAmount = double.parse(amtController.text);
    description = descController.text;
    toCharity = addController.text;
    //createProposal Function from contract
    await createTheProposal();
    snackBar(label: "Verifying transaction");
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
