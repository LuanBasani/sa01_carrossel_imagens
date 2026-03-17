// Situação de aprendizagem 01 - Carrossel de imagens no flutter
// usar uma lista de imagens para montar um carrossel no flutter

// flutter pub add carousel_slider (Biblioteca do flutter pub get)
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(), // remover a flag do debug do flutter (remover a bandeirinha de debug)
  ),
  );
}

class MyApp extends StatelessWidget {
  //remover o const
  //para usar a lista de imagens, não pode ser const, pois a lista é mutável
  MyApp({super.key});

  // lista de imagens para o carrossel
  List<String> imagens = [
    "https://images.unsplash.com/photo-1506748686214-e9df14d4d9d0",
    "https://images.unsplash.com/photo-1521747116042-5a810fda9664",
    "https://images.unsplash.com/photo-1504384308090-c894fdcc538d",
    "https://images.unsplash.com/photo-1518837695005-2083093ee35b",
    "https://images.unsplash.com/photo-1501594907352-04cda38ebc29",
    "https://images.unsplash.com/photo-1519681393784-d120267933ba",
    "https://images.unsplash.com/photo-1531259683007-016a7b628fc3",
    "https://images.unsplash.com/photo-1506619216599-9d16d0903dfd",
    "https://images.unsplash.com/photo-1494172961521-33799ddd43a5",
    "https://images.unsplash.com/photo-1517245386807-bb43f82c33c4",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Galeria de Imagens"),
      centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            //Carrossel de imagens
          CarouselSlider(
            options: CarouselOptions(
              height: 300, // altura do carrossel
              autoPlay: true, // para o carrossel passar as imagens automaticamente
            ),
            items: imagens.map( //percorrer meu vetor(array/list)
                  ((url) => Container(
                    margin: EdgeInsets.all(8),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(url, fit: BoxFit.cover, width: 1000)
                    ),
                  ))
            ).toList(),
            ),
            // Galeria de imagens
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, // número de colunas
                  crossAxisSpacing: 8, // espaçamento entre as colunas
                  mainAxisSpacing: 8, // espaçamento entre as linhas
                ),
                itemCount: imagens.length, // número de itens na lista de imagens
                //construtor do grid
                //construindo usando um foreach para percorrer a lista de imagens
                itemBuilder: (context, index)=> //arrow function
                GestureDetector(
                  onTap: () => _mostrarImagem(context, index), // função para mostrar a imagem em tela cheia
                  child: ClipRRect(borderRadius: BorderRadius.circular(8),
                  child: Image.network(imagens[index],fit: BoxFit.cover,),
                  ),
                )
                )
            )
          ],
        ),
      ),
    );
  }
  void _mostrarImagem(BuildContext context, int index) {
    //mpostrar imagens com mais detalhe ao ser clicada, 
    //precisa do index da image
    //showDialog para mostrar a imagem em tela cheia
    showDialog(
      context: context, 
      builder: (context) => Dialog(
        child: Image.network(imagens[index]),
      ),
    );
  }
}