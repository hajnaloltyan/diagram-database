CREATE TABLE patients (
  id series primary key,
  name varchar(120),
  date_of_birth date 
);

CREATE TABLE medical_histories (
  id series primary key,
  admitted_at timestamp,
  patient_id int references patients(id),
  status varchar(255)
);

CREATE TABLE treatments (
  id series primary key,
  type varchar(255),
  name varchar(255)
);

CREATE TABLE  invoices (
  id series primary key,
  total_amount decimal(10,2),
  generated_at timestamp,
  payed_at timestamp,
  medical_history__id int references medical_histories(id)
);

CREATE TABLE invoice_items (
  id series primary key,
  unit_price decimal(10,2),
  quantity int,
  total_price decimal(10,2),
  invoice_id int references invoices(id),
  treatment_id int references treatments(id)
);

--create a table to link treatments to medical histories
CREATE TABLE medical_history_treatments (
  medical_history_id int references medical_histories(id),
  treatment_id int references treatments(id),
  primary key (medical_history_id, treatment_id)
);

--create foreign key indexes
CREATE INDEX medical_histories_patient_id_idx ON medical_histories(patient_id);
CREATE INDEX invoices_medical_history__id_idx ON invoices(medical_history__id);
CREATE INDEX invoice_items_invoice_id_idx ON invoice_items(invoice_id);
CREATE INDEX invoice_items_treatment_id_idx ON invoice_items(treatment_id);
