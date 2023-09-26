CREATE TABLE patients (
  id series primary key,
  name varchar(120),
  date_of_birth date 
);

CREATE TABLE medical_histories (
  id series primary key,
  admitted_at timestamp,
  patient_id integer references patients(id),
  status varchar(255)
);

CREATE TABLE treatments (
  id series primary key,
  type varchar(255),
  name varchar(255)
);

