[![Status](https://img.shields.io/badge/status-WIP-red)](https://github.com/besya/swift-tui)

# SwiftTUI
**NOTICE: This library is under active development and is not ready for use in production or any other environment. Use at your own risk.**

Current version: 0.0.1-dev (unstable, experimental)

SwiftUI-like library for building CLI applications.

## Features

- 🚀 Compile-time safety 
- 💪 Type-safe ASCII and ANSI libraries under the hood
- 🧰 Convenient output styling
- ✨ Pure Swift implementation

## Installation

### Swift Package Manager

Add the following to your `Package.swift` file:

```swift
let package = Package(
    // name, platforms, products, etc.
    dependencies: [
        // other dependencies
        .package(url: "https://github.com/swiftconsole/swift-tui.git", branch: "main"),
    ],
    targets: [
        .target(name: "<library>", dependencies: [
            // other dependencies
            .product(name: "SwiftTUI", package: "swift-tui"),
        ]),
        // other targets
    ]
)
```

## Usage

### Import

```swift
import SwiftTUI
```

### Text 

```swift
@main
struct Cli {
    static func main() async {
        let greeting = Text("Hello world!")
        print(greeting.render())
    }
}
```

```
> swift run
Building for debugging...
[7/7] Applying example
Build of product 'example' complete! (1.31s)
Hello world!
```

### Styling

```swift
let greeting = Text("Hello world!")
    .style(.bold, .italic, .color(.brightMagenta))

print(greeting.render())
```

```swift
import SwiftTUI
import ANSI

@main
struct Cli {
    static func main() async {
        let primaryColor: Color = .rgb(255, 135, 215)
        let backgroundColor: Color = .black
        
        let expressivePinky: [Text.TextStyle] = [
            .color(primaryColor),
            .background(backgroundColor),
            .bold,
            .italic
        ]
        
        let greeting = Text("Hello world!").style(expressivePinky).style(.invert)
        print(greeting.render())
    }
}
```

### Views

```swift
import SwiftTUI
import ANSI

struct Fruit {
    let name: String
    let color: Color
}

struct FruitItem: View {
    let name: String
    let color: Color
    
    var body: some View {
        Text(name).style(.color(color))
    }
}

struct FruitList: View {
    let fruits: [Fruit]

    var body: some View {
        VStack {
            for fruit in fruits {
                FruitItem(name: fruit.name, color: fruit.color)
            }
        }
    }
}

@main
struct FruitsApp {
    static func main() async {
        let fruits = [
            Fruit(name: "apple", color: .red),
            Fruit(name: "lemon", color: .yellow),
            Fruit(name: "kiwi", color: .green)
        ]
        
        let view = FruitList(fruits: fruits)
        print(view.render())
    }
}
```

### Inspection

Inspecting generated sequences can be a really useful feature in some scenarios. 

Using previous example

```swift
@main
struct FruitsApp {
    static func main() async {
        let fruits = [
            Fruit(name: "apple", color: .red),
            Fruit(name: "lemon", color: .yellow),
            Fruit(name: "kiwi", color: .green)
        ]
        
        let view = FruitList(fruits: fruits)
        print(view.render())
        
        print(view.inspect(as: .escaped))
        // Prints \x1b[31mapple\x1b[0m\x1b[33mlemon\x1b[0m\x1b[32mkiwi\x1b[0m
        
        print(view.inspectList(as: .escaped))
        // Prints ["\\x1b", "[", "3", "1", "m", "apple", "\\x1b", "[", 
        // "0", "m", "\\x1b", "[", "3", "3", "m", "lemon", "\\x1b", "[", "0", 
        // "m", "\\x1b", "[", "3", "2", "m", "kiwi", "\\x1b", "[", "0", "m"]
        
        print(view.inspectList(as: .name))
        // Prints ["escape", "leftBracket", "digit3", "digit1", "m", "apple", "escape", 
        // "leftBracket", "digit0", "m", "escape", "leftBracket", "digit3", "digit3", 
        // "m", "lemon", "escape", "leftBracket", "digit0", "m", "escape", "leftBracket", 
        // "digit3", "digit2", "m", "kiwi", "escape", "leftBracket", "digit0", "m"]
    }
}
```

## Requirements

- Swift 6.0+
- iOS 13.0+ / macOS 10.15+ / tvOS 13.0+ / watchOS 6.0+

## License

This project is available under the MIT license. See the LICENSE file for more info.

## Contributing
This project is still in early development. Contributions or suggestions are welcome, but please do not use this library in any projects yet.
