class CargoEnum {
  static const responsavelTecnica = 0;
  static const cozinheira = 1;
  static const asg = 2;
}

Map<int, String> cargoLabels = {
  CargoEnum.responsavelTecnica: 'Responsável Técnica',
  CargoEnum.cozinheira: 'Cozinheira',
  CargoEnum.asg: 'ASG'
};
