import 'package:flutter/material.dart';

class PrimeiraPagina extends StatelessWidget {
  const PrimeiraPagina({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mundo Kids"),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,

          children: [

            DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.red,
              ),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,

                children: [

                  const CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.white,

                    child: Icon(
                      Icons.person,
                      size: 40,
                      color: Colors.red,
                    ),
                  ),

                  const SizedBox(height: 10),

                  const Text(
                    "Hamburgueria Umarama",

                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const Text(
                    "Seu aplicativo de pedidos",

                    style: TextStyle(
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
            ),

            ListTile(
              leading: const Icon(Icons.home),
              title: const Text("Início"),

              onTap: () {
                Navigator.pop(context);
              },
            ),

            ListTile(
              leading: const Icon(Icons.fastfood),
              title: const Text("Produtos"),

              onTap: () {
                Navigator.pop(context);
              },
            ),

            ListTile(
              leading: const Icon(Icons.shopping_cart),
              title: const Text("Carrinho"),

              onTap: () {
                Navigator.pop(context);
              },
            ),

            ListTile(
              leading: const Icon(Icons.info),
              title: const Text("Sobre"),

              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [

            // BANNER
            Stack(
              children: [

                Image.asset(
                  "assets/banner.jpg",
                  height: 250,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),

                Container(
                  height: 250,
                  color: Colors.black.withValues(alpha: 0.1),
                ),
              ],
            ),

            Transform.translate(
              offset: const Offset(0, -30),

              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                padding: const EdgeInsets.all(16),

                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),

                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.1),
                      blurRadius: 10,
                    ),
                  ],
                ),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    const Text(
                      "hamburgueria umarama",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 10),

                    Row(
                      children: [

                        const Icon(
                          Icons.star,
                          color: Colors.orange,
                        ),

                        const SizedBox(width: 5),

                        const Text("4.8"),

                        const SizedBox(width: 10),

                        Container(
                          width: 8,
                          height: 8,

                          decoration: const BoxDecoration(
                            color: Colors.red,
                            shape: BoxShape.circle,
                          ),
                        ),

                        const SizedBox(width: 10),

                        const Text("super"),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),

              child: Align(
                alignment: Alignment.centerLeft,

                child: Text(
                  "Destaques",

                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),

              child: GridView.count(
                crossAxisCount: 3,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),

                crossAxisSpacing: 10,
                mainAxisSpacing: 10,

                children: [

                  produto(
                    context,
                    "assets/hamb.jpg",
                    "Big Carne",
                    "Hambúrguer artesanal com carne e queijo.",
                  ),

                  produto(
                    context,
                    "assets/hamb.jpg",
                    "Big Bacon",
                    "Hambúrguer com bacon crocante.",
                  ),

                  produto(
                    context,
                    "assets/hamb.jpg",
                    "Big Frango",
                    "Hambúrguer de frango especial.",
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}

class ProdutoPagina extends StatelessWidget {
  final String imagem;
  final String nome;
  final String descricao;

  const ProdutoPagina({
    super.key,
    required this.imagem,
    required this.nome,
    required this.descricao,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(nome),
      ),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Image.asset(
            imagem,
            width: double.infinity,
            height: 250,
            fit: BoxFit.cover,
          ),

          Padding(
            padding: const EdgeInsets.all(16),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Text(
                  nome,
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 20),

                Text(
                  descricao,
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget produto(
    BuildContext context,
    String imagem,
    String nome,
    String descricao,
    ) {
  return GestureDetector(
    onTap: () {

      Navigator.push(
        context,

        MaterialPageRoute(
          builder: (context) => ProdutoPagina(
            imagem: imagem,
            nome: nome,
            descricao: descricao,
          ),
        ),
      );
    },

    child: Column(
      children: [

        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),

            child: Image.asset(
              imagem,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ),
        ),

        const SizedBox(height: 5),

        Text(
          nome,
          textAlign: TextAlign.center,
        ),
      ],
    ),
  );
}