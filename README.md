# CS721_Blockchain-Applications

# Installing-Tools

# Slither 
1. Install Slither using the following command in Terminal:
      pip3 install slither-analyzer
2. After installation is complete, you can check if Slither is properly installed by running the following command:
      slither --help
      

# mythril 

1. Install mythril via docker `docker pull mythril/myth`
2. Scan contract file via command `docker run -v $(pwd):/tmp mythril/myth analyze /tmp/contract.sol`

Scanning contract gives the following result
<img width="1395" alt="Screenshot 2023-03-18 at 6 33 28 PM" src="https://user-images.githubusercontent.com/15656052/226108012-07b9fa71-e4f6-4740-9c58-ef9fb43dff23.png">


** Assuming you are in currect directory where the contract code is located , for example, above command is run from /Documents/contract directory.

** Allow the file access settings to docker container for current directory.

# smartcheck
1. Install smartcheck using the following command in Terminal:
          docker pull deepsecurity/smartcheck-scan-action


# Oyente
1. Install Oyente using the following command in Terminal after running docker in background:
      docker pull luongnguyen/oyente 
2. Check if oyente is installed or not by using the command:
      docker ps -a 
3. If the list contains oyente then it has been installed
4. To run oyente run command:
      docker run -i -t luongnguyen/oyente
      

# Osiris
