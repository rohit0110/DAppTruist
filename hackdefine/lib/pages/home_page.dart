import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hackdefine/constants.dart';
import 'package:hackdefine/pages/drawer_part.dart';
import 'package:web3_connect/web3_connect.dart';
import 'package:web3dart/web3dart.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  HomePage({Key? key, required this.w3c}) : super(key: key);
  Web3Connect w3c;
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Web3Client client;

  @override
  void initState() {
    widget.w3c.enterRpcUrl("https://alfajores-forno.celo-testnet.org");
    widget.w3c.enterChainId(44787);
    client = Web3Client(widget.w3c.rpcUrl, http.Client());
    super.initState();
  }

  Future<DeployedContract> getContract() async {
    String abiFile = await rootBundle.loadString("assets/abi.json");
    String contractAddress = "0xC65aF5476d77300A8F06faD3Dd21e5bdf508E8E8";
    final contract = DeployedContract(
        ContractAbi.fromJson(abiFile, "CharloDao"),
        EthereumAddress.fromHex(contractAddress));
    return contract;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("DApp-truist"),
        backgroundColor: Colors.black,
      ),
      drawer: SideMenu(
        w3c: widget.w3c,
        client: client,
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [primaryColor, secondaryColor],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight)),
        padding: EdgeInsets.all(defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: defaultPadding * 10,
            ),
            const Text(
              "Welcome to",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 34,
                  fontWeight: FontWeight.bold),
            ),
            const Text(
              "DApp-truist",
              style: TextStyle(
                  color: Color.fromARGB(255, 36, 6, 124),
                  fontSize: 60,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: defaultPadding,
            ),
            const Text("Become a part of the altruistic community!",
                style: TextStyle(color: Colors.white, fontSize: 34)),
          ],
        ),
      ),
    );
  }
}
