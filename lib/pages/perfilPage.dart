import 'package:flutter/material.dart';

class perfilPage extends StatelessWidget {
  const perfilPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF090228),

      appBar: AppBar(
        backgroundColor: const Color(0xFF090228),
        centerTitle: true,
        elevation: 0,
        title: const Text(
          "Perfil",
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [

            // CARD USUÁRIO
            Container(
              padding: const EdgeInsets.all(15),

              decoration: BoxDecoration(
                color: const Color(0xFF141414),
                borderRadius: BorderRadius.circular(12),
              ),

              child: Row(
                children: [

                  const CircleAvatar(
                    radius: 28,
                    backgroundImage: NetworkImage(
                      "assets/hamb.jpg",
                    ),
                  ),

                  const SizedBox(width: 12),

                  const Expanded(
                    child: Column(
                      crossAxisAlignment:
                      CrossAxisAlignment.start,

                      children: [

                        Text(
                          "usuario",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        SizedBox(height: 4),

                        Text(
                          "Membro Premium",
                          style: TextStyle(
                            color: Colors.white54,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),

                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),

                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius:
                      BorderRadius.circular(20),
                    ),

                    child: const Text(
                      "Premium",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            const Text(
              "MINHA CONTA",
              style: TextStyle(
                color: Colors.white54,
                fontSize: 12,
              ),
            ),

            const SizedBox(height: 10),

            perfilItem(
              Icons.person_outline,
              "Meu perfil",
              "Editar informações pessoais",
            ),

            perfilItem(
              Icons.credit_card_outlined,
              "Pagamentos",
              "Métodos de pagamento",
            ),

            perfilItem(
              Icons.lock_outline,
              "Privacidade",
              "Controle e segurança",
            ),

            const SizedBox(height: 25),

            const Text(
              "SUPORTE",
              style: TextStyle(
                color: Colors.white54,
                fontSize: 12,
              ),
            ),

            const SizedBox(height: 10),

            perfilItem(
              Icons.help_outline,
              "Central de ajuda",
              "FAQ e tutoriais",
            ),

            perfilItem(
              Icons.people_outline,
              "Comunidade",
              "Fórum de usuários",
            ),

            perfilItem(
              Icons.support_agent,
              "Contato",
              "Falar com suporte",
            ),
          ],
        ),
      ),
    );
  }

  Widget perfilItem(
      IconData icone,
      String titulo,
      String subtitulo,
      ) {

    return Container(
      margin: const EdgeInsets.only(bottom: 10),

      decoration: BoxDecoration(
        color: const Color(0xFF141414),
        borderRadius: BorderRadius.circular(12),
      ),

      child: ListTile(
        leading: Icon(
          icone,
          color: Colors.white,
        ),

        title: Text(
          titulo,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),

        subtitle: Text(
          subtitulo,
          style: const TextStyle(
            color: Colors.white54,
            fontSize: 12,
          ),
        ),

        trailing: const Icon(
          Icons.chevron_right,
          color: Colors.white54,
        ),

        onTap: () {},
      ),
    );
  }
}