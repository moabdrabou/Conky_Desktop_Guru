# Conky Desktop Guru: Elevate Your Desktop Experience

Enhance your Linux desktop with dynamic and customizable system monitoring using Conky Desktop Guru! This guide will walk you through the installation and configuration process to get a sleek and informative Conky display up and running.

## Preview

Get a glimpse of what your desktop could look like with Conky Desktop Guru:

![Conky Desktop Guru Screenshot](https://github.com/moabdrabou/Conky_Desktop_Guru/blob/main/DesktopGuru.png?raw=true)

## Prerequisites

This Conky configuration uses the **Montserrat** font. To ensure the display renders correctly, please download it from [Google Fonts](https://fonts.google.com/specimen/Montserrat).

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

This Conky configuration is designed to be as dynamic as possible. The **Processor Name** and **Network Adapter** are now detected automatically. However, you may still need to adjust the following settings in the `conky.conf` file to match your hardware.

### 1. CPU Core Count

The configuration file contains examples for different CPU core counts (4, 8, 12). You need to uncomment the lines that match your CPU and comment out the others.

* **Find your CPU core count:**
    ```bash
    nproc
    ```
* **Edit the `conky.conf` file:**
    Open `~/.config/conky/conky.conf` and find the CPU section. You will see commented-out examples. Adjust them according to your core count.

### 2. Temperature Sensors

Configure Conky to display temperature readings from your specific hardware sensors.

* **List available hardware monitoring devices:**
    ```bash
    ls /sys/class/hwmon
    ```
    This will show directories like `hwmon0`, `hwmon1`, etc.

* **Identify sensor names:**
    For each `hwmonX` directory, check its name to find the correct sensor. Replace `hwmon4` with the number you found in the previous step:
    ```bash
    cat /sys/class/hwmon/hwmonX/name
    ```
    Repeat this for all `hwmonX` entries until you find the relevant sensor (e.g., for CPU temperature, it might be `k10temp` or `coretemp`).
    The `conky.conf` file has detailed comments on how to find and set the correct sensor path.

### 3. GPU Monitoring (NVIDIA)

The GPU monitoring section is configured for NVIDIA GPUs and requires the proprietary drivers. It will be automatically hidden if you don't have an NVIDIA card. For AMD or Intel GPUs, you will need to customize the configuration. The `conky.conf` file contains comments with more information.

## Autostart Conky

To have Conky launch automatically every time your system starts, create an autostart entry for it. The exact steps may vary slightly depending on your desktop environment, but generally, you'll add `conky -c ~/.config/conky/conky.conf` to your startup applications.

Enjoy your enhanced desktop experience with Conky Desktop Guru!
