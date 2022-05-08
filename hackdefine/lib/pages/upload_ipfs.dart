import 'package:flutter/material.dart';
import 'package:hackdefine/constants.dart';
import 'package:ipfs_client_flutter/ipfs_client_flutter.dart';
import 'package:web3_connect/web3_connect.dart';

class UploadIPFS extends StatefulWidget {
  UploadIPFS({Key? key, required this.w3c}) : super(key: key);
  Web3Connect w3c;
  @override
  State<UploadIPFS> createState() => _UploadIPFSState();
}

class _UploadIPFSState extends State<UploadIPFS> {
  IpfsClient ipfsClient = IpfsClient(
      url: "https://ipfs.infura.io:5001",
      authorizationToken: "ea6ac58f147e7c0f2ac66575428c97e4");

  void writeToIPFS() async {
    await ipfsClient.write(
        dir: "myFolder/1catto-modified.png",
        filePath: "assets/1catto-modified.png");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        backgroundColor: Colors.black,
      ),
      body: Container(
        padding: EdgeInsets.all(defaultPadding),
        child: Column(children: [
          Image.asset("assets/1catto-modified.png"),
          SizedBox(
            height: defaultPadding * 4,
          ),
          Container(
            padding: EdgeInsets.all(defaultPadding),
            margin: EdgeInsets.all(defaultPadding),
            color: Colors.amber,
            child: Text("Contributor's Address: ${widget.w3c.account}",
                style: const TextStyle(fontSize: 20, color: Colors.black)),
          )
        ]),
      ),
    );
  }
}
