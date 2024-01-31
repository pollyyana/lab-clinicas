///Representacao de nulo no sistema

class Nil {
  @override
  String toString() {
    return 'Nil{}';
  }
}

//facilitar a implementacao

Nil get nil => Nil();
