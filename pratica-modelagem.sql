CREATE DATABASE "driven_data";


CREATE TABLE "customers" (
    id SERIAL NOT NULL PRIMARY KEY,
    "fullName"  VARCHAR(50) NOT NULL,
	cpf VARCHAR(11) NOT NULL UNIQUE,
	email TEXT NOT NULL UNIQUE,
	password TEXT NOT NULL
)

CREATE TABLE "bankAccount" (
    id SERIAL NOT NULL PRIMARY KEY,
    "customerId"  INTEGER NOT NULL REFERENCES customers(id),
	"accountNumber" INTEGER NOT NULL,
	agency INTEGER NOT NULL,
	"openDate" TIMESTAMP NOT NULL DEFAULT NOW(),
	"closeDate" TIMESTAMP DEFAULT NULL
)

CREATE TABLE "transactions" (
	id SERIAL PRIMARY KEY NOT NULL,
	"bankAccountId" INTEGER NOT NULL REFERENCES "bankAccount"(id),
	amount INTEGER NOT NULL DEFAULT 0,
	type VARCHAR(255) NOT NULL CHECK(type = 'deposit' OR type = 'withdraw'),
	"time" TIMESTAMP NOT NULL,
	description TEXT,
	cancelled BOOLEAN NOT NULL DEFAULT FALSE
)

CREATE TABLE "creditCards" (
	id SERIAL PRIMARY KEY NOT NULL,
	"bankAccountId" INTEGER NOT NULL REFERENCES "bankAccount"(id) ,
	name TEXT NOT NULL,
	number INTEGER UNIQUE NOT NULL,
	"securityCode" INTEGER NOT NULL,
	"expirationMonth" DATE NOT NULL,
	"expirationYear" DATE NOT NULL,
	password TEXT NOT NULL,
	"limit" INTEGER NOT NULL
)

CREATE TABLE "states" (
    id SERIAL NOT NULL PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE "cities" (
    id SERIAL NOT NULL PRIMARY KEY,
    name TEXT NOT NULL,
	"stateId" INTEGER NOT NULL REFERENCES states(id)
);


CREATE TABLE "customerAddresses" (
    id SERIAL NOT NULL PRIMARY KEY,
    "customerId"  INTEGER NOT NULL REFERENCES customers(id) UNIQUE,
	street TEXT NOT NULL,
	number INTEGER NOT NULL,
	complement TEXT,
	"postalCode" INTEGER NOT NULL,
	"cityId" INTEGER NOT NULL REFERENCES cities(id)
);

CREATE TABLE "customerPhones" (
	id SERIAL PRIMARY KEY NOT NULL,
	"customerId" INTEGER NOT NULL REFERENCES customers(id) ,
	number VARCHAR(11) NOT NULL,
	type VARCHAR(255) CHECK(type = 'landline' OR type = 'mobile')
	)



