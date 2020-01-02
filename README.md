# Events
![](https://img.shields.io/badge/coverage-22.0%25-green.svg)

## Purpose
- Create an iOS app using the Swift language that consumes a REST API and displays an event listing.
- Each list item must allow access to event details.
- In the event detail it is important to display your check-in and sharing information and options

## Installation

Using the terminal, go to the project folder where the Podfile is located and execute the command bellow.
```
$ pod install
```

## Requirements
- iOS 10 or greater
- Xcode 10.2 or greater
- Swift 5 or greater 
- CocoaPods 1.8.4 or greater

## Design patterns
- MVVM

## Third-party libraries
- RxSwift. Used to enable easy composition of asynchronous operations and event/data streams.
- Kingfisher. Used to download and cache images.
- SwiftLint. Used to enforce code style and conventions.

## Features
- Service
- [x] Fetch events
- [x] Fetch event
- [x] Check-In
- Events
- [x] Show event list
<br/>
- Event Detail
- [x] Show event detail
- [x] Share event
- [x] Show event location on map
- [x] Show route to event
- [x] Go to check-in
<br/>
- Check-in
- [x] Do check-in
- [x] Validate fields
- [x] Show feedback in case of error
<br/>
- Localize
- [x] English (en)
- [x] Portuguese (pt-br)

## To Do
- [ ] Create more unit tests.
- [ ] Create UI tests.
