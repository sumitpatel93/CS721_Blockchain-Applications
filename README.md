# CS721_Blockchain-Applications

# Installing-Tools

# Slither 
1. Install Slither using the following command in Terminal:
      pip3 install slither-analyzer
2.After installation is complete, you can check if Slither is properly installed by running the following command:
      slither --help
      

# mythirl 

1. Installed Rust using the following command: 
        curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
2. Then installed maturin 
        cargo install maturin 
3. pip3 install maturin 
   Error: ERROR: Could not build wheels for blake2b-py, which is required to install pyproject.toml-based projects
unable to fix this. 


# smartcheck



# Oyente
1. Install Oyente using the following command in Terminal after running docker in background:
      docker pull luongnguyen/oyente 
2. Check if oyente is installed or not by using the command:
      docker ps -a 
3. If the list contains oyente then it has been installed
4. To run oyente run command:
      docker run -i -t luongnguyen/oyente
5. To evaluate the greeter contract inside the container, run:
      cd /oyente/oyente
      python oyente.py -s greeter.sol

# Osiris
