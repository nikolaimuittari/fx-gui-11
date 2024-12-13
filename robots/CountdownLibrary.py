import time
from robot.api.deco import keyword

class CountdownLibrary:

    @keyword
    def countdown_sleep(self, seconds):
        # Convert seconds to an integer
        seconds = int(seconds)
        for i in range(seconds, 0, -1):
            print(f"Sleeping... {i} seconds remaining")
            time.sleep(1)
        print("Sleep complete.")
