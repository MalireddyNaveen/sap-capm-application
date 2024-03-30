namespace ResuablesTypes.db;

type Ammount     : Decimal(10, 2);
type email       : String @assert.format: '^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+$';
type phoneNumber : String @assert.format: '^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$';

aspect personDetails {
    fname  : String;
    lName  : String;
    gender : String
}
