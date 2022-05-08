import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hackdefine/constants.dart';
import 'package:hackdefine/pages/a_proposal.dart';
import 'package:hackdefine/pages/proposal_details.dart';
import 'package:web3_connect/web3_connect.dart';

import 'package:web3dart/web3dart.dart';

class AllProposal extends StatefulWidget {
  AllProposal({Key? key, required this.w3c, required this.client})
      : super(key: key);
  Web3Connect w3c;
  Web3Client client;
  @override
  State<AllProposal> createState() => _AllProposalState();
}

class _AllProposalState extends State<AllProposal> {
  Future<DeployedContract> getContract() async {
    String abiFile = await rootBundle.loadString("assets/abi.json");
    String contractAddress = "0xC65aF5476d77300A8F06faD3Dd21e5bdf508E8E8";
    final contract = DeployedContract(
        ContractAbi.fromJson(abiFile, "CharloDao"),
        EthereumAddress.fromHex(contractAddress));
    return contract;
  }

  Future<List<dynamic>> getProposals() async {
    final contract = await getContract();
    final function = contract.function("getProposals");
    final result = await widget.client
        .call(contract: contract, function: function, params: []);
    print(result);
    return result;
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

  void getProposal() async {
    //proposals = await getProposals();
    //snackBar(label: "Verifying request");
  }

  @override
  void initState() {
    getProposal();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<dynamic> proposals = [
      AProposal(
          description:
              'Dedicate donations from the treasury for the month of April to Bill & Melinda Gates Foundation',
          amount: 200000,
          fromAddress: '0x5F7AD94Cd3303FF07F2B1239463ceF94f2c81217',
          toCharity: '0x5Ef354bEAdf6C7406037302552BCD1945eef7603',
          forVotes: 78,
          againstVotes: 54),
      AProposal(
          description: 'Pay increase for contributors and maintaners by 7%',
          amount: 56000,
          fromAddress: '0xB76fdfF78eDE4fCb9a0645Fbd4ce6EC7A086f33e',
          toCharity: '0x874069fa1eb16d44d622f2e0ca25eea172369bc1',
          forVotes: 49,
          againstVotes: 126),
      AProposal(
          description: 'Provide support to the COVID relief fund',
          amount: 10000000,
          fromAddress: '0x10c892a6ec43a53e45d0b916b4b7d383b1b78c0f',
          toCharity: '0x5F7AD94Cd3303FF07F2B1239463ceF94f2c81217',
          forVotes: 147,
          againstVotes: 2)
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text("All Proposals"),
        backgroundColor: Colors.black,
      ),
      body: Container(
          padding: EdgeInsets.all(defaultPadding),
          child: ListView.builder(
              itemCount: proposals.length,
              itemBuilder: ((context, index) {
                return GestureDetector(
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: defaultPadding / 2),
                    padding: EdgeInsets.all(defaultPadding),
                    decoration: const BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    height: 200,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${proposals[index].description}",
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 24,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: defaultPadding,
                        ),
                        Text(
                          "Amount Requested: ${proposals[index].amount} cUSD",
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ProposalDetails(
                                  proposal: proposals[index],
                                )));
                  },
                );
              }))),
    );
  }
}
