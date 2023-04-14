# Installation steps for smart contract tools.



## Slither 
1. Install Slither using the following command in Terminal:
      `pip3 install slither-analyzer`
2. After installation is complete, you can check if Slither is properly installed by running the following command:
      `slither --help`
      

## Mythril 

1. Install mythril via docker `docker pull mythril/myth`
2. Scan contract file via command `docker run -v $(pwd):/tmp mythril/myth analyze /tmp/contract.sol`

Scanning contract gives the following result
<img width="1395" alt="Screenshot 2023-03-18 at 6 33 28 PM" src="https://user-images.githubusercontent.com/15656052/226108012-07b9fa71-e4f6-4740-9c58-ef9fb43dff23.png">


** Assuming you are in currect directory where the contract code is located , for example, above command is run from /Documents/contract directory.

** Allow the file access settings to docker container for current directory.

## Smartcheck
1. Install smartcheck using the following command in Terminal:
          `docker pull deepsecurity/smartcheck-scan-action`


## Oyente
1. Install Oyente using the following command in Terminal after running docker in background:
      `docker pull luongnguyen/oyente`
2. Check if oyente is installed or not by using the command:
      `docker ps -a`
3. If the list contains oyente then it has been installed
4. To run oyente run command:
      `docker run -i -t luongnguyen/oyente`
      

## Osiris
1. Install osiris via docker 
   `docker pull christoftorres/osiris && docker run -i -t christoftorres/osiris`
2. Test the contract via following command 
   `python osiris/osiris.py -s datasets/SimpleDAO/SimpleDAO_0.4.19.sol`   
3. Evaluate a local solidity contract
   `python osiris.py -s <contract filename>`

   <img width="808" alt="Screenshot 2023-03-18 at 7 25 00 PM" src="https://user-images.githubusercontent.com/15656052/226110484-c9e36469-ca80-4668-8316-dfd96fbb1e3e.png">


## Solhint
This is an open source project for linting Solidity code. This project provides both Security and Style Guide validations.
We have used it to find some vulnerabilties in our list of contract 
- re entrancy
- avoid-tx-origin
( list of available rules for solhint - https://protofire.github.io/solhint/docs/rules.html )

### How to install and run solhint
1. npm install -g solhint
2. solhint --version ( verify that it was installed correctly )
3. solhint --init ( First initialize a configuration file, if you don’t have one )
4. solhint 'contracts/**/*.sol' (to lint all files inside contracts directory)
