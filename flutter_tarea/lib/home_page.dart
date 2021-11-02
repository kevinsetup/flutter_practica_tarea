import 'package:flutter/material.dart';
import 'details_page.dart';

List<ImageDetails> _images = [
  ImageDetails(
    imagePath: 'images/1.jpg',
    titan:
        'Titan : Titán de atraque -- Titán Fundador -- Titán Martillo de Guerra ',
    title: 'Eren Jaeger',
    details:
        'Eren Jaeger (エレン・イェーガー Eren Yēgā?) es el protagonista principal de la serie. Es el único hijo de Grisha y Carla Jaeger. A su vez, es el medio hermano menor de Zeke Jaeger, el hermano adoptivo de Mikasa Ackerman y un Titán Cambiante, siendo el último portador del Titán de Ataque (進撃の巨人 Shingeki no Kyojin?)',
  ),
  ImageDetails(
    imagePath: 'images/2.png',
    titan: 'Titan : Titán Acorazado',
    title: 'Reiner Braun',
    details:
        'Reiner Braun (ライナー・ブラウン Rainā Buraun?) fue el vice-comandante (副長 Fukuchō?) de la unidad de los Guerreros y el protagonista principal de la serie desde la perspectiva marleyana, nació y creció en la zona de internamiento de Liberio como hijo ilegitimo de una mujer eldiana y un padre marleyano. Eventualmente, entró a la unidad de cadetes Eldianos y a la edad de 10 años fue seleccionado para heredar el poder del Titán Acorazado.',
  ),
  ImageDetails(
    imagePath: 'images/3.jpg',
    titan: 'Titan :Titán Hembra',
    title: 'Annie Leonhart',
    details:
        'Annie Leonhart (アニ・レオンハート Ani Reonhāto?) fue la recluta de la Tropa de Reclutas del Ciclo Nº104, cuarta en el top 10 de su clase y una ex-miembro de la Policía Militar. Ella, al igual que Reiner Braun y Bertolt Hoover, poseía la habilidad de transformarse en un titán y servía a una unidad de soldados de Marley conocidos como guerreros.',
  ),
  ImageDetails(
    imagePath: 'images/4.jpg',
    titan: 'Titan :Titán Bestia',
    title: 'Zeke Jaeger',
    details:
        'Zeke Jaeger (ジーク・イェーガー Jīku Yēgā?) fue el Jefe de Guerra (戦士帳 Senshi-chō?) de la unidad de los guerreros eldianos de Marley y último poseedor del poder del Titán Bestia (獣の巨人 Kemono no Kyojin?). Hijo de Grisha y Dina Jaeger, además de ser medio hermano mayor de Eren Jaeger, Zeke fue uno de los últimos descendientes de la familia real Fritz. Durante la mayor parte de su vida, Zeke demostró una profunda lealtad a Marley, habiendo entregado a sus propios padres a las Autoridades de Seguridad Pública luego de que estos lo infiltraran en el programa de guerreros con el propósito de obtener al Titán Fundador',
  ),
];

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const SizedBox(
              height: 80,
            ),
            const Text(
              'Todos los titanes de SNK',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 40,
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 30,
                ),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                ),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemBuilder: (context, index) {
                    return RawMaterialButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailsPage(
                              imagePath: _images[index].imagePath,
                              title: _images[index].title,
                              titan: _images[index].titan,
                              details: _images[index].details,
                              index: index,
                            ),
                          ),
                        );
                      },
                      child: Hero(
                        tag: 'logo$index',
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            image: DecorationImage(
                              image: AssetImage(_images[index].imagePath),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                  itemCount: _images.length,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ImageDetails {
  final String imagePath;
  final String titan;
  final String title;
  final String details;
  ImageDetails({
    @required this.imagePath = "",
    @required this.titan = "",
    @required this.title = "",
    @required this.details = "",
  });
}
