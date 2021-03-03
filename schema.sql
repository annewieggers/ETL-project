DROP TABLE electoral_division CASCADE;
DROP TABLE election_results;
DROP TABLE election_vote_types;
DROP TABLE election_turnout;
DROP TABLE marriage_postal_results;
DROP TABLE marriage_postal_turnout;
DROP TABLE marriage_postal_participants_by_age;
DROP TABLE "2017_population_agedemo";
DROP TABLE cultural_diversity;
DROP TABLE education;



CREATE TABLE "electoral_division" (
    "division_id" INT   NOT NULL,
    "electoral_division" VARCHAR(30)   NOT NULL,
    "state" VARCHAR(4)   NOT NULL,
    CONSTRAINT "pk_electoral_division" PRIMARY KEY (
        "division_id"
     )
);

CREATE TABLE "election_results" (
    "division_id" INT   NOT NULL,
	"enrolment" INT NOT NULL,
    "demographic" VARCHAR(30)   NOT NULL,
    "previous_party" VARCHAR(30)   NOT NULL,
    "previous_seat_status" VARCHAR(30)   NOT NULL,
    "successful_party" VARCHAR(30)   NOT NULL,
    "seat_status" VARCHAR(30)   NOT NULL,
    CONSTRAINT "pk_election_results" PRIMARY KEY (
        "division_id"
     )
);

CREATE TABLE "election_vote_types" (
    "division_id" INT   NOT NULL,
    "ordinary_votes" INT   NOT NULL,
    "absent_votes" INT   NOT NULL,
    "provisional_votes" INT   NOT NULL,
    "prepoll_votes" INT   NOT NULL,
    "postal_votes" INT   NOT NULL,
    "total_votes" INT   NOT NULL,
    CONSTRAINT "pk_election_vote_types" PRIMARY KEY (
        "division_id"
     )
);


CREATE TABLE "election_turnout" (
    "division_id" INT   NOT NULL,
    "total_enrolled" INT   NOT NULL,
    "total_votes" INT   NOT NULL,
    "turnout_percent" FLOAT   NOT NULL,
    CONSTRAINT "pk_election_turnout" PRIMARY KEY (
        "division_id"
     )
);

CREATE TABLE "marriage_postal_results" (
    "division_id" INT   NOT NULL,
    "yes_count" INT   NOT NULL,
    "no_count" INT   NOT NULL,
    "total_responses" INT   NOT NULL,
    "response_unclear" INT   NOT NULL,
    "non_responding" INT   NOT NULL,
    CONSTRAINT "pk_marriage_postal_results" PRIMARY KEY (
        "division_id"
     )
);



CREATE TABLE "marriage_postal_turnout" (
    "division_id" INT   NOT NULL,
    "total_eligible" INT   NOT NULL,
    "total_participants" INT   NOT NULL,
    "turnout_percent" FLOAT   NOT NULL,
    CONSTRAINT "pk_marriage_postal_turnout" PRIMARY KEY (
        "division_id"
     )
);

CREATE TABLE "marriage_postal_participants_by_age" (
    "division_id" INT   NOT NULL,
    "ages_18-34" INT   NOT NULL,
    "ages_35-49" INT   NOT NULL,
    "ages_50-64" INT   NOT NULL,
    "ages_65-79" INT   NOT NULL,
    "ages_80_plus" INT   NOT NULL,
    CONSTRAINT "pk_marriage_postal_participants_by_age" PRIMARY KEY (
        "division_id"
     )
);


CREATE TABLE "2017_population_agedemo" (
    "division_id" INT   NOT NULL,
    "0-17_percent" FLOAT   NOT NULL,
    "18-34_percent" FLOAT   NOT NULL,
    "35-49_percent" FLOAT   NOT NULL,
    "50-64_percent" FLOAT   NOT NULL,
    "65-79_percent" FLOAT   NOT NULL,
    "80+_percent" FLOAT   NOT NULL,
    "pop_count_est" INT   NOT NULL,
    CONSTRAINT "pk_2017_population_agedemo" PRIMARY KEY (
        "division_id"
     )
);



CREATE TABLE "cultural_diversity" (
    "division_id" INT   NOT NULL,
    "aboriginal_torres_strait_percent" FLOAT   NOT NULL,
    "born_overseas_percent" FLOAT   NOT NULL,
    "recent_migrants_percent" FLOAT   NOT NULL,
    "different_language_percent" FLOAT   NOT NULL,
    CONSTRAINT "pk_cultural_diversity" PRIMARY KEY (
        "division_id"
     )
);

CREATE TABLE "education" (
    "division_id" INT   NOT NULL,
    "year_12_completion_percent" FLOAT   NOT NULL,
    "higher_education_completion_percent" FLOAT   NOT NULL,
    CONSTRAINT "pk_education" PRIMARY KEY (
        "division_id"
     )
);

ALTER TABLE "election_results" ADD CONSTRAINT "fk_election_results_division_id" FOREIGN KEY("division_id")
REFERENCES "electoral_division" ("division_id");

ALTER TABLE "election_vote_types" ADD CONSTRAINT "fk_election_vote_types_division_id" FOREIGN KEY("division_id")
REFERENCES "electoral_division" ("division_id");

ALTER TABLE "election_turnout" ADD CONSTRAINT "fk_election_turnout_division_id" FOREIGN KEY("division_id")
REFERENCES "electoral_division" ("division_id");

ALTER TABLE "marriage_postal_results" ADD CONSTRAINT "fk_marriage_postal_results_division_id" FOREIGN KEY("division_id")
REFERENCES "electoral_division" ("division_id");

ALTER TABLE "marriage_postal_turnout" ADD CONSTRAINT "fk_marriage_postal_turnout_division_id" FOREIGN KEY("division_id")
REFERENCES "electoral_division" ("division_id");

ALTER TABLE "marriage_postal_participants_by_age" ADD CONSTRAINT "fk_marriage_postal_participants_by_age_division_id" FOREIGN KEY("division_id")
REFERENCES "electoral_division" ("division_id");

ALTER TABLE "2017_population_agedemo" ADD CONSTRAINT "fk_2017_population_agedemo_division_id" FOREIGN KEY("division_id")
REFERENCES "electoral_division" ("division_id");

ALTER TABLE "cultural_diversity" ADD CONSTRAINT "fk_cultural_diversity_division_id" FOREIGN KEY("division_id")
REFERENCES "electoral_division" ("division_id");

ALTER TABLE "education" ADD CONSTRAINT "fk_education_division_id" FOREIGN KEY("division_id")
REFERENCES "electoral_division" ("division_id");


