# Conky Desktop Guru: Elevate Your Desktop Experience

Enhance your Linux desktop with dynamic and customizable system monitoring using Conky Desktop Guru! This guide will walk you through the installation and configuration process to get a sleek and informative Conky display up and running.

## Preview

Get a glimpse of what your desktop could look like with Conky Desktop Guru:

![Conky Desktop Guru Screenshot](https://github.com/moabdrabou/Conky_Desktop_Guru/blob/main/images/DesktopGuru.png)

## Prerequisites

This Conky configuration uses the **DejaVu Sans Mono** font. To ensure the display renders correctly, please make sure it is installed on your system. You can usually install it using your distribution's package manager (e.g., `sudo apt-get install fonts-dejavu`).

## Installation Guide

Follow these simple steps to install and set up Conky on your system:

1.  **Install Conky:**
    Open your terminal and run the following command to install `conky-all`:

    ```bash
    sudo apt install conky-all
    ```

2.  **Generate Default Conky Configuration:**
    Create a default configuration file for Conky in your `Documents` directory. This will serve as a base:

    ```bash
    conky -C > ~/Documents/conky.config
    ```

3.  **Create Conky Configuration Directory:**
    Establish the dedicated directory for Conky configurations in your home directory:

    ```bash
    mkdir -p ~/.config/conky
    ```

4.  **Download and Apply Conky Guru Configuration:**
    Replace the content of the newly created configuration file with the optimized `conky.conf` from the Conky Desktop Guru repository. You can do this by copying the content from the file linked below into `~/Documents/conky.config` using any text editor:

    [Conky Desktop Guru Configuration File](https://github.com/moabdrabou/Conky_Desktop_Guru/blob/main/conky.conf)

5.  **Copy Configuration to Conky Directory:**
    Move the customized configuration file to the Conky setup directory:

    ```bash
    cp -v ~/Documents/conky.config ~/.config/conky/conky.conf
    ```

## Hardware Configuration Adjustments

This Conky configuration is designed to be as dynamic as possible. However, you may need to adjust the following settings in the `conky.conf` file to match your hardware.

### 1. CPU Core Count

The configuration file contains commented-out examples for CPU core counts of 4, 8, 12, and 16 cores. You need to uncomment the lines that match your CPU and comment out the others.

* **Find your CPU core count:**
    ```bash
    nproc
    ```
* **Edit the `conky.conf` file:**
    Open `~/.config/conky/conky.conf` and find the CPU section. You will see commented-out examples. Adjust them according to your core count.

### 2. Temperature Sensors

To find the correct hwmon path for your CPU temperature, you can use the following commands in the terminal.

* **List available hardware monitoring devices:**
    ```bash
    ls /sys/class/hwmon
    ```
    This will give you a list of `hwmonX` directories.

* **Identify sensor names:**
    For each directory, check its name to find the one related to your CPU (e.g., `k10temp`, `coretemp`):
    ```bash
    cat /sys/class/hwmon/hwmonX/name
    ```
    Once you have found the correct `hwmonX`, you can find the temperature input file by listing the files in that directory. It is usually called `tempY_input`, where Y is a number (usually 1). Then, you can use it in conky like this: `${hwmon X temp Y}`. For example: `${hwmon 3 temp 1}`.

### 3. GPU Monitoring (NVIDIA)

The GPU monitoring section is configured for NVIDIA GPUs and requires the proprietary drivers. It will be automatically hidden if you don't have an NVIDIA card. For AMD or Intel GPUs, you will need to customize the configuration. The `conky.conf` file contains comments with more information.

### 4. Network Interface

While Conky attempts to auto-detect your network adapter, you might need to specify it manually in `conky.conf` if it's not displayed correctly.

*   **Find your network interface name:**
    Open your terminal and run:

    ```bash
    ip a
    ```
    Look for the interface name (e.g., `eth0`, `wlan0`, `enp7s0`). It's usually the one with an IP address assigned to it.

*   **Edit the `conky.conf` file:**
    Open `~/.config/conky/conky.conf` and locate the network section to update the interface name.

## Optional Features

The `conky.conf` file includes some optional features that are commented out by default. You can enable them by editing the file.

### Disk I/O

To enable the disk I/O graph, find the following section in `conky.conf` and uncomment it:

```
--[[Below is for the disk I/O graph, uncomment to enable
${font :size=11}${color}HDD ${color}${hr 2}${color}
${font Light:size=8}${default_color}DISK I/O:${color}${font} ${alignr}$diskio
${voffset 2}${font Light:size=8}${default_color}READ: ${color}${font} ${goto 80}${color4}${diskiograph_read  15,210 ADFF2F 32CD32 750}${color}
${voffset 2}${font Light:size=8}${default_color}WRITE:${color}${font} ${goto 80}${color4}${diskiograph_write 15,210 FF0000 8B0000 750}${color}
--]]
```

### Top Processes

To display the top processes by memory and CPU usage, find and uncomment this section:

```
--[[ Below is for the top processes by memory and CPU usage
${voffset 3}${font :size=11}${color}Processes ${color}${hr 2}${color}
${voffset -15}
${font :size=10}${font Montserrat Light:size=8}${color1}TOTAL:${color}${font} ${alignr}${processes}
${voffset -10} 
${font Montserrat Light:size=9}${color1}APP NAME: ${goto 160}MEMORY: ${goto 245}CPU: ${color}${font}
${voffset -16}
${font Montserrat Light:size=9}${color1}${top_mem name 1} ${color}${font} ${goto 160}${top mem 1} % ${goto 235}${top cpu 1} %
...
--]]
```

## Autostart Conky

To have Conky launch automatically every time your system starts, create an autostart entry for it. The exact steps may vary slightly depending on your desktop environment, but generally, you'll add `conky -c ~/.config/conky/conky.conf` to your startup applications.

🚀 1. Create the Launch Script (Optional but Recommended)

It's best practice to use a small script to ensure a delay and verify the Conky process before launching.

Open your terminal and create a new script file in your home directory (e.g., conkystart.sh):
    
```bash
nano ~/conkystart.sh
```

Paste the following code into the file:

```bash
#!/bin/bash

# Wait 10 seconds to ensure the desktop environment is loaded
sleep 10

# Check if Conky is already running, and kill it if it is
killall conky

# Launch Conky using your configuration file
conky -c ~/.conky.conf &
```

(Note: Replace ~/.conky.conf with the actual path to your configuration file if it's different.)

Save and close the file (Ctrl+S, Ctrl+X in nano).

Make the script executable:
```bash
    chmod +x ~/conkystart.sh
```
⚙️ 2. Add the Script to Startup Applications

Now you'll use the GNOME Startup Applications manager to run this script automatically.

Open the Startup Applications Preferences utility. You can do this by searching for "Startup Applications" in the Activities Overview (pressing the Super key or Windows key) or by running this command in the terminal:
    
```bash
    gnome-session-properties
```
Click the Add button.

In the new window, enter the following details:

- Name: Conky Starter (or any name you prefer)

- Command: /home/yourusername/conkystart.sh (Replace yourusername with your actual Linux username).

- Comment: Launches Conky with a delay

Click Add to save the entry.

🔁 3. Restart and Test

Log out and log back in, or restart your system. Conky should appear automatically after a short delay (10 seconds, as set in the script).

Enjoy your enhanced desktop experience with Conky Desktop Guru!
