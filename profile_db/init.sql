
CREATE TABLE profile (
    id SERIAL PRIMARY KEY,
    user_id BIGINT UNIQUE NOT NULL,  
    name VARCHAR(100) NOT NULL,
    biography TEXT,
    profile_picture_url TEXT
);


CREATE TABLE tag (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) UNIQUE NOT NULL
);


CREATE TABLE profile_tag (
    profile_id INT NOT NULL,
    tag_id INT NOT NULL,
    PRIMARY KEY (profile_id, tag_id),
    FOREIGN KEY (profile_id) REFERENCES profile(id) ON DELETE CASCADE,
    FOREIGN KEY (tag_id) REFERENCES tag(id) ON DELETE CASCADE
);


CREATE VIEW view_profiles_by_tag_simple AS
SELECT p.*
FROM profile p
JOIN profile_tag pt ON p.id = pt.profile_id
JOIN tag t ON pt.tag_id = t.id;


CREATE VIEW view_profiles_by_tag_detailed AS
SELECT p.id, p.name, p.biography, t.id AS tag_id, t.name AS tag_name
FROM profile p
JOIN profile_tag pt ON p.id = pt.profile_id
JOIN tag t ON pt.tag_id = t.id;