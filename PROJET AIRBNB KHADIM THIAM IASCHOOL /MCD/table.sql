#------------------------------------------------------------
#        Script MySQL.
#------------------------------------------------------------


#------------------------------------------------------------
# Table: listings
#------------------------------------------------------------

CREATE TABLE listings(
        id                    Varchar (50) NOT NULL ,
        name                  Varchar (50) NOT NULL ,
        neighbourhood         Varchar (50) NOT NULL ,
        has_availability      Varchar (50) NOT NULL ,
        calendar_last_scraped Varchar (50) NOT NULL ,
        price                 Varchar (50) NOT NULL
	,CONSTRAINT listings_AK UNIQUE (price)
	,CONSTRAINT listings_PK PRIMARY KEY (id)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: host
#------------------------------------------------------------

CREATE TABLE host(
        host_id        Varchar (50) NOT NULL ,
        host__name     Varchar (50) NOT NULL ,
        proprerty_type Varchar (50) NOT NULL ,
        accomodates    Varchar (50) NOT NULL
	,CONSTRAINT host_PK PRIMARY KEY (host_id)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: localisation
#------------------------------------------------------------

CREATE TABLE localisation(
        zipcode       Varchar (50) NOT NULL ,
        host_location Varchar (50) NOT NULL ,
        latitude      Varchar (50) NOT NULL ,
        longitude     Varchar (50) NOT NULL
	,CONSTRAINT localisation_PK PRIMARY KEY (zipcode)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: calandrier
#------------------------------------------------------------

CREATE TABLE calandrier(
        listing_id Varchar (50) NOT NULL ,
        date       Varchar (50) NOT NULL ,
        available  Varchar (50) NOT NULL ,
        price      Varchar (50) NOT NULL
	,CONSTRAINT calandrier_AK UNIQUE (price)
	,CONSTRAINT calandrier_PK PRIMARY KEY (listing_id)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Avoir
#------------------------------------------------------------

CREATE TABLE Avoir(
        id      Varchar (50) NOT NULL ,
        host_id Varchar (50) NOT NULL
	,CONSTRAINT Avoir_PK PRIMARY KEY (id,host_id)

	,CONSTRAINT Avoir_listings_FK FOREIGN KEY (id) REFERENCES listings(id)
	,CONSTRAINT Avoir_host0_FK FOREIGN KEY (host_id) REFERENCES host(host_id)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Fournir
#------------------------------------------------------------

CREATE TABLE Fournir(
        listing_id Varchar (50) NOT NULL ,
        id         Varchar (50) NOT NULL
	,CONSTRAINT Fournir_PK PRIMARY KEY (listing_id,id)

	,CONSTRAINT Fournir_calandrier_FK FOREIGN KEY (listing_id) REFERENCES calandrier(listing_id)
	,CONSTRAINT Fournir_listings0_FK FOREIGN KEY (id) REFERENCES listings(id)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Appartenir
#------------------------------------------------------------

CREATE TABLE Appartenir(
        zipcode Varchar (50) NOT NULL ,
        host_id Varchar (50) NOT NULL
	,CONSTRAINT Appartenir_PK PRIMARY KEY (zipcode,host_id)

	,CONSTRAINT Appartenir_localisation_FK FOREIGN KEY (zipcode) REFERENCES localisation(zipcode)
	,CONSTRAINT Appartenir_host0_FK FOREIGN KEY (host_id) REFERENCES host(host_id)
)ENGINE=InnoDB;

