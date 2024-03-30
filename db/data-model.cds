namespace employee.db;

using {ResuablesTypes.db as types} from './ResuableTypes';
using {cuid} from '@sap/cds/common';

@ssert.unique: {
  email: [email],
  phone: [phone]
}

entity Employee : cuid {

  fName           : String;
  lName           : String;
  gender          : String;
  DOB             : Date;
  contractStarted : Date;
  email           : types.email not null;
  phone           : types.phoneNumber not null;
  address         : Composition of many Address
                      on address.employee = $self;
  salary          : Composition of Salary;
  department      : Association to Department;
  designation     : Association to Designation;
}

entity Address : cuid {
  city     : String not null;
  address  : String not null;
  pincode  : Integer not null;
  street   : String;
  landmark : String;
  employee : Association to Employee;
}

entity Salary : cuid {
  costToCompany : types.Ammount;
  employeePf    : types.Ammount;
  employerPf    : types.Ammount;
  nps           : types.Ammount;
  vpf           : types.Ammount;
}

entity Department : cuid {
  name        : String;
  description : String;
  headCount   : Integer;
}

entity Designation : cuid {
  name        : String;
  description : String;
  level       : String;
}
