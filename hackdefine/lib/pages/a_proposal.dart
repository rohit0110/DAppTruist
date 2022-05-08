class AProposal {
  int amount = 20;
  String description = "This is a test description for our application";
  String fromAddress = "";
  String toCharity = "";
  int forVotes = 0;
  int againstVotes = 0;

  AProposal({
    required this.description,
    required this.amount,
    required this.fromAddress,
    required this.toCharity,
    required this.forVotes,
    required this.againstVotes,
  });
}
