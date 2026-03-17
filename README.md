# 📸 Carrossel de Imagens - Flutter

Um carrossel automático de imagens + galeria em grid. Basicamente você consegue:

- 📸 Um carrossel que passa imagens automaticamente
- 🖼️ Uma galeria em grid pra ver as imagens em miniatura
- 👆 Clica numa imagem e abre em tela cheia

## Como rodar

```bash
flutter pub add carousel_slider
flutter run
```

## O que tem no código

**CarouselSlider** - faz o carrossel passar as imagens sozinho  
**GridView** - mostra as imagens em 3 colunas  
**GestureDetector** - detecta quando você clica  
**showDialog** - abre a imagem em tela cheia

## Customizar

Quer mais colunas? Muda o `crossAxisCount`:
```dart
crossAxisCount: 4,  // pronto, 4 colunas
```

Quer outras imagens? Só adiciona na lista:
```dart
imagens.add("sua-url-aqui");
```

Quer parar o carrossel automático?
```dart
autoPlay: false,
```

É isso! 🚀
