class HeaderTable {
  final String nombre;
  final double? fixedWidth;
  final bool orden;

  HeaderTable({required this.nombre, this.fixedWidth, this.orden = false});
}

class CellBodyTable {
  final String data;

  CellBodyTable({required this.data});
}
