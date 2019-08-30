drop table if exists user_authority;
drop table if exists users;
drop sequence if exists global_seq;
drop table if exists authority;
CREATE SEQUENCE global_seq START 1;
CREATE TABLE users
(
    id               INTEGER     NOT NULL PRIMARY KEY DEFAULT nextval('global_seq'),
    username         VARCHAR(50) UNIQUE NOT NULL,
    email            VARCHAR(50),
    password         VARCHAR(500),
    activated        BOOLEAN                          DEFAULT FALSE,
    activationkey    VARCHAR(50)                      DEFAULT NULL,
    resetpasswordkey VARCHAR(50)                      DEFAULT NULL,
    provider_id      VARCHAR(50)                      DEFAULT NULL,
    provider         VARCHAR(50)                      DEFAULT NULL
);

drop table if exists authority;
CREATE TABLE authority
(
    name VARCHAR(50) NOT NULL PRIMARY KEY
);

CREATE TABLE user_authority
(
    id  INTEGER NOT NULL,
    authority VARCHAR(50) NOT NULL,
    FOREIGN KEY (id) REFERENCES users (id),
    FOREIGN KEY (authority) REFERENCES authority (name)

);

CREATE UNIQUE INDEX user_authority_idx_1 ON user_authority (id, authority);

drop table if exists oauth_client_details;
create table oauth_client_details
(
    client_id               VARCHAR(255) PRIMARY KEY,
    resource_ids            VARCHAR(255),
    client_secret           VARCHAR(255),
    scope                   VARCHAR(255),
    authorized_grant_types  VARCHAR(255),
    web_server_redirect_uri VARCHAR(255),
    authorities             VARCHAR(255),
    access_token_validity   INTEGER,
    refresh_token_validity  INTEGER,
    additional_information  VARCHAR(4096),
    autoapprove             VARCHAR(255)
);

drop table if exists oauth_client_token;
create table oauth_client_token
(
    token_id          VARCHAR(255),
    token             bytea,
    authentication_id VARCHAR(255) PRIMARY KEY,
    user_name         VARCHAR(255),
    client_id         VARCHAR(255)
);

drop table if exists oauth_access_token;
CREATE TABLE oauth_access_token
(
    token_id          VARCHAR(256) DEFAULT NULL,
    token             bytea,
    authentication_id VARCHAR(256) DEFAULT NULL,
    user_name         VARCHAR(256) DEFAULT NULL,
    client_id         VARCHAR(256) DEFAULT NULL,
    authentication    bytea,
    refresh_token     VARCHAR(256) DEFAULT NULL
);

drop table if exists oauth_refresh_token;
CREATE TABLE oauth_refresh_token
(
    token_id       VARCHAR(256) DEFAULT NULL,
    token          bytea,
    authentication bytea
);

drop table if exists oauth_code;
create table oauth_code
(
    code           VARCHAR(255),
    authentication bytea
);

drop table if exists oauth_approvals;
create table oauth_approvals
(
    userId         VARCHAR(255),
    clientId       VARCHAR(255),
    scope          VARCHAR(255),
    status         VARCHAR(10),
    expiresAt      timestamp,
    lastModifiedAt timestamp,
    provider       varchar(50),
    provider_id    varchar(50)
);