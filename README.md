# rikai_app

![simulator_screenshot_5E226CF5-C57D-49EE-9D9D-5184352C6E98](https://user-images.githubusercontent.com/36813561/198622390-5580fe0c-8bd0-4126-ad3b-432a09ffcf16.png)

![simulator_screenshot_C2274257-AFF0-498B-8746-B4566ABB19A3](https://user-images.githubusercontent.com/36813561/198622265-8e4b3792-6865-49a5-90ad-af6c40a5352d.png)

## Core :  (Logic layer)

Flows => router => logic for pages navigation (move from one page to another) will include here
Flows => locator => dependency injection found here using get_it https://pub.dev/packages/get_it
Models = All model classes for APIs will include here
Services = All APIs will include here
ViewModels = All view models for different views(pages) include fall here


## UI:  (Presentation layer)

Shared = All common widgets will fall here I.e  footer, button
Views = These are the pages of the app
Widgets = Pages items will include here, i.e listItem, calendar, login forms

Note: Views = pages / screens


# I use provider for state management 
# I use MVVM for architecture pattern
# I use clean architecture for code separation

