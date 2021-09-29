# NearBy App using MVVM+RxSwift

NearBy is an application that determine nearest places around you based on your location using FourSquare API.

## Features

- Determine nearest places around you
- Two modes (Realtime&Single update)
  - Realtime: automatically fetch nearby places when your location changing
  - Single update: fetch nearby places based on your current location (no auto update)
 - Support IPhone and IPad
 - Support landscape and portrait screen mode

## Tech Stack
- Swift
- RxSwift
- MVVM
- SnapKit
- CoreLocation

## How to build

- Clone the repository
```sh
https://github.com/AmrSaleh07/NearBy.git
```
- Install pods
```sh
cd NearBy
pod install
```
- Open the workspace in Xcode
```sh
$ open "NearBy.xcworkspace"
```
 - Compile and run the app in your simulator
 - if you don't see any data, please check "Simulator" -> "Features" -> "Location" to change the location.
 
## ScreenShots
<img src="https://user-images.githubusercontent.com/27419585/135190391-e3b3e3ae-826d-44ff-82af-4450d05279aa.png"  width="250"/>
<img src="https://user-images.githubusercontent.com/27419585/135190541-95375fee-1269-44a2-bde7-b4ba8a4b5444.png"  width="250"/>
<img src="https://user-images.githubusercontent.com/27419585/135190597-5a915a75-1d25-413c-930d-f04e54b0233a.png"  width="250"/>

