#create database db_mc;
#use db_mc;

create table Usuario (
	id int primary key auto_increment,
	login varchar(255),
	senha varchar(20)
);

create table UnidadeDeSaude (
	id int primary key auto_increment,
	nome varchar(255),
	logradouro varchar(255),
	numero smallint,
	bairro varchar(100),
	cep varchar(10)
);

create table Especialidade (
	id int primary key auto_increment,
	descricao varchar(255)
);

create table Paciente (
	id int primary key auto_increment,
	id_usuario int, 
	nome varchar(255),
	cpf varchar(15),
	cartaosus varchar(30),
	datanascimento date,
	sexo char(1),
	estadocivil varchar(20),
	logradouro varchar(255),
	numero smallint,
	bairro varchar(100),
	cep varchar(10),
	CONSTRAINT fk_PacienteUsuario FOREIGN KEY (id_usuario) REFERENCES Usuario (id)
);

create table Medico (
	id int primary key auto_increment,
	id_usuario int, 
	nome varchar(255),
	cpf varchar(15),
	datanascimento date,
	crm varchar(50),	
	sexo char(1),
	CONSTRAINT fk_MedicoUsuario FOREIGN KEY (id_usuario) REFERENCES Usuario (id)
);

create table MedicoEspecialidade (
	id int primary key auto_increment,
	id_medico int, 
	id_especialidade int, 
	CONSTRAINT fk_MedicoEspecialidadeMedico FOREIGN KEY (id_medico) REFERENCES Medico (id),
	CONSTRAINT fk_MedicoEspecialidadeEspecialidade FOREIGN KEY (id_especialidade) REFERENCES Especialidade (id)
);

create table Agenda (
	id int primary key auto_increment, 
	datainicio date,
	datafim date,
	horainicio time,
	horafim time,
	duracao time
);

create table MedicoAgendaUnidadeDeSaude (
	id int primary key auto_increment,
	id_medico int, 
	id_agenda int, 
	id_unidadedesaude int, 
	CONSTRAINT fk_MAUMedico FOREIGN KEY (id_medico) REFERENCES Medico (id),
	CONSTRAINT fk_MAUAgenda FOREIGN KEY (id_agenda) REFERENCES Agenda (id),
	CONSTRAINT fk_MAUUnidadeDeSaude FOREIGN KEY (id_unidadedesaude) REFERENCES UnidadeDeSaude (id)
);

create table Agendamento (
	id int primary key auto_increment,
	id_paciente int, 
	id_medicoagendaunidadedesaude int, 
	datahoracriacao datetime,
	status int, 
	CONSTRAINT fk_AgendamentoPaciente FOREIGN KEY (id_paciente) REFERENCES Paciente (id),
	CONSTRAINT fk_AgendamentoMAU FOREIGN KEY (id_medicoagendaunidadedesaude) REFERENCES MedicoAgendaUnidadeDeSaude (id)
);

create table Consulta (
	id int primary key auto_increment,
	id_agendamento int, 
	sintomas varchar(255),
	prescricao varchar(255),
	datahoracriacao datetime,
	status int, 
	CONSTRAINT fk_ConsultaAgendamento FOREIGN KEY (id_agendamento) REFERENCES Agendamento (id)
);














