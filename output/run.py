


import os
import subprocess
from datetime import datetime

def run_tests():
    """Runs Robot Framework tests with dynamic output directories."""
    try:
        # Create a unique output directory based on date and time
        timestamp = datetime.now().strftime("%Y%m%d_%H%M%S")
        output_dir = os.path.join("output", f"run_{timestamp}")
        logs_dir = os.path.join(output_dir, "logs")  #Logları tutacak klasör adı

        # Define the command to run Robot Framework
        command = [
            "robot",
            "--outputdir", output_dir,      # Tüm çıktıların ana dizini
            "--log", os.path.join(logs_dir, "log.html"),
            "--report", os.path.join(logs_dir, "report.html"),
            "--consolecolors", "on",
            "--pythonpath", "resources",
            "tests"  # Specifies the path to the test suites
        ]

        # Execute the command
        process = subprocess.Popen(command, stdout=subprocess.PIPE, stderr=subprocess.PIPE)

        # Capture the output
        stdout, stderr = process.communicate()

        # Print the output and any errors
        print(stdout.decode("utf-8"))
        if stderr:
            print(f"Errors:\n{stderr.decode('utf-8')}")

        # Get the exit code
        exit_code = process.returncode
        if exit_code == 0:
            print("Testler basari ile tamamlandi.")
        else:
            print(f"Testler hata ile tamamlandi. Exit code: {exit_code}")

    except FileNotFoundError:
        print("Robot Framework komutu bulunamadi. Robot Framework'un yüklendiginden ve PATH'e eklendiginden emin olun.")

if __name__ == "__main__":
    run_tests()