# DU-AR-Racing.json
Augmented reality system for Dual Universe
![0d783cc74bc4aada9cc8d7f3476da7e](https://github.com/JeronimoDU/DU-AR-Racing-system/assets/75027025/ae2baa7c-b8e3-453a-b2ac-f44ec56d0425)
<br>
<br>

## Augmented reality waypoints for physical races anywhere at anytime
<br>
<br>
  
JSON AR-Racing script is to be installed in a programing board on your ship

Download and open with text file, copy content, ingame right clik on programming board, paste from clipboard
| Elements needed | Requierement | Link |
| ------ | ------ | ------ |
| Receiver | Necessary | To be linked on programming board 1st slot! |
| Core | Necessary | Any |
| Databank | Necessary | Any |
| Emitter | Necessary | Any |
| Transponder | Optional / only used for map screen | none |
| Screen | Optional / only used for track recording mode | Any |
<br>
<br>

## Race mode
| Chat Command | Description |
| ------ | ------ |
| force start | Force starts the current race |
| reset race | Restarts the script |
| reset all | Clears databank |
| remove trackName | Remove a specific track from databank |

| Key bind | Description |
| ------ | ------ |
| ALT+9 | Force starts the current race |
<br>
<br>

## Recodring mode
Only available if recordingMode = true (check recordingMode variable in unit start of the script)

Can automatically save a waypoint list along the path you are flying
| Chat Command | Description |
| ------ | ------ |
| distance X | Changes the waypoints auto recording distance(replace X by a number) |
| print to screen | Saves waypoints list into screen content |

| Key bind | Description |
| ------ | ------ |
| ALT+6 | Repops first waypoint marker |
| ALT+7 | Adds manual waypoint |
| ALT+8 | Removes last saved waypoint |
| ALT+9 | Starts auto recording mode |
<br>
<br>

## Parameters
![dualuniverse_2023-06-10_00h11m15s](https://github.com/JeronimoDU/DU-AR-Racing-system/assets/75027025/57a89026-494f-4d9b-b3c7-5e8217b810b1)
<br>
<br>

## Audio
The script comes with a sound system which can be downloaded at the top of this page

Sounds have to be placed in C:\YOURNAME\Documents\NQ\DualUniverse\audio\
<br>
<br>
<br>
<br>

# DU Racing tracks
All the DU Racing tracks waypoints can be downloaded onto your ship at Hadron's custom upload server
<br>
<br>
<br>
<br>

# DU-AR-Racing-Leader board.json
## Programming board code for screen score board display
<br>
<br>

Download and open with text file, copy content, ingame right clik on programming board, paste from clipboard
| Elements needed | Requierement | Link |
| ------ | ------ | ------ |
| Receiver | Necessary | To be linked on programming board 1st slot! |
| Databank | Necessary | Any |
| Manual Switch | Necessary / Sorts best total time or best lap time | Any |
| Manual Switch | Necessary / elements needs to be named "kill" (kill switch linked to receiver and PB) | Any |
| Screens | Necessary / can link multiple screens | Any |
<br>
<br>

Only admin has acces to chat commands
| Chat Command | Description |
| ------ | ------ |
| reset all | Clears databank |
| remove playerName | Removes a specific player from databank |
<br>
<br>
<br>
<br>

# DU-AR-Racing-Screen map.json
## Programming board code for screen map display
<br>
<br>

Download and open with text file, copy content, ingame right clik on programming board, paste from clipboard
| Elements needed | Requierement | Link |
| ------ | ------ | ------ |
| Receiver | Necessary | To be linked on programming board 1st slot! |
| Core | Necessary | Any |
| Databank | Necessary | Any |
| Transponder | Necessary | Any |
| Emitter | Necessary | Any |
| Screens | Necessary / can link multiple screens | Any |
<br>
<br>

Only admin has acces to chat commands and keybinds
| Chat Command | Description |
| ------ | ------ |
| reset params | Resets xy/scale/rot of waypoints on the screen |
| reset orientation | Resets orientation vectors saved on first activation |
| reset all | Clears databank |
| remove trackName | Remove a specific track from databank |
<br>
<br>

| Key bind | Description |
| ------ | ------ |
| A/D | Displaces waypoints on screen on X |
| W/S | Displaces waypoints on screen on Y |
| Q/E | Rotates waypoints on screen |
| ALT+A/ALT+D | Rescales waypoints on screen |
<br>
<br>
<br>
<br>

# DU-AR-Racing DIY kit available at Hadron

Go get your free racing kit at Hadron, with all prebuilt and preinstalled scripts ready to use!!!!

::pos{0,2,-21.6022,122.3792,-0.0001}
<br>
<br>
<br>
<br>

# COPY RIGHTS:

You are free to use / modify it at will

If anyone is interested to study it and develop further its possibilities, i ll be glad to communicate with you about it and post here some eventual updates made by other players

DISCORD: Jeronimo#4624
