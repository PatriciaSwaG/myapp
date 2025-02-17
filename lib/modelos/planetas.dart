class Planeta {
  int? id;
  String nome;
  double tamanho;
  double distancia;
  String? apelido;

// Construtor da classe Planeta
  Planeta({
    this.id,
    required this.nome,
    required this.tamanho,
    required this.distancia,
    this.apelido,
  });

// Construtor alternativo
  Planeta.vazio()
      : nome = '',
        tamanho = 0.0,
        distancia = 0.0,
        apelido = '';

  Map<String, dynamic> toMap() {
    return {
      'id' : id,
      'nome' : nome,
      'distancia' : distancia,
      'tamanho' : tamanho,
      'apelido' : apelido,
    };
  }
}