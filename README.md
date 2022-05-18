# Stopwatch
StopWatch

Create a simple stopwatch app using SwiftUI. Your application will consist of the current running time, two buttons, and a section that contains the laps. The application will also save lap data and any current time when the user places the app in the background.



**Requirements**:

1. The clock will be minutes, seconds and centiseconds and will be required to update, at minimum, every centisecond. The screen should display the format: 00:00.00 where (from left to right) the first set is minutes, middle is seconds, last is centiseconds. 
    - If the stopwatch is stopped the timer should stop “ticking”

    - When the stopwatch is resumed, the timer should pick up right were it left off and NOT add any additional time that may have pass while stopped

    - The speed of the clock should match ACTUAL time.

    - Your clock will be driven by a ViewModel and changes will be Published to the views that need to observe the changes.

2. Your screen will only have two buttons labeled as: Start/Stop, and Lap/Reset 

    - Your buttons will ONLY say one of the two options at any given time

    - Your buttons must display the proper text for the given “state” of the stopwatch

      - If watch is not running: Start (enabled), Lap (disabled)

      - If watch is running: Stop (enabled), Lap (enabled)

      - If watch is paused: Start (enabled), Reset (enabled)

    - Your buttons should have more than just text (make something better) 

3. You will have a list of laps that are recorded when the Lap button is pressed 

    - Laps should only be the difference from the previous lap and NOT since the start of the clock

    - Laps should add the proper amount of time

    - If the stopwatch is paused for a duration, it should also pause the amount of time that would be added to the lap
