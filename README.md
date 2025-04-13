# alps2alps

Flutter project implements test task for Alps2Alps.
Task description link - https://juicy-note-dec.notion.site/Senior-Flutter-Developer-Test-Assignment-1b21e16ebb0c80a7a815fe9319089fba

For project was use Flutter SDK - 3.29.1, so for run the project this version SKD required.

Application uses Google maps and Google geocoding API that required API key. API key build in application 
and not required to set up it. But, API key will be expire in 1 week after this project will be deliver.

You can check video for review application - Android_video.mp4, iOS_video.mp4

## Overview

What done:
1. Prepare app architecture based on Clean Architecture. So, you can find 2 separate modules inside: data and domain. Also, exis one more separate module design, that is not part of CleanArchitectire, but usually used for encapsulating some logic related to the design system.
2. For API requests I used Dio and some general approach that I used across several projects. Of course it is just a base and real project solutions cover more complicated cases.
3. Implemented base exception processing
4. Implemented core for logging exceptions - it's also the base approach that I used on each project.
5. For state management used BLoc
6. Implemented simple UI, based and general Flutter widgets - please let me know if you expected more quality work at this part
7. For navigation I don't use any third party libs, but just default Navigator. Please let me know if I should demonstrate usage any third party lib like go_router
8. During implementation I used several third party libs: get_it, injectable, flutter_bloc, equatable, dio


What don't do but can be improved:
I didn't move strings to any separate entity or external solution, so all strings are hardcoded in the code. Generally should be done.
I didn't prepared unit tests. In general practices I implements next type of tests: unit, integration, functional 

Hope I clearly understood the task and did what you expected. Ask me any questions about the code or schedule the call to review it. Also, let me know if you are expecting more work in any part, I will be glad to implement.
The total time I spent with this task was around 10 hours.
