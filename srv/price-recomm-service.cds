using db.sap.pricerecomm as db from '../db/schema';

service PriceRecommService {
    entity Categories @readonly as projection on db.Categories;
    entity Products @readonly as projection on db.Products;
    entity Prices @readonly as projection on db.Prices;
}