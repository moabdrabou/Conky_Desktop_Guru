# Conky Desktop Guru
![alt text](https://github.com/moabdrabou/Conky_Desktop_Guru/blob/main/HDD.png?raw=true)        ![alt text](https://github.com/moabdrabou/Conky_Desktop_Guru/blob/main/Network.png?raw=true)       ![alt text](https://github.com/moabdrabou/Conky_Desktop_Guru/blob/main/RamGpu.png?raw=true)
## How to Install
   1. Run the following command to install conky:
      > sudo apt install conky-all
   2. Create the config file:
      > conky -C > ~/Documents/conky.config
   3. Create the conky folder in the home directory:
      > mkdir ~/.config/conky
   4. Replace the content of the created config file with the content from [this file](https://github.com/moabdrabou/Conky_Desktop_Guru/blob/main/conky.config) "You can use any text editor to copy the content"
   5. Copy the file to the conky folder in your home directory:
      > cp -v ~/Documents/conky.config ~/.config/conky
   6. Adjust the hardware configuration according to your settings
      - Network adapter parameter "Replace enp6s0 with the name of your network adapter". Run the below command to find the name of your network adapter:
         > sudo ifconfig

           ![alt text](https://github.com/moabdrabou/Conky_Desktop_Guru/blob/main/Lan.png?raw=true)
      - Processor "Replace AMD Ryzen 5 @ 3.60GHz with the name of your processor" 

           ![alt text](https://github.com/moabdrabou/Conky_Desktop_Guru/blob/main/Processor.png?raw=true)

      - The number of your CPU cores, run the following command to find out how many cores is your CPU:
         > nproc
      - Temp sensor. You can run this command to find out how many sensors you have:
         > ls /sys/class/hwmon
        - Then this command to find the name of each sensor "Make sure to change the number after hwmon to check all your sensors":
         > sudo cat /sys/class/hwmon/hwmon4/name

           ![alt text](https://github.com/moabdrabou/Conky_Desktop_Guru/blob/main/Sensors.png?raw=true)

   7. Create an auto start item for conky to load once system is started



