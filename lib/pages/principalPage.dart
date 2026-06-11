import 'dart:ui';
import 'package:flutter/material.dart';
import 'perfilPage.dart';
import 'videoPage.dart';

class principalPage extends StatefulWidget {
  final VoidCallback trocarTema;
  const principalPage({super.key, required this.trocarTema});

  @override
  State<principalPage> createState() => _principalPageState();
}

class _principalPageState extends State<principalPage> {
  bool pesquisando = false;
  int paginaAtual = 0;

  final List<Map<String, String>> videos = [
    {"titulo": "Batman vs Flash", "videoId": "1F4_WEkQwqQ"},
    {"titulo": "Pica-Pau em português", "videoId": "A1Hjezg7bIw"},
    {"titulo": "Tartarugas Ninjas", "videoId": "_SPclBk_lZ4"},
    {"titulo": "Homem Aranha", "videoId": "_MqImMufNaM"},
    {"titulo": "Dragon Ball", "videoId": "qjHck3UHDXU"},
    {"titulo": "Naruto Clássico", "videoId": "QczGoCmX-pI"},
  ];

  List<Map<String, String>> videosFiltrados = [];

  @override
  void initState() {
    super.initState();
    videosFiltrados = videos;
  }

  void pesquisarVideo(String texto) {
    setState(() {
      videosFiltrados = videos.where((v) =>
          v["titulo"]!.toLowerCase().contains(texto.toLowerCase())).toList();
    });
  }

  void _showProfileMenu() {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    showModalBottomSheet(
      context: context,
      backgroundColor: isDark ? const Color(0xFF2A2A2A) : Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: const Icon(Icons.notifications_outlined),
            title: const Text("Notificações"),
            onTap: () { Navigator.pop(context); /* navegar para notificações */ },
          ),
          ListTile(
            leading: const Icon(Icons.search),
            title: const Text("Pesquisar"),
            onTap: () {
              Navigator.pop(context);
              setState(() => pesquisando = true);
            },
          ),
          ListTile(
            leading: const Icon(Icons.person_outline),
            title: const Text("Meu Perfil"),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (_) => const perfilPage()));
            },
          ),
          ListTile(
            leading: Icon(widget.trocarTema != null ? Icons.dark_mode_outlined : Icons.light_mode),
            title: Text(Theme.of(context).brightness == Brightness.dark ? "Tema Claro" : "Tema Escuro"),
            onTap: () {
              Navigator.pop(context);
              widget.trocarTema();
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final primaryColor = isDark ? const Color(0xFFFF4A8A) : const Color(0xFFFF6B9D);

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        toolbarHeight: 60,
        backgroundColor: isDark ? const Color(0xFF1F1F1F) : Colors.white,
        elevation: 0,
        title: Row(
          children: [
            Image.asset('assets/images/logo.png', height: 45), // Coloque seu logo aqui
            const SizedBox(width: 8),
            const Text(
              "Mundo Kids",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_outlined),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () => setState(() => pesquisando = true),
          ),
          IconButton(
            icon: const CircleAvatar(
              radius: 16,
              backgroundColor: Color(0xFFFF9A6C),
              child: Icon(Icons.person, size: 18, color: Colors.white),
            ),
            onPressed: _showProfileMenu,
          ),
          const SizedBox(width: 8),
        ],
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: paginaAtual,
        onTap: (index) => setState(() => paginaAtual = index),
        backgroundColor: isDark ? const Color(0xFF2A2A2A) : Colors.white,
        selectedItemColor: primaryColor,
        unselectedItemColor: isDark ? Colors.grey[400] : Colors.grey[600],
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.play_circle_outline), label: "Vídeos"),
          BottomNavigationBarItem(icon: Icon(Icons.favorite_border), label: "Favoritos"),
        ],
      ),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              if (pesquisando)
                Padding(
                  padding: const EdgeInsets.only(top: 8, bottom: 16),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      color: isDark ? const Color(0xFF3A2A4A) : Colors.white,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            autofocus: true,
                            onChanged: pesquisarVideo,
                            decoration: const InputDecoration(
                              hintText: "Pesquisar...",
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.close),
                          onPressed: () => setState(() {
                            pesquisando = false;
                            videosFiltrados = videos;
                          }),
                        ),
                      ],
                    ),
                  ),
                ),

              // Categorias / Tabs
              Row(
                children: [
                  SizedBox(width: 55),
                  _buildTab("Recomendados", true),
                  const SizedBox(width: 12),
                  _buildTab("Outras", false),
                ],
              ),

              const SizedBox(height: 20),

              // Lista de Vídeos
              Expanded(
                child: ListView.builder(
                  itemCount: videosFiltrados.length,
                  itemBuilder: (context, index) {
                    return VideoCard(
                      titulo: videosFiltrados[index]["titulo"]!,
                      videoId: videosFiltrados[index]["videoId"]!,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTab(String text, bool selected) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
      decoration: BoxDecoration(
        color: selected ? const Color(0xFFFF6B9D) : Colors.transparent,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: selected ? Colors.white : Colors.grey,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

// ==================== VIDEO CARD (Estilo Mumu Kids) ====================
class VideoCard extends StatelessWidget {
  final String titulo;
  final String videoId;

  const VideoCard({super.key, required this.titulo, required this.videoId});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => VideoPage(titulo: titulo, videoId: videoId),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 24),
        decoration: BoxDecoration(
          color: isDark ? const Color(0xFF2A2A2A) : Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              child: Stack(
                children: [
                  Image.network(
                    "https://img.youtube.com/vi/$videoId/maxresdefault.jpg",
                    height: 180,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) => Container(
                      height: 180,
                      color: Colors.grey[800],
                      child: const Icon(Icons.play_circle, size: 50, color: Colors.white54),
                    ),
                  ),
                  const Positioned(
                    bottom: 10,
                    right: 10,
                    child: Text(
                      "7:31",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        backgroundColor: Colors.black54,
                        fontSize: 13,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    titulo,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 6),
                  const Text(
                    "Canal Oficial • 4K visualizações • 18 Jun 2026",
                    style: TextStyle(fontSize: 13, color: Colors.grey),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}