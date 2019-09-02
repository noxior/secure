--INSERT INTO user (username,email, password, activated) VALUES ('piomin', 'piotr.minkowski@gmail.com', 'piot123', true);
INSERT INTO users (username,email, password, activated, provider, provider_id)
VALUES ('piomin', 'piotr.minkowski@gmail.com', '$2a$10$Jlz7tgtjuTrj6KwHy0I.GOSZDPFG7/aShQqjuP9A.gZqgHQQFLtci', true, 'google', 'google');

INSERT INTO authority (name) VALUES ('ROLE_USER');
INSERT INTO authority (name) VALUES ('ROLE_ADMIN');

INSERT INTO user_authority (id,authority) VALUES (1, 'ROLE_USER');
INSERT INTO user_authority (id,authority) VALUES (1, 'ROLE_ADMIN');

INSERT INTO oauth_client_details (client_id, client_secret, scope, authorized_grant_types, access_token_validity, additional_information)
VALUES ('account', 'secret', 'read', 'authorization_code,password,refresh_token,implicit', '900', '{}');
INSERT INTO oauth_client_details (client_id, client_secret, scope, authorized_grant_types, access_token_validity, additional_information)
VALUES ('customer', '$2a$10$6R5teslA8n/Jr6vVZ/h3SuDQTS4DlByZJy0H8H05pd24i.ibGZTdW', 'read', 'authorization_code,password,refresh_token,implicit', '900', '{}');