CREATE TABLE "public.users" (
	"id" serial NOT NULL,
	"name" varchar(100) NOT NULL,
	"email" varchar(255) NOT NULL UNIQUE,
	"password" TEXT NOT NULL,
	CONSTRAINT "users_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.customerAdresses" (
	"id" serial NOT NULL,
	"customerId" serial NOT NULL,
	"street" varchar(255) NOT NULL,
	"number" integer NOT NULL,
	"complement" TEXT DEFAULT 'null',
	"postalCode" integer NOT NULL,
	"cityId" integer NOT NULL,
	CONSTRAINT "customerAdresses_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.cities" (
	"id" serial NOT NULL,
	"name" varchar(50) NOT NULL,
	"stateId" varchar(50) NOT NULL,
	CONSTRAINT "cities_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.state" (
	"id" serial NOT NULL,
	"name" varchar(50) NOT NULL UNIQUE,
	CONSTRAINT "state_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.products" (
	"id" serial NOT NULL,
	"name" TEXT NOT NULL,
	"price" integer NOT NULL,
	"mainPhoto" TEXT NOT NULL,
	"categoryId" integer NOT NULL,
	"sizeId" integer NOT NULL,
	CONSTRAINT "products_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.productsPhotos" (
	"id" serial NOT NULL,
	"photoUri" TEXT NOT NULL,
	"productId" integer NOT NULL,
	CONSTRAINT "productsPhotos_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.categories" (
	"id" serial NOT NULL,
	"name" serial NOT NULL,
	CONSTRAINT "categories_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.sizes" (
	"id" serial NOT NULL,
	"name" TEXT NOT NULL,
	CONSTRAINT "sizes_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.purchases" (
	"id" serial NOT NULL,
	"customerId" integer NOT NULL,
	"productId" integer NOT NULL,
	"quantity" integer NOT NULL,
	"adressId" integer NOT NULL,
	"openDate" TIMESTAMP NOT NULL,
	"statusId" integer NOT NULL,
	CONSTRAINT "purchases_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.status" (
	"id" serial NOT NULL,
	"name" serial(50) NOT NULL,
	CONSTRAINT "status_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);




ALTER TABLE "customerAdresses" ADD CONSTRAINT "customerAdresses_fk0" FOREIGN KEY ("customerId") REFERENCES "users"("id");
ALTER TABLE "customerAdresses" ADD CONSTRAINT "customerAdresses_fk1" FOREIGN KEY ("cityId") REFERENCES "cities"("id");

ALTER TABLE "cities" ADD CONSTRAINT "cities_fk0" FOREIGN KEY ("stateId") REFERENCES "state"("id");


ALTER TABLE "products" ADD CONSTRAINT "products_fk0" FOREIGN KEY ("categoryId") REFERENCES "categories"("id");
ALTER TABLE "products" ADD CONSTRAINT "products_fk1" FOREIGN KEY ("sizeId") REFERENCES "sizes"("id");

ALTER TABLE "productsPhotos" ADD CONSTRAINT "productsPhotos_fk0" FOREIGN KEY ("productId") REFERENCES "products"("id");



ALTER TABLE "purchases" ADD CONSTRAINT "purchases_fk0" FOREIGN KEY ("customerId") REFERENCES "users"("id");
ALTER TABLE "purchases" ADD CONSTRAINT "purchases_fk1" FOREIGN KEY ("productId") REFERENCES "products"("id");
ALTER TABLE "purchases" ADD CONSTRAINT "purchases_fk2" FOREIGN KEY ("adressId") REFERENCES "customerAdresses"("id");
ALTER TABLE "purchases" ADD CONSTRAINT "purchases_fk3" FOREIGN KEY ("statusId") REFERENCES "status"("id");














ALTER TABLE "customerAdresses" ADD CONSTRAINT "customerAdresses_fk0" FOREIGN KEY ("customerId") REFERENCES "users"("id");
ALTER TABLE "customerAdresses" ADD CONSTRAINT "customerAdresses_fk1" FOREIGN KEY ("cityId") REFERENCES "cities"("id");

ALTER TABLE "cities" ADD CONSTRAINT "cities_fk0" FOREIGN KEY ("stateId") REFERENCES "state"("id");


ALTER TABLE "products" ADD CONSTRAINT "products_fk0" FOREIGN KEY ("categoryId") REFERENCES "categories"("id");

ALTER TABLE "productsPhotos" ADD CONSTRAINT "productsPhotos_fk0" FOREIGN KEY ("productId") REFERENCES "products"("id");


ALTER TABLE "sizes" ADD CONSTRAINT "sizes_fk0" FOREIGN KEY ("categoryId") REFERENCES "categories"("id");

ALTER TABLE "purchases" ADD CONSTRAINT "purchases_fk0" FOREIGN KEY ("customerId") REFERENCES "users"("id");
ALTER TABLE "purchases" ADD CONSTRAINT "purchases_fk1" FOREIGN KEY ("productId") REFERENCES "products"("id");
ALTER TABLE "purchases" ADD CONSTRAINT "purchases_fk2" FOREIGN KEY ("sizeId") REFERENCES "sizes"("id");
ALTER TABLE "purchases" ADD CONSTRAINT "purchases_fk3" FOREIGN KEY ("adressId") REFERENCES "customerAdresses"("id");
ALTER TABLE "purchases" ADD CONSTRAINT "purchases_fk4" FOREIGN KEY ("statusId") REFERENCES "status"("id");











