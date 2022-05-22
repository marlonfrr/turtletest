# turtletest

A new Flutter project.

## How to run the code

The app uses Flutter version `2.10.4` and Dart enegine version `2.16.2`

The app should work fine on both Android and iOS simulators, so for example to run it on iOS simulator execute the following commands

- `open -a Simulator`
- `flutter run`

## Architecture

The app was built inspired in `MVVM architecture`, which provides a good separation of concerns strategy. This pattern separates the View (views, widgets, components) from the ViewModel (controllers) and the Model (data models). Views are bound to the Model via the ViewModel and reflects all the changes in the widgets. The ViewModel interprets all the commands and inputs that the View triggers, performs business logic and uses the services that brings information from the outside and serializes it to data models.


On the other hand, state management was handled with `Riverpod`, a Provider-inspired library that allows to control the app state out of the widget tree and accessing providers using variables via reference. Also, Riverpod has the ability to inject dependencies and despite it's inspired by Provider, it removes all the boilerplate that makes it very complicated to combine providers.


Also, I use `get_it` library to inject dependencies that I need to use in services. Here I can't use Riverpod to access this instances because I have no BuildContext.

## If I had more time

I would use ConsumerWidget instead of StatelessWidget on widgets that uses `.watch` to react to changes in the state.

I would use flutter hooks to remove some boilerplate and make the code more readable

I would implement git hooks to analyze and test code before any commit

I would finish implementing tests, I ran out of time testing movie view

I would prevent user from double tapping the submit button, I would use a provider to check if comment has been created already to enable button back

