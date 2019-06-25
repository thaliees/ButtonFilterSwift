# Button as Filter

[Project created with Xcode V10.2.1] [Deployment Target > 9.0]

## Implement CocoaPods and Pod MaterialComponents/Cards
#### Install CocoaPods.
$ sudo gem install cocoapods

#### Create Podfile within of project
$ pod init

####Modify Podfile
pod 'MaterialComponents/Cards' (Component Card: https://material.io/develop/ios/components/cards/)

#### Install Pod
$ pod install

## Project Base.
Creación de una aplicación que muestra noticias; se creará una lista (de botones) que funcionaran como Etiquetas de Filtrado para mostrar información de acuerdo al botón seleccionado.

## Selected button
Se identifica el botón seleccionado con un color diferente a los demás.