/* Database schema to maintain database structure. */

CREATE DATABASE vet_clinic;

CREATE TABLE animals(
    id               INT GENERATED ALWAYS AS IDENTITY,
    name             VARCHAR(100),
    date_of_birth    DATE,
    escape_attempts  INT,
    neutered         BOOLEAN,
    weight_kg        DECIMAL,
    PRIMARY KEY(id)  
);

-- Add a column `species` of type string to the animals table
ALTER TABLE animals ADD COLUMN species VARCHAR(100);

-- Created table for owners
CREATE TABLE owners(
    id              INT GENERATED ALWAYS AS IDENTITY,
    full_name       VARCHAR(100),
    age             INT,
    PRIMARY KEY(id)
);

-- Created a table for species
CREATE TABLE species(
    id              INT GENERATED ALWAYS AS IDENTITY,
    name            VARCHAR(100),
    PRIMARY KEY(id)
);

-- Remove species column from animals table
ALTER TABLE animals DROP COLUMN species;

-- Add foreign key for species in animals table
ALTER TABLE animals
ADD species_id INT REFERENCES species (id);

-- Add foreign key for owners in animals table
ALTER TABLE animals
ADD owner_id INT REFERENCES owners (id);

-- Create vets table
CREATE TABLE vets(
    id INT GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(100) NOT NULL,
    age INT NOT NULL,
    date_of_graduation date NOT NULL,
    PRIMARY KEY(id)
);

-- Create specialization table (join table)
CREATE TABLE specializations(
    species_id INT NOT NULL,
    vet_id INT NOT NULL,
    FOREIGN KEY (species_id) REFERENCES species (id),
    FOREIGN KEY (vet_id) REFERENCES vets (id)
);

-- Create visits table (join table)
CREATE TABLE visits(
    animal_id INT NOT NULL,
    vet_id INT NOT NULL,
    date_of_visit DATE,
    FOREIGN KEY (animal_id) REFERENCES animals (id),
    FOREIGN KEY (vet_id) REFERENCES vets (id)
);

