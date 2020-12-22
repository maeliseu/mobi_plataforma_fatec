class VitrineModel {
  VitrineModel(
      {this.aluno,
      this.descricao,
      this.linkedin,
      this.github,
      this.curso,
      this.tipoVaga});

  String aluno;
  String descricao;
  String linkedin;
  String github;
  String curso;
  String tipoVaga;

  factory VitrineModel.fromJson(Map<String, dynamic> json) => VitrineModel(
        //field: json[''],
        aluno: json['aluno'],
        descricao: json['descricao'],
        linkedin: json['linkedin'],
        github: json['github'],
        curso: json['curso'],
        tipoVaga: json['tipo_vaga'],
      );
}

Map<String, dynamic> toJson() => {};
