# TikTok
A native iOS mobile application that copies the actual TikTok(https://www.tiktok.com) mechanics - Swipe top/down to play live streamed videos. 20 already streamed videos are fed from a Ruby backend 



# Functionalities
 * Swipe up/down to switch between videos from web service(Core feature of the application which needed to be fully     implemented)
 * Profile View with static data
 * Search view with static data
 * Comment section(Last implemented view due to only UI Controls which needed to be manipulated)



## Getting Started
These instructions will get you a copy of the project up and running on your local machine for testing. 



 
 
### Prerequisites
* Min XCode Version 10.1
* Min. iOS Version 11.0
  - This application makes use of AVVideoCodecType & AVCapturePhoto. AVVideoCodecType are Constants that describe video   codecs for capture. AVCapturePhoto is a container for image data collected by a photo capture output. They both require iOS 11 or newer
  - Since all new apps for iPhone, including universal appsmust support the Super Retina display of the iPhone X

 ## How to run

 * Clone project into desired location
 * Run pod install in root directory
 * Open "StreamLabsAssignment.xcworkspace" 
 * Clean/Build project to be sure everything is set and you're good to go.


### Product & Technical Dcisions 

-This application makes use of the MVP architecture for its main functionality. The three components of the MVP pattern communicate to each other through clearly defined interfaces. this makes updates and enhancements much easier through out the application cycle.

The core functionality of this application makes use of the native iOS frameworks including:
 - URLSessions for making web requests(The URLSession class and related classes provide an API for downloading data from and uploading data to endpoints indicated by URLs)
 - AVPlayer(An AVPlayer is a controller object used to manage the playback and timing of a media asset)
 
 Using the core frameworks rather than thrird-party libraries(which are also as effiicent) gives a better understanding  of  what's going on with your network requests,audio, videos ,networks responses and they provide more customizability with all their delegate methods.



## Extra Dependences 
* https://github.com/hackiftekhar/IQKeyboardManager

#Web Service Main File
* https://gist.github.com/invisibleBully/5bad78b6c6093b20a2945b694a5d2ff0
