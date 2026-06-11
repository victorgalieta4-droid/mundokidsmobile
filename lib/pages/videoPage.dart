import 'package:flutter/material.dart';

class VideoPage extends StatelessWidget {

  final String titulo;
  final String videoId;

  const VideoPage({
    super.key,
    required this.titulo,
    required this.videoId,
  });

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: Text(titulo),
      ),

      body: SingleChildScrollView(

        child: Padding(
          padding: const EdgeInsets.all(16),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [

              ClipRRect(

                borderRadius: BorderRadius.circular(15),

                child: Image.network(
                  "https://img.youtube.com/vi/$videoId/0.jpg",

                  width: double.infinity,
                  height: 220,
                  fit: BoxFit.cover,
                ),
              ),

              const SizedBox(height: 20),

              Text(
                titulo,

                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              const Row(
                children: [

                  Icon(Icons.remove_red_eye),

                  SizedBox(width: 5),

                  Text("4.8K visualizações"),
                ],
              ),

              const SizedBox(height: 25),

              const Text(
                "Descrição",

                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              const Text(
                "Aqui vai a descrição do vídeo. "
                    "Você pode colocar informações, "
                    "categoria, autor e muito mais.",
              ),

              const SizedBox(height: 30),

              Center(
                child: ElevatedButton(

                  onPressed: () {

                  },

                  child: const Text("Assistir Agora"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}