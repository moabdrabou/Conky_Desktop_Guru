# Conky Desktop Guru: Elevate Your Desktop Experience

Enhance your Linux desktop with dynamic and customizable system monitoring using Conky Desktop Guru! This guide will walk you through the installation and configuration process to get a sleek and informative Conky display up and running.

## Preview

Get a glimpse of what your desktop could look like with Conky Desktop Guru:

![Conky Desktop Guru Screenshot](https://github.com/moabdrabou/Conky_Desktop_Guru/blob/main/DesktopGuru.png?raw=true)

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

To ensure Conky accurately displays your system's information, you'll need to adjust some parameters in the `conky.conf` file based on your hardware.

### 1. Network Adapter

Identify your network adapter's name and update the `conky.conf` accordingly.

* **Find your network adapter:**
    ```bash
    sudo ifconfig
    ```
    (Example: Replace `enp6s0` with your adapter's name.)

    ![Network Adapter Example](https://github.com/moabdrabou/Conky_Desktop_Guru/blob/main/Lan.png?raw=true)

### 2. Processor Name

Update the processor name in the configuration to match your system's CPU.

* **Example:**
    Replace `"AMD Ryzen 5 @ 3.60GHz"` with your actual processor name.

    ![Processor Name Example](https://github.com/moabdrabou/Conky_Desktop_Guru/blob/main/Processor.png?raw=true)

### 3. CPU Core Count

Conky needs to know the number of cores your CPU has for accurate monitoring.

* **Find your CPU core count:**
    ```bash
    nproc
    ```

### 4. Temperature Sensors

Configure Conky to display temperature readings from your specific hardware sensors.

* **List available hardware monitoring devices:**
    ```bash
    ls /sys/class/hwmon
    ```
    This will show directories like `hwmon0`, `hwmon1`, etc.

* **Identify sensor names:**
    For each `hwmonX` directory, check its name to find the correct sensor. Replace `hwmon4` with the number you found in the previous step:
    ```bash
    sudo cat /sys/class/hwmon/hwmon4/name
    ```
    Repeat this for all `hwmonX` entries until you find the relevant sensor (e.g., for CPU temperature).

    ![Temperature Sensors Example](https://github.com/moabdrabou/Conky_Desktop_Guru/blob/main/Sensors.png?raw=true)

## Autostart Conky

To have Conky launch automatically every time your system starts, create an autostart entry for it. The exact steps may vary slightly depending on your desktop environment, but generally, you'll add `conky -c ~/.config/conky/conky.conf` to your startup applications.

Enjoy your enhanced desktop experience with Conky Desktop Guru!
