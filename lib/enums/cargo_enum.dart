class CargoEnum {
  static const responsavelTecnica = 0;
  static const cozinheira = 1;
  static const asg = 2;
  static const nutricionista = 3;
  static const gestora = 4;
  static const copeira = 5;
  static const paticeira = 6;
  static const estoquista = 7;
  static const ajudante = 8;
}

Map<int, String> cargoLabels = {
  CargoEnum.responsavelTecnica: 'Responsável Técnica(o)',
  CargoEnum.cozinheira: 'Cozinheira',
  CargoEnum.asg: 'ASG',
  CargoEnum.nutricionista: 'Nutricionista',
  CargoEnum.gestora: 'Gestora',
  CargoEnum.copeira: 'Copeira',
  CargoEnum.paticeira: 'Paticeira(o)',
  CargoEnum.estoquista: 'Estoquista',
  CargoEnum.ajudante: 'Ajudante de Cozinha'
};
