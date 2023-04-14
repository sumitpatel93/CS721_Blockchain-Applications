/* 
  No, the enter() function does not have a reentrancy bug. It only returns the payment if it's not 1 ETH and 
  the function will immediately stop executing if that's the case. The send function is used to return the 
  payment, which transfers the value to the msg.sender's address. The function will exit, and the transaction 
  will be completed without any further state changes, so there is no opportunity for a reentrancy attack to occur.
  */



//[ETH] Wealth Redistribution Contract
//
//Please keep in mind this contract is for educational and entertainment purposes only and was created to understand the limitations of Ethereum contracts.
//



contract WealthRedistributionProject {

  struct BenefactorArray {
      address etherAddress;
      uint amount;
  }

  BenefactorArray[] public benefactor;

  uint public balance = 0;
  uint public totalBalance = 0;

  function() {
    enter();
  }
  
  function enter() {
    if (msg.value != 1 ether) { //return payment if it's not 1 ETH
        msg.sender.send(msg.value);
        return;
    }
   
    uint transactionAmount;
    uint k = 0;

    // add a new participant to array
    uint total_inv = benefactor.length;
    benefactor.length += 1;
    benefactor[total_inv].etherAddress = msg.sender;
    benefactor[total_inv].amount = msg.value;

	balance += msg.value;  //keep track of amount available

   // payment gets distributed to all benefactors based on what % of the total was contributed by them    
    while (k<total_inv) 
    { 
    	transactionAmount = msg.value * benefactor[k].amount / totalBalance;       //Calculate amount to send
		benefactor[k].etherAddress.send(transactionAmount);    					//Wealth redistribution
		balance -= transactionAmount;                        					//Keep track of available balance
        k += 1; //LOOP next benefactor
    }
    
	totalBalance += msg.value;  //keep track of total amount contributed
    
    
  }

}