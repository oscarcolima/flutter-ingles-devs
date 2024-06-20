class HeaderTable {
  final String nombre;
  final double? fixedWidth;
  final bool orden;
final bool numeric ;
  HeaderTable( {required this.nombre, this.fixedWidth, this.orden = false,this.numeric = false});
}

class CellBodyTable {
  final String data;

  CellBodyTable({required this.data});
}
