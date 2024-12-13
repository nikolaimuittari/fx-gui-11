# clumsy_library.py
import subprocess
import time

class ClumsyLibrary:
    def __init__(self):
        self.process = None

    def start_clumsy(self, destination_ip, bandwidth_limit):
        # Construct the command to start Clumsy with bandwidth limit
        command = [
            "c:\\QA\\temp\\clumsy_03\\clumsy.exe",  # Replace with the actual path to Clumsy
            "--limit", str(bandwidth_limit),  # Set bandwidth limit
            "--dest", destination_ip,  # Set destination IP
            "--outbound"  # Specify outbound traffic
        ]
        
        # Start Clumsy
        self.process = subprocess.Popen(command)
        time.sleep(2)  # Wait for Clumsy to initialize

    def stop_clumsy(self):
        if self.process:
            self.process.terminate()  # Terminate the Clumsy process
            self.process = None
