# Currency Converter App

An application that ables the user to select a source currency and converts it to the target currency of choice. These exchange rate data is extracted from a free currency exchange API provider (https://currencylayer.com/documentation).


## Architecture

**MVVM - Router**
- **MVVM** - I used this arhitecture in order to create a separation of concern between the *“views/controls and view controllers”* and the business logic of the app.
- **Router** - This will handle the navigation and screen transition of the app.

## Functional Reactive Programming
**ReactiveSwift**
- I used this library to give me the binding mechanism I need for the MVVM. 

## Dependency Injection
**Swinject**
- This thirdparty library helps the app to split into loosely-coupled components, which can be developed, tested and maintained more easily.

## Local Storage
**Realm**
- I used realm as my database. 
- The reason why I chooses this library over CoreData is that Realm is incredibly fast and easy to use and you will see everything you need will be accomplished with just couple of lines of code regardless it’s reading or writing to database. 

## Folders

**AppCode**
- This folder contains the foundation of the app namely:
- *ApplicationConfig* - Contains the application configuration based on a config .plist. This implementation can help build a separate configuration for every environment (Dev, Staging, Prod).
- *APIClient* - Contains the networking client that will be used to call web service APIs.
- *Gateways* - Contains the access point for Database, Server, Location, etc.
- *Model* - Contains the DTO, database models, and api models
- *Managers* - Contains managers/singletons.
- *Services* - Contains discrete business functions and data interactions between Gateways and ViewModels.
- *Assembly* - Contains different `Assembly` that provide means to organize your `Service` registration in logic groups which allows the user to swap out different implementations of `Services` by providing different `Assembly` instances to the `Assembler`.
- *Router* - Handles the application's main navigation.

**Views**
- This folder contains customized view, either written programmatically or with nibs.

**Features**
- Contains the application's features (i.e., Home & CurrencyPicker)

**Helpers**
- This folder contains Helpers or Views that will be shared/accessable in the entire application.

**Resources**
- Contains the Assets and Configuration plist

