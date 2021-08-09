namespace db.sap.pricerecomm;

using {
    cuid,
} from '@sap/cds/common';

entity Categories :cuid  {
products : Association to many Products on products.category = $self;
name : String
}

entity Products : cuid {
label : String;
category : Association to Categories;
price : Association to Prices;
}

entity Prices : cuid{
    priceLow : Decimal;
    priceHigh : Decimal;
    currency : String;
}