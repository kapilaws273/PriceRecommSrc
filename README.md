# Getting Started

Welcome to your new project.

It contains these folders and files, following our recommended project layout:

| File or Folder | Purpose                              |
| -------------- | ------------------------------------ |
| `app/`         | content for UI frontends goes here   |
| `db/`          | your domain models and data go here  |
| `srv/`         | your service models and code go here |
| `package.json` | project metadata and configuration   |
| `readme.md`    | this getting started guide           |

## Next Steps

- Open a new terminal and run `cds watch`
- (in VS Code simply choose _**Terminal** > Run Task > cds watch_)
- Start adding content, for example, a [db/schema.cds](db/schema.cds).

## Learn More

Learn more at https://cap.cloud.sap/docs/get-started/.

for sqlit3 issue :

https://github.com/mapbox/node-sqlite3/issues/1427

Tutorials:

https://developers.sap.com/tutorials/cp-apm-nodejs-create-service.html

http://localhost:4004/catalog/Authors?$expand=books($select=ID,title)
http://localhost:4004/

# Steps to create and run this projects :

CMD : cds init hello-world -- This Create a new node project
CMD : cd hello-world
CMD : npm install -- Run to install dependencies
CMD : cds watch -- Run the Server... cds run command is without watch
Task : Define Service srv/cat-service.cds

Run : http://localhost:4004 -- To Test all Set

Task : Create mock data srv/cat-service.js

Run : http://localhost:4004/catalog/Books -- To view the data
Run : http://localhost:4004/catalog/Authors -- To view the Data

Task : Add data model and adapt service definition db/data-model.cds

Task : Change srv/cat-service.cds to consume the data model dynamically

using my.bookshop as my from '../db/data-model';

    service CatalogService {
    entity Books @readonly as projection on my.Books;
     entity Authors @readonly as projection on my.Authors;
    entity Orders @insertonly as projection on my.Orders;
    }

Task : Comment whole mock data available in cat-service.js

Task : Add initial data
db/csv/my.bookshop-Authors.csv
db/csv/my.bookshop-Authors.csv

Run : http://localhost:4004/catalog/Books -- To view the data
Run : http://localhost:4004/catalog/Authors -- To view the data
Run : http://localhost:4004/catalog/Authors?$expand=books($select=ID,title) -- for Complex oData Query

So Far everythng in in Memory DB :)

Task : Add Data Pesistence  
CMD : npm i sqlite3 -D
Task : Deploy the Data model
CMD : cds deploy --to sqlite:db/my-bookshop.db

Task : To view All well run
CMD : sqlite3 db/my-bookshop.db -cmd .dump
CMD : ctrl +c
CMD : cds watch

We are all set with persisted data... if any defination and data change further just run
CMD : cds deploy

Task : Add lpo

Run : on browser http://localhost:4004/catalog/Authors?$expand=books($5]p[oiuelect=ID,title)

Run: Execute all oData calls in Postmann --Import collection postman.json and then Run all calls. --- Recommonded
