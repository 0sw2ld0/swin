Swin
========

[![Version](https://img.shields.io/cocoapods/v/Swin.svg?style=flat)](https://cocoapods.org/pods/Swin)
[![License](https://img.shields.io/cocoapods/l/Swin.svg?style=flat)](https://cocoapods.org/pods/Swin)
[![Platform](https://img.shields.io/cocoapods/p/Swin.svg?style=flat)](https://cocoapods.org/pods/Swin)



Swin is a library of service locators to help you use IoC in your projects


## Requirements

- iOS 10.0+ / Mac OS X 10.10+
- Xcode 12+

## Installation

Swin is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
platform :ios, '10.0'
use_frameworks!

pod 'Swin'
```
Use `pod install` command. For more info of the installation and usage of CocoaPods, [CocoaPods website](https://cocoapods.org).

## Usage

### Our class or struct

We created the next `Animal` protocol: 

```swift
protocol Animal {
    var name: String {get set}
    func say() -> String
}

```
After that we have the `Dog ` struct:

```swift
struct Dog: Animal {
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    func say() -> String {
        "Guau Guau"
    }
}
```

Also we have the `cat` struct:

```swift
struct Cat: Animal {
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    func say() -> String {
        "Miau Miau"
    }
}
```

Then we have the struct PetOwner, we assign the values inside in `PetOwner` using the annotation `@Inject`

```swift
struct PetOwner {
    @Inject var dog: Animal
    @Inject var cat: Cat
}
```

### Creating the modules

We created the demoModule Module:

```swift
let demoModule = module { container in
	container.factory { Dog(name: "Fido") as Animal}
	container.factory { Cat(name: "Tiger")}
}
```

### Start Swin

We in the AppDelegate let's star Swin

```swift
func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
	Swin.modules(demoModule)
	Swin.start()
   /* some code */
   return true
}
```
 


## Author

Oswaldo Leon, oswaldo.leon9@gmail.com

## License

Swin is available under the MIT license. See the LICENSE file for more info.
