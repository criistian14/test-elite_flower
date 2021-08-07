# Test Elite Flower

Prueba para la empresa Elite Flower hecha en Flutter
con [arquitectura limpia](https://www.youtube.com/playlist?list=PLB6lc7nQ1n4iYGE_khpXRdJkJEp9WOech).

Muestra la consulta a un [api](https://restcountries.eu/rest/v2/alpha/col) que obtiene datos del pais, con
funcionalidades como:

- Guardar datos en Hive, para modo offline
- Modo Dark
- Multilenguaje (Español e Inglés)


# Example

![Preview](https://github.com/criistian14/test-elite_flower/raw/master/assets/preview.gif)
 
---

Escogi el manejador de estados [GetX](https://pub.dev/packages/get) ya que tiene una sintaxis facil, ademas de que separa la logica de la vista.
Tambien tiene algunas utilidades como el manejo de temas, internacionalización, snackbars, que ayudan en el desarrollo de la app.

Y se maneja arquitectura limpia ya facilita futuras actualizacione y mantener mejor la app.

# APK

El apk es completamente funcional y se puede descargar de [aqui](https://github.com/criistian14/test-elite_flower/raw/master/apk/test-elite_flower-christian.apk) (esta en la carpeta apk de este repositorio)

O si se desea se puede generar el apk, despues de descargar el repositorio localmente, con el siguiente comando:

```cmd
flutter build apk
```

# Librerias usadas

- [GetX](https://pub.dev/packages/get)
- [Flutter Native Splash](https://pub.dev/packages/flutter_native_splash)
- [Flutter Launcher Icons](https://pub.dev/packages/flutter_launcher_icons)
- [Flutter ScreenUtil](https://pub.dev/packages/flutter_screenutil)
- [Hive](https://pub.dev/packages/hive)
