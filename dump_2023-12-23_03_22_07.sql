--
-- PostgreSQL database cluster dump
--

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Drop databases (except postgres and template1)
--

DROP DATABASE keycloak;




--
-- Drop roles
--

DROP ROLE keycloak;


--
-- Roles
--

CREATE ROLE keycloak;
ALTER ROLE keycloak WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS PASSWORD 'SCRAM-SHA-256$4096:DCMBvDR/ql2B0+XF/Z/m1g==$em4+cFeIh37DyztfY4lu6C5zaSBZdLKR3BcWkXu7obs=:wuHeF1eq604i85Y13JROrWtckzQX3dJkLxlnGFFtUPc=';

--
-- User Configurations
--








--
-- Databases
--

--
-- Database "template1" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 16.1 (Debian 16.1-1.pgdg120+1)
-- Dumped by pg_dump version 16.1 (Debian 16.1-1.pgdg120+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

UPDATE pg_catalog.pg_database SET datistemplate = false WHERE datname = 'template1';
DROP DATABASE template1;
--
-- Name: template1; Type: DATABASE; Schema: -; Owner: keycloak
--

CREATE DATABASE template1 WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';


ALTER DATABASE template1 OWNER TO keycloak;

\connect template1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: DATABASE template1; Type: COMMENT; Schema: -; Owner: keycloak
--

COMMENT ON DATABASE template1 IS 'default template for new databases';


--
-- Name: template1; Type: DATABASE PROPERTIES; Schema: -; Owner: keycloak
--

ALTER DATABASE template1 IS_TEMPLATE = true;


\connect template1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: DATABASE template1; Type: ACL; Schema: -; Owner: keycloak
--

REVOKE CONNECT,TEMPORARY ON DATABASE template1 FROM PUBLIC;
GRANT CONNECT ON DATABASE template1 TO PUBLIC;


--
-- PostgreSQL database dump complete
--

--
-- Database "keycloak" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 16.1 (Debian 16.1-1.pgdg120+1)
-- Dumped by pg_dump version 16.1 (Debian 16.1-1.pgdg120+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: keycloak; Type: DATABASE; Schema: -; Owner: keycloak
--

CREATE DATABASE keycloak WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';


ALTER DATABASE keycloak OWNER TO keycloak;

\connect keycloak

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: admin_event_entity; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.admin_event_entity (
    id character varying(36) NOT NULL,
    admin_event_time bigint,
    realm_id character varying(255),
    operation_type character varying(255),
    auth_realm_id character varying(255),
    auth_client_id character varying(255),
    auth_user_id character varying(255),
    ip_address character varying(255),
    resource_path character varying(2550),
    representation text,
    error character varying(255),
    resource_type character varying(64)
);


ALTER TABLE public.admin_event_entity OWNER TO keycloak;

--
-- Name: associated_policy; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.associated_policy (
    policy_id character varying(36) NOT NULL,
    associated_policy_id character varying(36) NOT NULL
);


ALTER TABLE public.associated_policy OWNER TO keycloak;

--
-- Name: authentication_execution; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.authentication_execution (
    id character varying(36) NOT NULL,
    alias character varying(255),
    authenticator character varying(36),
    realm_id character varying(36),
    flow_id character varying(36),
    requirement integer,
    priority integer,
    authenticator_flow boolean DEFAULT false NOT NULL,
    auth_flow_id character varying(36),
    auth_config character varying(36)
);


ALTER TABLE public.authentication_execution OWNER TO keycloak;

--
-- Name: authentication_flow; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.authentication_flow (
    id character varying(36) NOT NULL,
    alias character varying(255),
    description character varying(255),
    realm_id character varying(36),
    provider_id character varying(36) DEFAULT 'basic-flow'::character varying NOT NULL,
    top_level boolean DEFAULT false NOT NULL,
    built_in boolean DEFAULT false NOT NULL
);


ALTER TABLE public.authentication_flow OWNER TO keycloak;

--
-- Name: authenticator_config; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.authenticator_config (
    id character varying(36) NOT NULL,
    alias character varying(255),
    realm_id character varying(36)
);


ALTER TABLE public.authenticator_config OWNER TO keycloak;

--
-- Name: authenticator_config_entry; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.authenticator_config_entry (
    authenticator_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE public.authenticator_config_entry OWNER TO keycloak;

--
-- Name: broker_link; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.broker_link (
    identity_provider character varying(255) NOT NULL,
    storage_provider_id character varying(255),
    realm_id character varying(36) NOT NULL,
    broker_user_id character varying(255),
    broker_username character varying(255),
    token text,
    user_id character varying(255) NOT NULL
);


ALTER TABLE public.broker_link OWNER TO keycloak;

--
-- Name: client; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client (
    id character varying(36) NOT NULL,
    enabled boolean DEFAULT false NOT NULL,
    full_scope_allowed boolean DEFAULT false NOT NULL,
    client_id character varying(255),
    not_before integer,
    public_client boolean DEFAULT false NOT NULL,
    secret character varying(255),
    base_url character varying(255),
    bearer_only boolean DEFAULT false NOT NULL,
    management_url character varying(255),
    surrogate_auth_required boolean DEFAULT false NOT NULL,
    realm_id character varying(36),
    protocol character varying(255),
    node_rereg_timeout integer DEFAULT 0,
    frontchannel_logout boolean DEFAULT false NOT NULL,
    consent_required boolean DEFAULT false NOT NULL,
    name character varying(255),
    service_accounts_enabled boolean DEFAULT false NOT NULL,
    client_authenticator_type character varying(255),
    root_url character varying(255),
    description character varying(255),
    registration_token character varying(255),
    standard_flow_enabled boolean DEFAULT true NOT NULL,
    implicit_flow_enabled boolean DEFAULT false NOT NULL,
    direct_access_grants_enabled boolean DEFAULT false NOT NULL,
    always_display_in_console boolean DEFAULT false NOT NULL
);


ALTER TABLE public.client OWNER TO keycloak;

--
-- Name: client_attributes; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_attributes (
    client_id character varying(36) NOT NULL,
    value character varying(4000),
    name character varying(255) NOT NULL
);


ALTER TABLE public.client_attributes OWNER TO keycloak;

--
-- Name: client_auth_flow_bindings; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_auth_flow_bindings (
    client_id character varying(36) NOT NULL,
    flow_id character varying(36),
    binding_name character varying(255) NOT NULL
);


ALTER TABLE public.client_auth_flow_bindings OWNER TO keycloak;

--
-- Name: client_initial_access; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_initial_access (
    id character varying(36) NOT NULL,
    realm_id character varying(36) NOT NULL,
    "timestamp" integer,
    expiration integer,
    count integer,
    remaining_count integer
);


ALTER TABLE public.client_initial_access OWNER TO keycloak;

--
-- Name: client_node_registrations; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_node_registrations (
    client_id character varying(36) NOT NULL,
    value integer,
    name character varying(255) NOT NULL
);


ALTER TABLE public.client_node_registrations OWNER TO keycloak;

--
-- Name: client_scope; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_scope (
    id character varying(36) NOT NULL,
    name character varying(255),
    realm_id character varying(36),
    description character varying(255),
    protocol character varying(255)
);


ALTER TABLE public.client_scope OWNER TO keycloak;

--
-- Name: client_scope_attributes; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_scope_attributes (
    scope_id character varying(36) NOT NULL,
    value character varying(2048),
    name character varying(255) NOT NULL
);


ALTER TABLE public.client_scope_attributes OWNER TO keycloak;

--
-- Name: client_scope_client; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_scope_client (
    client_id character varying(255) NOT NULL,
    scope_id character varying(255) NOT NULL,
    default_scope boolean DEFAULT false NOT NULL
);


ALTER TABLE public.client_scope_client OWNER TO keycloak;

--
-- Name: client_scope_role_mapping; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_scope_role_mapping (
    scope_id character varying(36) NOT NULL,
    role_id character varying(36) NOT NULL
);


ALTER TABLE public.client_scope_role_mapping OWNER TO keycloak;

--
-- Name: client_session; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_session (
    id character varying(36) NOT NULL,
    client_id character varying(36),
    redirect_uri character varying(255),
    state character varying(255),
    "timestamp" integer,
    session_id character varying(36),
    auth_method character varying(255),
    realm_id character varying(255),
    auth_user_id character varying(36),
    current_action character varying(36)
);


ALTER TABLE public.client_session OWNER TO keycloak;

--
-- Name: client_session_auth_status; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_session_auth_status (
    authenticator character varying(36) NOT NULL,
    status integer,
    client_session character varying(36) NOT NULL
);


ALTER TABLE public.client_session_auth_status OWNER TO keycloak;

--
-- Name: client_session_note; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_session_note (
    name character varying(255) NOT NULL,
    value character varying(255),
    client_session character varying(36) NOT NULL
);


ALTER TABLE public.client_session_note OWNER TO keycloak;

--
-- Name: client_session_prot_mapper; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_session_prot_mapper (
    protocol_mapper_id character varying(36) NOT NULL,
    client_session character varying(36) NOT NULL
);


ALTER TABLE public.client_session_prot_mapper OWNER TO keycloak;

--
-- Name: client_session_role; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_session_role (
    role_id character varying(255) NOT NULL,
    client_session character varying(36) NOT NULL
);


ALTER TABLE public.client_session_role OWNER TO keycloak;

--
-- Name: client_user_session_note; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_user_session_note (
    name character varying(255) NOT NULL,
    value character varying(2048),
    client_session character varying(36) NOT NULL
);


ALTER TABLE public.client_user_session_note OWNER TO keycloak;

--
-- Name: component; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.component (
    id character varying(36) NOT NULL,
    name character varying(255),
    parent_id character varying(36),
    provider_id character varying(36),
    provider_type character varying(255),
    realm_id character varying(36),
    sub_type character varying(255)
);


ALTER TABLE public.component OWNER TO keycloak;

--
-- Name: component_config; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.component_config (
    id character varying(36) NOT NULL,
    component_id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(4000)
);


ALTER TABLE public.component_config OWNER TO keycloak;

--
-- Name: composite_role; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.composite_role (
    composite character varying(36) NOT NULL,
    child_role character varying(36) NOT NULL
);


ALTER TABLE public.composite_role OWNER TO keycloak;

--
-- Name: credential; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.credential (
    id character varying(36) NOT NULL,
    salt bytea,
    type character varying(255),
    user_id character varying(36),
    created_date bigint,
    user_label character varying(255),
    secret_data text,
    credential_data text,
    priority integer
);


ALTER TABLE public.credential OWNER TO keycloak;

--
-- Name: databasechangelog; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.databasechangelog (
    id character varying(255) NOT NULL,
    author character varying(255) NOT NULL,
    filename character varying(255) NOT NULL,
    dateexecuted timestamp without time zone NOT NULL,
    orderexecuted integer NOT NULL,
    exectype character varying(10) NOT NULL,
    md5sum character varying(35),
    description character varying(255),
    comments character varying(255),
    tag character varying(255),
    liquibase character varying(20),
    contexts character varying(255),
    labels character varying(255),
    deployment_id character varying(10)
);


ALTER TABLE public.databasechangelog OWNER TO keycloak;

--
-- Name: databasechangeloglock; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.databasechangeloglock (
    id integer NOT NULL,
    locked boolean NOT NULL,
    lockgranted timestamp without time zone,
    lockedby character varying(255)
);


ALTER TABLE public.databasechangeloglock OWNER TO keycloak;

--
-- Name: default_client_scope; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.default_client_scope (
    realm_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL,
    default_scope boolean DEFAULT false NOT NULL
);


ALTER TABLE public.default_client_scope OWNER TO keycloak;

--
-- Name: event_entity; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.event_entity (
    id character varying(36) NOT NULL,
    client_id character varying(255),
    details_json character varying(2550),
    error character varying(255),
    ip_address character varying(255),
    realm_id character varying(255),
    session_id character varying(255),
    event_time bigint,
    type character varying(255),
    user_id character varying(255)
);


ALTER TABLE public.event_entity OWNER TO keycloak;

--
-- Name: fed_user_attribute; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.fed_user_attribute (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36),
    value character varying(2024)
);


ALTER TABLE public.fed_user_attribute OWNER TO keycloak;

--
-- Name: fed_user_consent; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.fed_user_consent (
    id character varying(36) NOT NULL,
    client_id character varying(255),
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36),
    created_date bigint,
    last_updated_date bigint,
    client_storage_provider character varying(36),
    external_client_id character varying(255)
);


ALTER TABLE public.fed_user_consent OWNER TO keycloak;

--
-- Name: fed_user_consent_cl_scope; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.fed_user_consent_cl_scope (
    user_consent_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL
);


ALTER TABLE public.fed_user_consent_cl_scope OWNER TO keycloak;

--
-- Name: fed_user_credential; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.fed_user_credential (
    id character varying(36) NOT NULL,
    salt bytea,
    type character varying(255),
    created_date bigint,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36),
    user_label character varying(255),
    secret_data text,
    credential_data text,
    priority integer
);


ALTER TABLE public.fed_user_credential OWNER TO keycloak;

--
-- Name: fed_user_group_membership; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.fed_user_group_membership (
    group_id character varying(36) NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36)
);


ALTER TABLE public.fed_user_group_membership OWNER TO keycloak;

--
-- Name: fed_user_required_action; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.fed_user_required_action (
    required_action character varying(255) DEFAULT ' '::character varying NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36)
);


ALTER TABLE public.fed_user_required_action OWNER TO keycloak;

--
-- Name: fed_user_role_mapping; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.fed_user_role_mapping (
    role_id character varying(36) NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36)
);


ALTER TABLE public.fed_user_role_mapping OWNER TO keycloak;

--
-- Name: federated_identity; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.federated_identity (
    identity_provider character varying(255) NOT NULL,
    realm_id character varying(36),
    federated_user_id character varying(255),
    federated_username character varying(255),
    token text,
    user_id character varying(36) NOT NULL
);


ALTER TABLE public.federated_identity OWNER TO keycloak;

--
-- Name: federated_user; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.federated_user (
    id character varying(255) NOT NULL,
    storage_provider_id character varying(255),
    realm_id character varying(36) NOT NULL
);


ALTER TABLE public.federated_user OWNER TO keycloak;

--
-- Name: group_attribute; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.group_attribute (
    id character varying(36) DEFAULT 'sybase-needs-something-here'::character varying NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(255),
    group_id character varying(36) NOT NULL
);


ALTER TABLE public.group_attribute OWNER TO keycloak;

--
-- Name: group_role_mapping; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.group_role_mapping (
    role_id character varying(36) NOT NULL,
    group_id character varying(36) NOT NULL
);


ALTER TABLE public.group_role_mapping OWNER TO keycloak;

--
-- Name: identity_provider; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.identity_provider (
    internal_id character varying(36) NOT NULL,
    enabled boolean DEFAULT false NOT NULL,
    provider_alias character varying(255),
    provider_id character varying(255),
    store_token boolean DEFAULT false NOT NULL,
    authenticate_by_default boolean DEFAULT false NOT NULL,
    realm_id character varying(36),
    add_token_role boolean DEFAULT true NOT NULL,
    trust_email boolean DEFAULT false NOT NULL,
    first_broker_login_flow_id character varying(36),
    post_broker_login_flow_id character varying(36),
    provider_display_name character varying(255),
    link_only boolean DEFAULT false NOT NULL
);


ALTER TABLE public.identity_provider OWNER TO keycloak;

--
-- Name: identity_provider_config; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.identity_provider_config (
    identity_provider_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE public.identity_provider_config OWNER TO keycloak;

--
-- Name: identity_provider_mapper; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.identity_provider_mapper (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    idp_alias character varying(255) NOT NULL,
    idp_mapper_name character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL
);


ALTER TABLE public.identity_provider_mapper OWNER TO keycloak;

--
-- Name: idp_mapper_config; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.idp_mapper_config (
    idp_mapper_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE public.idp_mapper_config OWNER TO keycloak;

--
-- Name: keycloak_group; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.keycloak_group (
    id character varying(36) NOT NULL,
    name character varying(255),
    parent_group character varying(36) NOT NULL,
    realm_id character varying(36)
);


ALTER TABLE public.keycloak_group OWNER TO keycloak;

--
-- Name: keycloak_role; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.keycloak_role (
    id character varying(36) NOT NULL,
    client_realm_constraint character varying(255),
    client_role boolean DEFAULT false NOT NULL,
    description character varying(255),
    name character varying(255),
    realm_id character varying(255),
    client character varying(36),
    realm character varying(36)
);


ALTER TABLE public.keycloak_role OWNER TO keycloak;

--
-- Name: migration_model; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.migration_model (
    id character varying(36) NOT NULL,
    version character varying(36),
    update_time bigint DEFAULT 0 NOT NULL
);


ALTER TABLE public.migration_model OWNER TO keycloak;

--
-- Name: offline_client_session; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.offline_client_session (
    user_session_id character varying(36) NOT NULL,
    client_id character varying(255) NOT NULL,
    offline_flag character varying(4) NOT NULL,
    "timestamp" integer,
    data text,
    client_storage_provider character varying(36) DEFAULT 'local'::character varying NOT NULL,
    external_client_id character varying(255) DEFAULT 'local'::character varying NOT NULL
);


ALTER TABLE public.offline_client_session OWNER TO keycloak;

--
-- Name: offline_user_session; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.offline_user_session (
    user_session_id character varying(36) NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    created_on integer NOT NULL,
    offline_flag character varying(4) NOT NULL,
    data text,
    last_session_refresh integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.offline_user_session OWNER TO keycloak;

--
-- Name: policy_config; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.policy_config (
    policy_id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value text
);


ALTER TABLE public.policy_config OWNER TO keycloak;

--
-- Name: protocol_mapper; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.protocol_mapper (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    protocol character varying(255) NOT NULL,
    protocol_mapper_name character varying(255) NOT NULL,
    client_id character varying(36),
    client_scope_id character varying(36)
);


ALTER TABLE public.protocol_mapper OWNER TO keycloak;

--
-- Name: protocol_mapper_config; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.protocol_mapper_config (
    protocol_mapper_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE public.protocol_mapper_config OWNER TO keycloak;

--
-- Name: realm; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.realm (
    id character varying(36) NOT NULL,
    access_code_lifespan integer,
    user_action_lifespan integer,
    access_token_lifespan integer,
    account_theme character varying(255),
    admin_theme character varying(255),
    email_theme character varying(255),
    enabled boolean DEFAULT false NOT NULL,
    events_enabled boolean DEFAULT false NOT NULL,
    events_expiration bigint,
    login_theme character varying(255),
    name character varying(255),
    not_before integer,
    password_policy character varying(2550),
    registration_allowed boolean DEFAULT false NOT NULL,
    remember_me boolean DEFAULT false NOT NULL,
    reset_password_allowed boolean DEFAULT false NOT NULL,
    social boolean DEFAULT false NOT NULL,
    ssl_required character varying(255),
    sso_idle_timeout integer,
    sso_max_lifespan integer,
    update_profile_on_soc_login boolean DEFAULT false NOT NULL,
    verify_email boolean DEFAULT false NOT NULL,
    master_admin_client character varying(36),
    login_lifespan integer,
    internationalization_enabled boolean DEFAULT false NOT NULL,
    default_locale character varying(255),
    reg_email_as_username boolean DEFAULT false NOT NULL,
    admin_events_enabled boolean DEFAULT false NOT NULL,
    admin_events_details_enabled boolean DEFAULT false NOT NULL,
    edit_username_allowed boolean DEFAULT false NOT NULL,
    otp_policy_counter integer DEFAULT 0,
    otp_policy_window integer DEFAULT 1,
    otp_policy_period integer DEFAULT 30,
    otp_policy_digits integer DEFAULT 6,
    otp_policy_alg character varying(36) DEFAULT 'HmacSHA1'::character varying,
    otp_policy_type character varying(36) DEFAULT 'totp'::character varying,
    browser_flow character varying(36),
    registration_flow character varying(36),
    direct_grant_flow character varying(36),
    reset_credentials_flow character varying(36),
    client_auth_flow character varying(36),
    offline_session_idle_timeout integer DEFAULT 0,
    revoke_refresh_token boolean DEFAULT false NOT NULL,
    access_token_life_implicit integer DEFAULT 0,
    login_with_email_allowed boolean DEFAULT true NOT NULL,
    duplicate_emails_allowed boolean DEFAULT false NOT NULL,
    docker_auth_flow character varying(36),
    refresh_token_max_reuse integer DEFAULT 0,
    allow_user_managed_access boolean DEFAULT false NOT NULL,
    sso_max_lifespan_remember_me integer DEFAULT 0 NOT NULL,
    sso_idle_timeout_remember_me integer DEFAULT 0 NOT NULL,
    default_role character varying(255)
);


ALTER TABLE public.realm OWNER TO keycloak;

--
-- Name: realm_attribute; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.realm_attribute (
    name character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    value text
);


ALTER TABLE public.realm_attribute OWNER TO keycloak;

--
-- Name: realm_default_groups; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.realm_default_groups (
    realm_id character varying(36) NOT NULL,
    group_id character varying(36) NOT NULL
);


ALTER TABLE public.realm_default_groups OWNER TO keycloak;

--
-- Name: realm_enabled_event_types; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.realm_enabled_event_types (
    realm_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.realm_enabled_event_types OWNER TO keycloak;

--
-- Name: realm_events_listeners; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.realm_events_listeners (
    realm_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.realm_events_listeners OWNER TO keycloak;

--
-- Name: realm_localizations; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.realm_localizations (
    realm_id character varying(255) NOT NULL,
    locale character varying(255) NOT NULL,
    texts text NOT NULL
);


ALTER TABLE public.realm_localizations OWNER TO keycloak;

--
-- Name: realm_required_credential; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.realm_required_credential (
    type character varying(255) NOT NULL,
    form_label character varying(255),
    input boolean DEFAULT false NOT NULL,
    secret boolean DEFAULT false NOT NULL,
    realm_id character varying(36) NOT NULL
);


ALTER TABLE public.realm_required_credential OWNER TO keycloak;

--
-- Name: realm_smtp_config; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.realm_smtp_config (
    realm_id character varying(36) NOT NULL,
    value character varying(255),
    name character varying(255) NOT NULL
);


ALTER TABLE public.realm_smtp_config OWNER TO keycloak;

--
-- Name: realm_supported_locales; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.realm_supported_locales (
    realm_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.realm_supported_locales OWNER TO keycloak;

--
-- Name: redirect_uris; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.redirect_uris (
    client_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.redirect_uris OWNER TO keycloak;

--
-- Name: required_action_config; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.required_action_config (
    required_action_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE public.required_action_config OWNER TO keycloak;

--
-- Name: required_action_provider; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.required_action_provider (
    id character varying(36) NOT NULL,
    alias character varying(255),
    name character varying(255),
    realm_id character varying(36),
    enabled boolean DEFAULT false NOT NULL,
    default_action boolean DEFAULT false NOT NULL,
    provider_id character varying(255),
    priority integer
);


ALTER TABLE public.required_action_provider OWNER TO keycloak;

--
-- Name: resource_attribute; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.resource_attribute (
    id character varying(36) DEFAULT 'sybase-needs-something-here'::character varying NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(255),
    resource_id character varying(36) NOT NULL
);


ALTER TABLE public.resource_attribute OWNER TO keycloak;

--
-- Name: resource_policy; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.resource_policy (
    resource_id character varying(36) NOT NULL,
    policy_id character varying(36) NOT NULL
);


ALTER TABLE public.resource_policy OWNER TO keycloak;

--
-- Name: resource_scope; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.resource_scope (
    resource_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL
);


ALTER TABLE public.resource_scope OWNER TO keycloak;

--
-- Name: resource_server; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.resource_server (
    id character varying(36) NOT NULL,
    allow_rs_remote_mgmt boolean DEFAULT false NOT NULL,
    policy_enforce_mode character varying(15) NOT NULL,
    decision_strategy smallint DEFAULT 1 NOT NULL
);


ALTER TABLE public.resource_server OWNER TO keycloak;

--
-- Name: resource_server_perm_ticket; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.resource_server_perm_ticket (
    id character varying(36) NOT NULL,
    owner character varying(255) NOT NULL,
    requester character varying(255) NOT NULL,
    created_timestamp bigint NOT NULL,
    granted_timestamp bigint,
    resource_id character varying(36) NOT NULL,
    scope_id character varying(36),
    resource_server_id character varying(36) NOT NULL,
    policy_id character varying(36)
);


ALTER TABLE public.resource_server_perm_ticket OWNER TO keycloak;

--
-- Name: resource_server_policy; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.resource_server_policy (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    description character varying(255),
    type character varying(255) NOT NULL,
    decision_strategy character varying(20),
    logic character varying(20),
    resource_server_id character varying(36) NOT NULL,
    owner character varying(255)
);


ALTER TABLE public.resource_server_policy OWNER TO keycloak;

--
-- Name: resource_server_resource; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.resource_server_resource (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    type character varying(255),
    icon_uri character varying(255),
    owner character varying(255) NOT NULL,
    resource_server_id character varying(36) NOT NULL,
    owner_managed_access boolean DEFAULT false NOT NULL,
    display_name character varying(255)
);


ALTER TABLE public.resource_server_resource OWNER TO keycloak;

--
-- Name: resource_server_scope; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.resource_server_scope (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    icon_uri character varying(255),
    resource_server_id character varying(36) NOT NULL,
    display_name character varying(255)
);


ALTER TABLE public.resource_server_scope OWNER TO keycloak;

--
-- Name: resource_uris; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.resource_uris (
    resource_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.resource_uris OWNER TO keycloak;

--
-- Name: role_attribute; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.role_attribute (
    id character varying(36) NOT NULL,
    role_id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(255)
);


ALTER TABLE public.role_attribute OWNER TO keycloak;

--
-- Name: scope_mapping; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.scope_mapping (
    client_id character varying(36) NOT NULL,
    role_id character varying(36) NOT NULL
);


ALTER TABLE public.scope_mapping OWNER TO keycloak;

--
-- Name: scope_policy; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.scope_policy (
    scope_id character varying(36) NOT NULL,
    policy_id character varying(36) NOT NULL
);


ALTER TABLE public.scope_policy OWNER TO keycloak;

--
-- Name: user_attribute; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_attribute (
    name character varying(255) NOT NULL,
    value character varying(255),
    user_id character varying(36) NOT NULL,
    id character varying(36) DEFAULT 'sybase-needs-something-here'::character varying NOT NULL
);


ALTER TABLE public.user_attribute OWNER TO keycloak;

--
-- Name: user_consent; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_consent (
    id character varying(36) NOT NULL,
    client_id character varying(255),
    user_id character varying(36) NOT NULL,
    created_date bigint,
    last_updated_date bigint,
    client_storage_provider character varying(36),
    external_client_id character varying(255)
);


ALTER TABLE public.user_consent OWNER TO keycloak;

--
-- Name: user_consent_client_scope; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_consent_client_scope (
    user_consent_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL
);


ALTER TABLE public.user_consent_client_scope OWNER TO keycloak;

--
-- Name: user_entity; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_entity (
    id character varying(36) NOT NULL,
    email character varying(255),
    email_constraint character varying(255),
    email_verified boolean DEFAULT false NOT NULL,
    enabled boolean DEFAULT false NOT NULL,
    federation_link character varying(255),
    first_name character varying(255),
    last_name character varying(255),
    realm_id character varying(255),
    username character varying(255),
    created_timestamp bigint,
    service_account_client_link character varying(255),
    not_before integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.user_entity OWNER TO keycloak;

--
-- Name: user_federation_config; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_federation_config (
    user_federation_provider_id character varying(36) NOT NULL,
    value character varying(255),
    name character varying(255) NOT NULL
);


ALTER TABLE public.user_federation_config OWNER TO keycloak;

--
-- Name: user_federation_mapper; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_federation_mapper (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    federation_provider_id character varying(36) NOT NULL,
    federation_mapper_type character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL
);


ALTER TABLE public.user_federation_mapper OWNER TO keycloak;

--
-- Name: user_federation_mapper_config; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_federation_mapper_config (
    user_federation_mapper_id character varying(36) NOT NULL,
    value character varying(255),
    name character varying(255) NOT NULL
);


ALTER TABLE public.user_federation_mapper_config OWNER TO keycloak;

--
-- Name: user_federation_provider; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_federation_provider (
    id character varying(36) NOT NULL,
    changed_sync_period integer,
    display_name character varying(255),
    full_sync_period integer,
    last_sync integer,
    priority integer,
    provider_name character varying(255),
    realm_id character varying(36)
);


ALTER TABLE public.user_federation_provider OWNER TO keycloak;

--
-- Name: user_group_membership; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_group_membership (
    group_id character varying(36) NOT NULL,
    user_id character varying(36) NOT NULL
);


ALTER TABLE public.user_group_membership OWNER TO keycloak;

--
-- Name: user_required_action; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_required_action (
    user_id character varying(36) NOT NULL,
    required_action character varying(255) DEFAULT ' '::character varying NOT NULL
);


ALTER TABLE public.user_required_action OWNER TO keycloak;

--
-- Name: user_role_mapping; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_role_mapping (
    role_id character varying(255) NOT NULL,
    user_id character varying(36) NOT NULL
);


ALTER TABLE public.user_role_mapping OWNER TO keycloak;

--
-- Name: user_session; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_session (
    id character varying(36) NOT NULL,
    auth_method character varying(255),
    ip_address character varying(255),
    last_session_refresh integer,
    login_username character varying(255),
    realm_id character varying(255),
    remember_me boolean DEFAULT false NOT NULL,
    started integer,
    user_id character varying(255),
    user_session_state integer,
    broker_session_id character varying(255),
    broker_user_id character varying(255)
);


ALTER TABLE public.user_session OWNER TO keycloak;

--
-- Name: user_session_note; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_session_note (
    user_session character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(2048)
);


ALTER TABLE public.user_session_note OWNER TO keycloak;

--
-- Name: username_login_failure; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.username_login_failure (
    realm_id character varying(36) NOT NULL,
    username character varying(255) NOT NULL,
    failed_login_not_before integer,
    last_failure bigint,
    last_ip_failure character varying(255),
    num_failures integer
);


ALTER TABLE public.username_login_failure OWNER TO keycloak;

--
-- Name: web_origins; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.web_origins (
    client_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.web_origins OWNER TO keycloak;

--
-- Data for Name: admin_event_entity; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.admin_event_entity (id, admin_event_time, realm_id, operation_type, auth_realm_id, auth_client_id, auth_user_id, ip_address, resource_path, representation, error, resource_type) FROM stdin;
\.


--
-- Data for Name: associated_policy; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.associated_policy (policy_id, associated_policy_id) FROM stdin;
\.


--
-- Data for Name: authentication_execution; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) FROM stdin;
eacc9b85-748f-4065-a603-9cf8953a1184	\N	auth-cookie	04fb5b65-a9ea-4a2d-8f5e-0b7fad82a2da	e26c7ee6-1a37-4690-b45d-ac4c6ac2ae6c	2	10	f	\N	\N
7373a1e0-f361-476d-9820-e7c95f0fb0fa	\N	auth-spnego	04fb5b65-a9ea-4a2d-8f5e-0b7fad82a2da	e26c7ee6-1a37-4690-b45d-ac4c6ac2ae6c	3	20	f	\N	\N
6c88adea-d88c-4ffe-a3d9-cc54fd45033e	\N	identity-provider-redirector	04fb5b65-a9ea-4a2d-8f5e-0b7fad82a2da	e26c7ee6-1a37-4690-b45d-ac4c6ac2ae6c	2	25	f	\N	\N
60538cfa-5b5f-42b0-8c7c-ff3e7909efe5	\N	\N	04fb5b65-a9ea-4a2d-8f5e-0b7fad82a2da	e26c7ee6-1a37-4690-b45d-ac4c6ac2ae6c	2	30	t	d333607d-517b-44cc-9756-c35c13b7f432	\N
0c40727b-087b-41b5-a74a-a696085658fa	\N	auth-username-password-form	04fb5b65-a9ea-4a2d-8f5e-0b7fad82a2da	d333607d-517b-44cc-9756-c35c13b7f432	0	10	f	\N	\N
1af717fa-1cb2-4f6c-8296-dec343bb0cf4	\N	\N	04fb5b65-a9ea-4a2d-8f5e-0b7fad82a2da	d333607d-517b-44cc-9756-c35c13b7f432	1	20	t	52a96edc-041b-44ab-b907-336bf79265f1	\N
f320adad-7af4-4559-8f49-705c2150bf84	\N	conditional-user-configured	04fb5b65-a9ea-4a2d-8f5e-0b7fad82a2da	52a96edc-041b-44ab-b907-336bf79265f1	0	10	f	\N	\N
83b470fd-8341-4dbe-8a9e-196c2dc40f63	\N	auth-otp-form	04fb5b65-a9ea-4a2d-8f5e-0b7fad82a2da	52a96edc-041b-44ab-b907-336bf79265f1	0	20	f	\N	\N
05f336ee-4706-480e-ab8e-db82bb69c2a1	\N	direct-grant-validate-username	04fb5b65-a9ea-4a2d-8f5e-0b7fad82a2da	6577f7ef-83dd-48ed-815b-699b935c231b	0	10	f	\N	\N
3e73d680-a4cc-4c96-b573-63aee7583875	\N	direct-grant-validate-password	04fb5b65-a9ea-4a2d-8f5e-0b7fad82a2da	6577f7ef-83dd-48ed-815b-699b935c231b	0	20	f	\N	\N
e3ce4733-f92d-4b4b-aedb-83359e990276	\N	\N	04fb5b65-a9ea-4a2d-8f5e-0b7fad82a2da	6577f7ef-83dd-48ed-815b-699b935c231b	1	30	t	d313bb47-b8b8-42ed-9b24-0c37b2486bf6	\N
eef549ad-d973-4890-95d7-629705511049	\N	conditional-user-configured	04fb5b65-a9ea-4a2d-8f5e-0b7fad82a2da	d313bb47-b8b8-42ed-9b24-0c37b2486bf6	0	10	f	\N	\N
8da67abe-d5bb-4fda-9096-0be8cb3d62f8	\N	direct-grant-validate-otp	04fb5b65-a9ea-4a2d-8f5e-0b7fad82a2da	d313bb47-b8b8-42ed-9b24-0c37b2486bf6	0	20	f	\N	\N
1acace36-fe39-4d1c-9e4d-7cf408dccf7f	\N	registration-page-form	04fb5b65-a9ea-4a2d-8f5e-0b7fad82a2da	bbcfeb4f-e805-442e-82ae-202e873a93ac	0	10	t	ad5a1ca3-6f0a-436f-96d8-1cddbfecdeb5	\N
9e6dd8fc-c916-48c9-9f7f-e6d2f7a4cb41	\N	registration-user-creation	04fb5b65-a9ea-4a2d-8f5e-0b7fad82a2da	ad5a1ca3-6f0a-436f-96d8-1cddbfecdeb5	0	20	f	\N	\N
ce2c5cd7-1cf2-4985-b24a-d397d81a86ca	\N	registration-profile-action	04fb5b65-a9ea-4a2d-8f5e-0b7fad82a2da	ad5a1ca3-6f0a-436f-96d8-1cddbfecdeb5	0	40	f	\N	\N
147a79e7-46b2-492d-a716-32d33f6413a6	\N	registration-password-action	04fb5b65-a9ea-4a2d-8f5e-0b7fad82a2da	ad5a1ca3-6f0a-436f-96d8-1cddbfecdeb5	0	50	f	\N	\N
3962e009-3040-4981-a923-cae874e6d85e	\N	registration-recaptcha-action	04fb5b65-a9ea-4a2d-8f5e-0b7fad82a2da	ad5a1ca3-6f0a-436f-96d8-1cddbfecdeb5	3	60	f	\N	\N
fb27fae2-156d-4053-b69d-9bb0edeafa92	\N	reset-credentials-choose-user	04fb5b65-a9ea-4a2d-8f5e-0b7fad82a2da	b869f12a-3997-4340-8057-08d824aef866	0	10	f	\N	\N
1d17b0c8-af7e-468f-8e73-8638cd0df4dd	\N	reset-credential-email	04fb5b65-a9ea-4a2d-8f5e-0b7fad82a2da	b869f12a-3997-4340-8057-08d824aef866	0	20	f	\N	\N
c9adfa6c-44e8-4679-906b-25197f974bca	\N	reset-password	04fb5b65-a9ea-4a2d-8f5e-0b7fad82a2da	b869f12a-3997-4340-8057-08d824aef866	0	30	f	\N	\N
90db2993-814c-4088-80c0-c962ae2933d7	\N	\N	04fb5b65-a9ea-4a2d-8f5e-0b7fad82a2da	b869f12a-3997-4340-8057-08d824aef866	1	40	t	09066e73-04ca-42d6-86bc-d40c305b9450	\N
7f663f26-29cb-46f3-80a8-b1f6d44b7e43	\N	conditional-user-configured	04fb5b65-a9ea-4a2d-8f5e-0b7fad82a2da	09066e73-04ca-42d6-86bc-d40c305b9450	0	10	f	\N	\N
899a1653-8e55-415a-8e54-80ad740fe141	\N	reset-otp	04fb5b65-a9ea-4a2d-8f5e-0b7fad82a2da	09066e73-04ca-42d6-86bc-d40c305b9450	0	20	f	\N	\N
f3a3d401-9f96-4e91-a80b-39f75d790abe	\N	client-secret	04fb5b65-a9ea-4a2d-8f5e-0b7fad82a2da	706e42a6-f901-4eaa-b6c2-1dc038efd80b	2	10	f	\N	\N
9309a2d5-1fab-4a6f-a577-2406ccfc00a1	\N	client-jwt	04fb5b65-a9ea-4a2d-8f5e-0b7fad82a2da	706e42a6-f901-4eaa-b6c2-1dc038efd80b	2	20	f	\N	\N
d99908e8-652c-4c63-b688-877d138e232e	\N	client-secret-jwt	04fb5b65-a9ea-4a2d-8f5e-0b7fad82a2da	706e42a6-f901-4eaa-b6c2-1dc038efd80b	2	30	f	\N	\N
799ac1d1-d983-4efd-9825-51ffccfe00b1	\N	client-x509	04fb5b65-a9ea-4a2d-8f5e-0b7fad82a2da	706e42a6-f901-4eaa-b6c2-1dc038efd80b	2	40	f	\N	\N
52c2835c-4f50-4db5-97fa-81807fb0973a	\N	idp-review-profile	04fb5b65-a9ea-4a2d-8f5e-0b7fad82a2da	aff4ad99-ec58-4e7b-930a-eb8f27b364e7	0	10	f	\N	2a518a16-0000-4e94-b8e6-76e27cc6dc0d
b4657f16-d207-410b-87ac-ce59a9d0a56a	\N	\N	04fb5b65-a9ea-4a2d-8f5e-0b7fad82a2da	aff4ad99-ec58-4e7b-930a-eb8f27b364e7	0	20	t	87977566-1955-44bc-b7e1-6d8287fdc3ee	\N
ab8109ae-904b-439f-96a6-25753f9fe719	\N	idp-create-user-if-unique	04fb5b65-a9ea-4a2d-8f5e-0b7fad82a2da	87977566-1955-44bc-b7e1-6d8287fdc3ee	2	10	f	\N	fb12d1c1-0eac-43c3-9cc3-bfff8a6b1250
840388cc-b5e8-48fc-add7-ec46ed50832f	\N	\N	04fb5b65-a9ea-4a2d-8f5e-0b7fad82a2da	87977566-1955-44bc-b7e1-6d8287fdc3ee	2	20	t	9d1fe656-5001-41f3-881f-f9e22bee8c22	\N
81306d52-89b4-49be-882f-62cbcd47bba8	\N	idp-confirm-link	04fb5b65-a9ea-4a2d-8f5e-0b7fad82a2da	9d1fe656-5001-41f3-881f-f9e22bee8c22	0	10	f	\N	\N
152254bc-5fc1-4055-b7d3-66826dbbd86f	\N	\N	04fb5b65-a9ea-4a2d-8f5e-0b7fad82a2da	9d1fe656-5001-41f3-881f-f9e22bee8c22	0	20	t	28e859ce-396f-4a2f-adf4-4a5f23a4cc17	\N
3f813e60-acdc-4a86-9a91-530e5b145b4b	\N	idp-email-verification	04fb5b65-a9ea-4a2d-8f5e-0b7fad82a2da	28e859ce-396f-4a2f-adf4-4a5f23a4cc17	2	10	f	\N	\N
bbf8b4c6-fcec-4c8b-82bf-41a99927e14d	\N	\N	04fb5b65-a9ea-4a2d-8f5e-0b7fad82a2da	28e859ce-396f-4a2f-adf4-4a5f23a4cc17	2	20	t	f26c968a-0588-47e7-ab64-f34e240b2be5	\N
8fd69e5a-1a0c-4586-a728-d0b3a8d85690	\N	idp-username-password-form	04fb5b65-a9ea-4a2d-8f5e-0b7fad82a2da	f26c968a-0588-47e7-ab64-f34e240b2be5	0	10	f	\N	\N
11e03326-c1dd-4899-8760-8357585a31df	\N	\N	04fb5b65-a9ea-4a2d-8f5e-0b7fad82a2da	f26c968a-0588-47e7-ab64-f34e240b2be5	1	20	t	68139b47-68d5-452b-858f-a67df05ecdc7	\N
d6ce0417-254c-4f05-b00d-43f1e2c9656c	\N	conditional-user-configured	04fb5b65-a9ea-4a2d-8f5e-0b7fad82a2da	68139b47-68d5-452b-858f-a67df05ecdc7	0	10	f	\N	\N
dfec5ad7-d016-49ad-94ae-3cc6d9f66170	\N	auth-otp-form	04fb5b65-a9ea-4a2d-8f5e-0b7fad82a2da	68139b47-68d5-452b-858f-a67df05ecdc7	0	20	f	\N	\N
bedf246b-e9c0-46d9-979b-c94283792401	\N	http-basic-authenticator	04fb5b65-a9ea-4a2d-8f5e-0b7fad82a2da	babd9293-a2ff-4e4e-8896-d51e980f64c3	0	10	f	\N	\N
5aa0cdaa-62b7-4214-9af3-e89474d8b17d	\N	docker-http-basic-authenticator	04fb5b65-a9ea-4a2d-8f5e-0b7fad82a2da	10b9d5cb-43e6-493a-b0a1-34f1e2bc1998	0	10	f	\N	\N
23c9d8be-df65-4f32-a072-00f7db7da46b	\N	no-cookie-redirect	04fb5b65-a9ea-4a2d-8f5e-0b7fad82a2da	a9e64b61-0ab6-4b11-99b0-9acb80887443	0	10	f	\N	\N
e002fe14-7cc8-4924-ba56-2f66fb56bc41	\N	\N	04fb5b65-a9ea-4a2d-8f5e-0b7fad82a2da	a9e64b61-0ab6-4b11-99b0-9acb80887443	0	20	t	967e09c6-7750-4e45-8ddb-6aa208862e8b	\N
ec4aa7e8-a5e0-4480-8dc6-beb6814973f1	\N	basic-auth	04fb5b65-a9ea-4a2d-8f5e-0b7fad82a2da	967e09c6-7750-4e45-8ddb-6aa208862e8b	0	10	f	\N	\N
f28339d7-5b42-4ac0-8e4a-e56ea1d6fff4	\N	basic-auth-otp	04fb5b65-a9ea-4a2d-8f5e-0b7fad82a2da	967e09c6-7750-4e45-8ddb-6aa208862e8b	3	20	f	\N	\N
2ab1b4c0-e81e-430b-9a60-df657982deb0	\N	auth-spnego	04fb5b65-a9ea-4a2d-8f5e-0b7fad82a2da	967e09c6-7750-4e45-8ddb-6aa208862e8b	3	30	f	\N	\N
34886bf4-bd1e-43c7-8f19-d61dfa6a586a	\N	auth-cookie	eaaeb62f-362b-40bb-b7f1-d927afd6a6e9	99ca6a0c-b872-497e-a20e-585721e1a088	2	10	f	\N	\N
b3499d51-438c-4777-8759-102c44e2ea41	\N	auth-spnego	eaaeb62f-362b-40bb-b7f1-d927afd6a6e9	99ca6a0c-b872-497e-a20e-585721e1a088	3	20	f	\N	\N
b5496f1b-5992-4f0c-8526-deaa283aeb90	\N	identity-provider-redirector	eaaeb62f-362b-40bb-b7f1-d927afd6a6e9	99ca6a0c-b872-497e-a20e-585721e1a088	2	25	f	\N	\N
e2b3ef9a-00c8-4b28-af6e-51d7d8a8fc32	\N	\N	eaaeb62f-362b-40bb-b7f1-d927afd6a6e9	99ca6a0c-b872-497e-a20e-585721e1a088	2	30	t	6590cc2b-334e-479f-b0e4-184130a126f1	\N
de951e90-9df7-44c1-a411-63b68efa5e10	\N	auth-username-password-form	eaaeb62f-362b-40bb-b7f1-d927afd6a6e9	6590cc2b-334e-479f-b0e4-184130a126f1	0	10	f	\N	\N
d3bd9328-3b0a-40e2-bf32-4ea3d880c219	\N	\N	eaaeb62f-362b-40bb-b7f1-d927afd6a6e9	6590cc2b-334e-479f-b0e4-184130a126f1	1	20	t	e99eee12-70bd-48e7-98fa-9b3b493b3a2f	\N
cf7e46b8-2436-4912-afdd-97c9f255483b	\N	conditional-user-configured	eaaeb62f-362b-40bb-b7f1-d927afd6a6e9	e99eee12-70bd-48e7-98fa-9b3b493b3a2f	0	10	f	\N	\N
61d608ce-3f93-4c3c-a162-24a56a762410	\N	auth-otp-form	eaaeb62f-362b-40bb-b7f1-d927afd6a6e9	e99eee12-70bd-48e7-98fa-9b3b493b3a2f	0	20	f	\N	\N
ecec545d-20c5-4092-add9-5013fd710196	\N	direct-grant-validate-username	eaaeb62f-362b-40bb-b7f1-d927afd6a6e9	64ede502-69e4-417a-83cb-6af916e6ab0c	0	10	f	\N	\N
0d77a2db-371c-4e07-a577-7b100ad5d0cc	\N	direct-grant-validate-password	eaaeb62f-362b-40bb-b7f1-d927afd6a6e9	64ede502-69e4-417a-83cb-6af916e6ab0c	0	20	f	\N	\N
72283ccc-0094-4a92-9b73-eaf2632bb7db	\N	\N	eaaeb62f-362b-40bb-b7f1-d927afd6a6e9	64ede502-69e4-417a-83cb-6af916e6ab0c	1	30	t	6bf59b98-e56a-4c7f-a52a-b455483d86be	\N
b3676cbf-d1ba-4923-8437-b3bdb6592420	\N	conditional-user-configured	eaaeb62f-362b-40bb-b7f1-d927afd6a6e9	6bf59b98-e56a-4c7f-a52a-b455483d86be	0	10	f	\N	\N
9cf50db7-0835-4e79-98cc-84e2849104b6	\N	direct-grant-validate-otp	eaaeb62f-362b-40bb-b7f1-d927afd6a6e9	6bf59b98-e56a-4c7f-a52a-b455483d86be	0	20	f	\N	\N
47af2af0-739b-4b0f-8e9f-b82272d004ce	\N	registration-page-form	eaaeb62f-362b-40bb-b7f1-d927afd6a6e9	e03d2ae8-906d-44d1-8f8c-dbe6680728cf	0	10	t	17a53121-f9c5-4b0d-a83b-59d40d4a67fd	\N
fca13ffd-7f44-4bf7-9054-4431e72bbadf	\N	registration-user-creation	eaaeb62f-362b-40bb-b7f1-d927afd6a6e9	17a53121-f9c5-4b0d-a83b-59d40d4a67fd	0	20	f	\N	\N
cfc5cea3-a1c0-4fd7-9051-f627e31f9fa6	\N	registration-profile-action	eaaeb62f-362b-40bb-b7f1-d927afd6a6e9	17a53121-f9c5-4b0d-a83b-59d40d4a67fd	0	40	f	\N	\N
ca352dc9-07f1-4aa8-a43b-5f492c3b90a0	\N	registration-password-action	eaaeb62f-362b-40bb-b7f1-d927afd6a6e9	17a53121-f9c5-4b0d-a83b-59d40d4a67fd	0	50	f	\N	\N
a989026f-f975-49fc-bf96-39ee8060e96a	\N	registration-recaptcha-action	eaaeb62f-362b-40bb-b7f1-d927afd6a6e9	17a53121-f9c5-4b0d-a83b-59d40d4a67fd	3	60	f	\N	\N
ba0d81e6-87d2-4f85-acc5-ca798ac05d59	\N	reset-credentials-choose-user	eaaeb62f-362b-40bb-b7f1-d927afd6a6e9	059a3942-f75a-47e3-866e-3c59b3fe38c3	0	10	f	\N	\N
bcb0e84c-9db5-4181-a73e-f7e9316d5e36	\N	reset-credential-email	eaaeb62f-362b-40bb-b7f1-d927afd6a6e9	059a3942-f75a-47e3-866e-3c59b3fe38c3	0	20	f	\N	\N
1b20e056-9916-4223-8d3d-0dd3806d0a19	\N	reset-password	eaaeb62f-362b-40bb-b7f1-d927afd6a6e9	059a3942-f75a-47e3-866e-3c59b3fe38c3	0	30	f	\N	\N
32bc8df5-f68a-4e4e-a167-59a022639710	\N	\N	eaaeb62f-362b-40bb-b7f1-d927afd6a6e9	059a3942-f75a-47e3-866e-3c59b3fe38c3	1	40	t	5feba807-dcbf-4bad-84eb-24d818bfd1c4	\N
77e238ae-89e6-4434-bcc7-1ba71a5c3a08	\N	conditional-user-configured	eaaeb62f-362b-40bb-b7f1-d927afd6a6e9	5feba807-dcbf-4bad-84eb-24d818bfd1c4	0	10	f	\N	\N
e0ec9170-136c-4c9c-9c55-a7482c854eae	\N	reset-otp	eaaeb62f-362b-40bb-b7f1-d927afd6a6e9	5feba807-dcbf-4bad-84eb-24d818bfd1c4	0	20	f	\N	\N
0cbe5bc6-0d73-4c8a-a64d-1c605368c9a6	\N	client-secret	eaaeb62f-362b-40bb-b7f1-d927afd6a6e9	fae8dfd7-507f-452a-a8bf-a8475a1d66c0	2	10	f	\N	\N
e35574d3-b512-4fd5-8784-4c2bfbc6dcba	\N	client-jwt	eaaeb62f-362b-40bb-b7f1-d927afd6a6e9	fae8dfd7-507f-452a-a8bf-a8475a1d66c0	2	20	f	\N	\N
a35f48f4-ee95-4c54-865c-91aeacab0143	\N	client-secret-jwt	eaaeb62f-362b-40bb-b7f1-d927afd6a6e9	fae8dfd7-507f-452a-a8bf-a8475a1d66c0	2	30	f	\N	\N
fdc92f8c-93b1-4684-acda-9b7e255a569d	\N	client-x509	eaaeb62f-362b-40bb-b7f1-d927afd6a6e9	fae8dfd7-507f-452a-a8bf-a8475a1d66c0	2	40	f	\N	\N
1dfd30cd-18a3-4db1-90f1-c3531d743e54	\N	idp-review-profile	eaaeb62f-362b-40bb-b7f1-d927afd6a6e9	4224fefa-e080-4005-9a87-2cab72583746	0	10	f	\N	db6e42b8-af61-4138-a90a-1b368204ee7e
2d43cdbe-eb09-4c11-b87c-18171d9af19f	\N	\N	eaaeb62f-362b-40bb-b7f1-d927afd6a6e9	4224fefa-e080-4005-9a87-2cab72583746	0	20	t	b0984569-0c6f-4e62-baa8-047869752aa7	\N
1f26d23d-2da0-4233-86c7-3286c2d693bf	\N	idp-create-user-if-unique	eaaeb62f-362b-40bb-b7f1-d927afd6a6e9	b0984569-0c6f-4e62-baa8-047869752aa7	2	10	f	\N	ec7585ec-1374-4fc5-995b-403024859169
34346ccd-8a55-49d3-a926-09a9696c2783	\N	\N	eaaeb62f-362b-40bb-b7f1-d927afd6a6e9	b0984569-0c6f-4e62-baa8-047869752aa7	2	20	t	69b2e750-1c60-4f5c-8da3-e8a287f767a2	\N
50f90411-c0de-4890-b683-03e55c1b2696	\N	idp-confirm-link	eaaeb62f-362b-40bb-b7f1-d927afd6a6e9	69b2e750-1c60-4f5c-8da3-e8a287f767a2	0	10	f	\N	\N
f83cc9f9-7664-4ba5-a6e2-e0ae0f07c561	\N	\N	eaaeb62f-362b-40bb-b7f1-d927afd6a6e9	69b2e750-1c60-4f5c-8da3-e8a287f767a2	0	20	t	03eedb44-338e-491a-b017-2e94ec854254	\N
8397b57e-8b71-45b3-8be6-1e11d0c7e3d2	\N	idp-email-verification	eaaeb62f-362b-40bb-b7f1-d927afd6a6e9	03eedb44-338e-491a-b017-2e94ec854254	2	10	f	\N	\N
67fece42-dfd7-4642-ad47-4d6bea9998a7	\N	\N	eaaeb62f-362b-40bb-b7f1-d927afd6a6e9	03eedb44-338e-491a-b017-2e94ec854254	2	20	t	c435d015-8ebd-44f8-82af-9e50696fc504	\N
ffe52b70-f4a3-4cd2-acb2-1bdcd7619a80	\N	idp-username-password-form	eaaeb62f-362b-40bb-b7f1-d927afd6a6e9	c435d015-8ebd-44f8-82af-9e50696fc504	0	10	f	\N	\N
908acaed-210f-4085-9552-1a6bba3bb0ae	\N	\N	eaaeb62f-362b-40bb-b7f1-d927afd6a6e9	c435d015-8ebd-44f8-82af-9e50696fc504	1	20	t	4771b8fe-e059-49d7-99aa-089ff76ef9b3	\N
eeadd5fb-254e-4eda-8a8c-bfb8a486f199	\N	conditional-user-configured	eaaeb62f-362b-40bb-b7f1-d927afd6a6e9	4771b8fe-e059-49d7-99aa-089ff76ef9b3	0	10	f	\N	\N
96c78ebd-bc54-4384-a4f9-4de12c39c107	\N	auth-otp-form	eaaeb62f-362b-40bb-b7f1-d927afd6a6e9	4771b8fe-e059-49d7-99aa-089ff76ef9b3	0	20	f	\N	\N
4728f460-ddee-48f3-9411-65c0e539e2eb	\N	http-basic-authenticator	eaaeb62f-362b-40bb-b7f1-d927afd6a6e9	c284a577-0c1a-4cd8-b2c8-86b71dc25b62	0	10	f	\N	\N
5625c333-eaef-4022-892b-008b1aa43c0a	\N	docker-http-basic-authenticator	eaaeb62f-362b-40bb-b7f1-d927afd6a6e9	8280e70f-386b-4bdb-b727-5c90846759ba	0	10	f	\N	\N
a64f588d-975b-4d26-ac19-2b8ad002c9b5	\N	no-cookie-redirect	eaaeb62f-362b-40bb-b7f1-d927afd6a6e9	4e80800a-daf5-4415-996e-c7ec94a8a10f	0	10	f	\N	\N
73be62eb-6f65-47ea-81d7-2754bb20f9e7	\N	\N	eaaeb62f-362b-40bb-b7f1-d927afd6a6e9	4e80800a-daf5-4415-996e-c7ec94a8a10f	0	20	t	0832f0bb-b741-460d-9c6a-314e43cbef18	\N
3f289259-5845-494c-b5b8-f3d61ccaf85f	\N	basic-auth	eaaeb62f-362b-40bb-b7f1-d927afd6a6e9	0832f0bb-b741-460d-9c6a-314e43cbef18	0	10	f	\N	\N
0b9e6666-0338-458f-9f44-86181dd6f57f	\N	basic-auth-otp	eaaeb62f-362b-40bb-b7f1-d927afd6a6e9	0832f0bb-b741-460d-9c6a-314e43cbef18	3	20	f	\N	\N
ed8a9b2f-ea6b-483a-a2e2-62ff9694ba69	\N	auth-spnego	eaaeb62f-362b-40bb-b7f1-d927afd6a6e9	0832f0bb-b741-460d-9c6a-314e43cbef18	3	30	f	\N	\N
\.


--
-- Data for Name: authentication_flow; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in) FROM stdin;
e26c7ee6-1a37-4690-b45d-ac4c6ac2ae6c	browser	browser based authentication	04fb5b65-a9ea-4a2d-8f5e-0b7fad82a2da	basic-flow	t	t
d333607d-517b-44cc-9756-c35c13b7f432	forms	Username, password, otp and other auth forms.	04fb5b65-a9ea-4a2d-8f5e-0b7fad82a2da	basic-flow	f	t
52a96edc-041b-44ab-b907-336bf79265f1	Browser - Conditional OTP	Flow to determine if the OTP is required for the authentication	04fb5b65-a9ea-4a2d-8f5e-0b7fad82a2da	basic-flow	f	t
6577f7ef-83dd-48ed-815b-699b935c231b	direct grant	OpenID Connect Resource Owner Grant	04fb5b65-a9ea-4a2d-8f5e-0b7fad82a2da	basic-flow	t	t
d313bb47-b8b8-42ed-9b24-0c37b2486bf6	Direct Grant - Conditional OTP	Flow to determine if the OTP is required for the authentication	04fb5b65-a9ea-4a2d-8f5e-0b7fad82a2da	basic-flow	f	t
bbcfeb4f-e805-442e-82ae-202e873a93ac	registration	registration flow	04fb5b65-a9ea-4a2d-8f5e-0b7fad82a2da	basic-flow	t	t
ad5a1ca3-6f0a-436f-96d8-1cddbfecdeb5	registration form	registration form	04fb5b65-a9ea-4a2d-8f5e-0b7fad82a2da	form-flow	f	t
b869f12a-3997-4340-8057-08d824aef866	reset credentials	Reset credentials for a user if they forgot their password or something	04fb5b65-a9ea-4a2d-8f5e-0b7fad82a2da	basic-flow	t	t
09066e73-04ca-42d6-86bc-d40c305b9450	Reset - Conditional OTP	Flow to determine if the OTP should be reset or not. Set to REQUIRED to force.	04fb5b65-a9ea-4a2d-8f5e-0b7fad82a2da	basic-flow	f	t
706e42a6-f901-4eaa-b6c2-1dc038efd80b	clients	Base authentication for clients	04fb5b65-a9ea-4a2d-8f5e-0b7fad82a2da	client-flow	t	t
aff4ad99-ec58-4e7b-930a-eb8f27b364e7	first broker login	Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account	04fb5b65-a9ea-4a2d-8f5e-0b7fad82a2da	basic-flow	t	t
87977566-1955-44bc-b7e1-6d8287fdc3ee	User creation or linking	Flow for the existing/non-existing user alternatives	04fb5b65-a9ea-4a2d-8f5e-0b7fad82a2da	basic-flow	f	t
9d1fe656-5001-41f3-881f-f9e22bee8c22	Handle Existing Account	Handle what to do if there is existing account with same email/username like authenticated identity provider	04fb5b65-a9ea-4a2d-8f5e-0b7fad82a2da	basic-flow	f	t
28e859ce-396f-4a2f-adf4-4a5f23a4cc17	Account verification options	Method with which to verity the existing account	04fb5b65-a9ea-4a2d-8f5e-0b7fad82a2da	basic-flow	f	t
f26c968a-0588-47e7-ab64-f34e240b2be5	Verify Existing Account by Re-authentication	Reauthentication of existing account	04fb5b65-a9ea-4a2d-8f5e-0b7fad82a2da	basic-flow	f	t
68139b47-68d5-452b-858f-a67df05ecdc7	First broker login - Conditional OTP	Flow to determine if the OTP is required for the authentication	04fb5b65-a9ea-4a2d-8f5e-0b7fad82a2da	basic-flow	f	t
babd9293-a2ff-4e4e-8896-d51e980f64c3	saml ecp	SAML ECP Profile Authentication Flow	04fb5b65-a9ea-4a2d-8f5e-0b7fad82a2da	basic-flow	t	t
10b9d5cb-43e6-493a-b0a1-34f1e2bc1998	docker auth	Used by Docker clients to authenticate against the IDP	04fb5b65-a9ea-4a2d-8f5e-0b7fad82a2da	basic-flow	t	t
a9e64b61-0ab6-4b11-99b0-9acb80887443	http challenge	An authentication flow based on challenge-response HTTP Authentication Schemes	04fb5b65-a9ea-4a2d-8f5e-0b7fad82a2da	basic-flow	t	t
967e09c6-7750-4e45-8ddb-6aa208862e8b	Authentication Options	Authentication options.	04fb5b65-a9ea-4a2d-8f5e-0b7fad82a2da	basic-flow	f	t
99ca6a0c-b872-497e-a20e-585721e1a088	browser	browser based authentication	eaaeb62f-362b-40bb-b7f1-d927afd6a6e9	basic-flow	t	t
6590cc2b-334e-479f-b0e4-184130a126f1	forms	Username, password, otp and other auth forms.	eaaeb62f-362b-40bb-b7f1-d927afd6a6e9	basic-flow	f	t
e99eee12-70bd-48e7-98fa-9b3b493b3a2f	Browser - Conditional OTP	Flow to determine if the OTP is required for the authentication	eaaeb62f-362b-40bb-b7f1-d927afd6a6e9	basic-flow	f	t
64ede502-69e4-417a-83cb-6af916e6ab0c	direct grant	OpenID Connect Resource Owner Grant	eaaeb62f-362b-40bb-b7f1-d927afd6a6e9	basic-flow	t	t
6bf59b98-e56a-4c7f-a52a-b455483d86be	Direct Grant - Conditional OTP	Flow to determine if the OTP is required for the authentication	eaaeb62f-362b-40bb-b7f1-d927afd6a6e9	basic-flow	f	t
e03d2ae8-906d-44d1-8f8c-dbe6680728cf	registration	registration flow	eaaeb62f-362b-40bb-b7f1-d927afd6a6e9	basic-flow	t	t
17a53121-f9c5-4b0d-a83b-59d40d4a67fd	registration form	registration form	eaaeb62f-362b-40bb-b7f1-d927afd6a6e9	form-flow	f	t
059a3942-f75a-47e3-866e-3c59b3fe38c3	reset credentials	Reset credentials for a user if they forgot their password or something	eaaeb62f-362b-40bb-b7f1-d927afd6a6e9	basic-flow	t	t
5feba807-dcbf-4bad-84eb-24d818bfd1c4	Reset - Conditional OTP	Flow to determine if the OTP should be reset or not. Set to REQUIRED to force.	eaaeb62f-362b-40bb-b7f1-d927afd6a6e9	basic-flow	f	t
fae8dfd7-507f-452a-a8bf-a8475a1d66c0	clients	Base authentication for clients	eaaeb62f-362b-40bb-b7f1-d927afd6a6e9	client-flow	t	t
4224fefa-e080-4005-9a87-2cab72583746	first broker login	Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account	eaaeb62f-362b-40bb-b7f1-d927afd6a6e9	basic-flow	t	t
b0984569-0c6f-4e62-baa8-047869752aa7	User creation or linking	Flow for the existing/non-existing user alternatives	eaaeb62f-362b-40bb-b7f1-d927afd6a6e9	basic-flow	f	t
69b2e750-1c60-4f5c-8da3-e8a287f767a2	Handle Existing Account	Handle what to do if there is existing account with same email/username like authenticated identity provider	eaaeb62f-362b-40bb-b7f1-d927afd6a6e9	basic-flow	f	t
03eedb44-338e-491a-b017-2e94ec854254	Account verification options	Method with which to verity the existing account	eaaeb62f-362b-40bb-b7f1-d927afd6a6e9	basic-flow	f	t
c435d015-8ebd-44f8-82af-9e50696fc504	Verify Existing Account by Re-authentication	Reauthentication of existing account	eaaeb62f-362b-40bb-b7f1-d927afd6a6e9	basic-flow	f	t
4771b8fe-e059-49d7-99aa-089ff76ef9b3	First broker login - Conditional OTP	Flow to determine if the OTP is required for the authentication	eaaeb62f-362b-40bb-b7f1-d927afd6a6e9	basic-flow	f	t
c284a577-0c1a-4cd8-b2c8-86b71dc25b62	saml ecp	SAML ECP Profile Authentication Flow	eaaeb62f-362b-40bb-b7f1-d927afd6a6e9	basic-flow	t	t
8280e70f-386b-4bdb-b727-5c90846759ba	docker auth	Used by Docker clients to authenticate against the IDP	eaaeb62f-362b-40bb-b7f1-d927afd6a6e9	basic-flow	t	t
4e80800a-daf5-4415-996e-c7ec94a8a10f	http challenge	An authentication flow based on challenge-response HTTP Authentication Schemes	eaaeb62f-362b-40bb-b7f1-d927afd6a6e9	basic-flow	t	t
0832f0bb-b741-460d-9c6a-314e43cbef18	Authentication Options	Authentication options.	eaaeb62f-362b-40bb-b7f1-d927afd6a6e9	basic-flow	f	t
\.


--
-- Data for Name: authenticator_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.authenticator_config (id, alias, realm_id) FROM stdin;
2a518a16-0000-4e94-b8e6-76e27cc6dc0d	review profile config	04fb5b65-a9ea-4a2d-8f5e-0b7fad82a2da
fb12d1c1-0eac-43c3-9cc3-bfff8a6b1250	create unique user config	04fb5b65-a9ea-4a2d-8f5e-0b7fad82a2da
db6e42b8-af61-4138-a90a-1b368204ee7e	review profile config	eaaeb62f-362b-40bb-b7f1-d927afd6a6e9
ec7585ec-1374-4fc5-995b-403024859169	create unique user config	eaaeb62f-362b-40bb-b7f1-d927afd6a6e9
\.


--
-- Data for Name: authenticator_config_entry; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.authenticator_config_entry (authenticator_id, value, name) FROM stdin;
2a518a16-0000-4e94-b8e6-76e27cc6dc0d	missing	update.profile.on.first.login
fb12d1c1-0eac-43c3-9cc3-bfff8a6b1250	false	require.password.update.after.registration
db6e42b8-af61-4138-a90a-1b368204ee7e	missing	update.profile.on.first.login
ec7585ec-1374-4fc5-995b-403024859169	false	require.password.update.after.registration
\.


--
-- Data for Name: broker_link; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.broker_link (identity_provider, storage_provider_id, realm_id, broker_user_id, broker_username, token, user_id) FROM stdin;
\.


--
-- Data for Name: client; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client (id, enabled, full_scope_allowed, client_id, not_before, public_client, secret, base_url, bearer_only, management_url, surrogate_auth_required, realm_id, protocol, node_rereg_timeout, frontchannel_logout, consent_required, name, service_accounts_enabled, client_authenticator_type, root_url, description, registration_token, standard_flow_enabled, implicit_flow_enabled, direct_access_grants_enabled, always_display_in_console) FROM stdin;
83325b84-08c9-4828-b471-d93aaa781ce0	t	f	master-realm	0	f	\N	\N	t	\N	f	04fb5b65-a9ea-4a2d-8f5e-0b7fad82a2da	\N	0	f	f	master Realm	f	client-secret	\N	\N	\N	t	f	f	f
928ae892-62d7-4e34-bd4c-5f8f3f9a8994	t	f	account	0	t	\N	/realms/master/account/	f	\N	f	04fb5b65-a9ea-4a2d-8f5e-0b7fad82a2da	openid-connect	0	f	f	${client_account}	f	client-secret	${authBaseUrl}	\N	\N	t	f	f	f
f740cab7-40a8-4ae7-8347-36f262b2336a	t	f	account-console	0	t	\N	/realms/master/account/	f	\N	f	04fb5b65-a9ea-4a2d-8f5e-0b7fad82a2da	openid-connect	0	f	f	${client_account-console}	f	client-secret	${authBaseUrl}	\N	\N	t	f	f	f
2e85f692-8d9e-4cbb-b2b5-f6df657b292f	t	f	broker	0	f	\N	\N	t	\N	f	04fb5b65-a9ea-4a2d-8f5e-0b7fad82a2da	openid-connect	0	f	f	${client_broker}	f	client-secret	\N	\N	\N	t	f	f	f
6af6154c-9581-4825-ae34-fe235c49a845	t	f	security-admin-console	0	t	\N	/admin/master/console/	f	\N	f	04fb5b65-a9ea-4a2d-8f5e-0b7fad82a2da	openid-connect	0	f	f	${client_security-admin-console}	f	client-secret	${authAdminUrl}	\N	\N	t	f	f	f
c29e055b-142f-4d40-a1f4-1d8807cf1b45	t	f	hmmyzon-realm	0	f	\N	\N	t	\N	f	04fb5b65-a9ea-4a2d-8f5e-0b7fad82a2da	\N	0	f	f	hmmyzon Realm	f	client-secret	\N	\N	\N	t	f	f	f
d50b8e95-48d7-42ac-8d8b-14b1d7c1aaa9	t	f	realm-management	0	f	\N	\N	t	\N	f	eaaeb62f-362b-40bb-b7f1-d927afd6a6e9	openid-connect	0	f	f	${client_realm-management}	f	client-secret	\N	\N	\N	t	f	f	f
9fd40948-70b2-47ea-98c4-f94d80a06ddb	t	f	account	0	t	\N	/realms/hmmyzon/account/	f	\N	f	eaaeb62f-362b-40bb-b7f1-d927afd6a6e9	openid-connect	0	f	f	${client_account}	f	client-secret	${authBaseUrl}	\N	\N	t	f	f	f
9e4684e7-1f36-4bbf-a0d1-f9c156a8a2e2	t	f	account-console	0	t	\N	/realms/hmmyzon/account/	f	\N	f	eaaeb62f-362b-40bb-b7f1-d927afd6a6e9	openid-connect	0	f	f	${client_account-console}	f	client-secret	${authBaseUrl}	\N	\N	t	f	f	f
1b3a4ed9-ab56-4592-9cce-4f70bbbe848e	t	f	broker	0	f	\N	\N	t	\N	f	eaaeb62f-362b-40bb-b7f1-d927afd6a6e9	openid-connect	0	f	f	${client_broker}	f	client-secret	\N	\N	\N	t	f	f	f
327efb3f-a5b2-4cf8-9b6d-95ac614dfab1	t	f	security-admin-console	0	t	\N	/admin/hmmyzon/console/	f	\N	f	eaaeb62f-362b-40bb-b7f1-d927afd6a6e9	openid-connect	0	f	f	${client_security-admin-console}	f	client-secret	${authAdminUrl}	\N	\N	t	f	f	f
9c487d53-c03c-4fcf-838f-f0c92e6543f6	t	f	admin-cli	0	t	\N	\N	f	\N	f	eaaeb62f-362b-40bb-b7f1-d927afd6a6e9	openid-connect	0	f	f	${client_admin-cli}	f	client-secret	\N	\N	\N	f	f	t	f
51435200-25cc-473c-8d97-03217017a185	t	t	client-front	0	f	BlJJqPSwExWV36yUFxjNoRkiW95JnlRg		f		f	eaaeb62f-362b-40bb-b7f1-d927afd6a6e9	openid-connect	-1	t	f		f	client-secret			\N	t	f	t	f
d18341ec-c15a-47f7-bc4e-58023ff7acb8	t	f	admin-cli	0	f	yAE56YCPNKU2YWmE0MpnCr616Hb0ukee		f		f	04fb5b65-a9ea-4a2d-8f5e-0b7fad82a2da	openid-connect	0	f	f	${client_admin-cli}	t	client-secret			\N	f	f	t	f
\.


--
-- Data for Name: client_attributes; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_attributes (client_id, value, name) FROM stdin;
928ae892-62d7-4e34-bd4c-5f8f3f9a8994	+	post.logout.redirect.uris
f740cab7-40a8-4ae7-8347-36f262b2336a	+	post.logout.redirect.uris
f740cab7-40a8-4ae7-8347-36f262b2336a	S256	pkce.code.challenge.method
6af6154c-9581-4825-ae34-fe235c49a845	+	post.logout.redirect.uris
6af6154c-9581-4825-ae34-fe235c49a845	S256	pkce.code.challenge.method
9fd40948-70b2-47ea-98c4-f94d80a06ddb	+	post.logout.redirect.uris
9e4684e7-1f36-4bbf-a0d1-f9c156a8a2e2	+	post.logout.redirect.uris
9e4684e7-1f36-4bbf-a0d1-f9c156a8a2e2	S256	pkce.code.challenge.method
327efb3f-a5b2-4cf8-9b6d-95ac614dfab1	+	post.logout.redirect.uris
327efb3f-a5b2-4cf8-9b6d-95ac614dfab1	S256	pkce.code.challenge.method
51435200-25cc-473c-8d97-03217017a185	false	oauth2.device.authorization.grant.enabled
51435200-25cc-473c-8d97-03217017a185	false	oidc.ciba.grant.enabled
51435200-25cc-473c-8d97-03217017a185	true	backchannel.logout.session.required
51435200-25cc-473c-8d97-03217017a185	false	backchannel.logout.revoke.offline.tokens
51435200-25cc-473c-8d97-03217017a185	{}	acr.loa.map
51435200-25cc-473c-8d97-03217017a185	false	display.on.consent.screen
51435200-25cc-473c-8d97-03217017a185	true	use.refresh.tokens
51435200-25cc-473c-8d97-03217017a185	false	client_credentials.use_refresh_token
51435200-25cc-473c-8d97-03217017a185	false	token.response.type.bearer.lower-case
51435200-25cc-473c-8d97-03217017a185	false	tls-client-certificate-bound-access-tokens
51435200-25cc-473c-8d97-03217017a185	false	require.pushed.authorization.requests
51435200-25cc-473c-8d97-03217017a185	1703290907	client.secret.creation.time
d18341ec-c15a-47f7-bc4e-58023ff7acb8	false	oauth2.device.authorization.grant.enabled
d18341ec-c15a-47f7-bc4e-58023ff7acb8	false	oidc.ciba.grant.enabled
d18341ec-c15a-47f7-bc4e-58023ff7acb8	false	display.on.consent.screen
d18341ec-c15a-47f7-bc4e-58023ff7acb8	true	backchannel.logout.session.required
d18341ec-c15a-47f7-bc4e-58023ff7acb8	false	backchannel.logout.revoke.offline.tokens
d18341ec-c15a-47f7-bc4e-58023ff7acb8	1703291363	client.secret.creation.time
\.


--
-- Data for Name: client_auth_flow_bindings; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_auth_flow_bindings (client_id, flow_id, binding_name) FROM stdin;
\.


--
-- Data for Name: client_initial_access; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_initial_access (id, realm_id, "timestamp", expiration, count, remaining_count) FROM stdin;
\.


--
-- Data for Name: client_node_registrations; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_node_registrations (client_id, value, name) FROM stdin;
\.


--
-- Data for Name: client_scope; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_scope (id, name, realm_id, description, protocol) FROM stdin;
62cf695d-38a7-443d-9f5c-35f651cb379e	offline_access	04fb5b65-a9ea-4a2d-8f5e-0b7fad82a2da	OpenID Connect built-in scope: offline_access	openid-connect
54a48c9c-fad0-48fc-8083-72aa4ca8f338	role_list	04fb5b65-a9ea-4a2d-8f5e-0b7fad82a2da	SAML role list	saml
464bffc3-b3fa-4493-bf68-99378bee7460	profile	04fb5b65-a9ea-4a2d-8f5e-0b7fad82a2da	OpenID Connect built-in scope: profile	openid-connect
d3eda79f-2105-4fb6-9778-ce734e615834	email	04fb5b65-a9ea-4a2d-8f5e-0b7fad82a2da	OpenID Connect built-in scope: email	openid-connect
d72156b9-9a80-41a2-9068-2c189f9c1bf7	address	04fb5b65-a9ea-4a2d-8f5e-0b7fad82a2da	OpenID Connect built-in scope: address	openid-connect
e87eceff-e962-4875-93b7-55ef4cc30032	phone	04fb5b65-a9ea-4a2d-8f5e-0b7fad82a2da	OpenID Connect built-in scope: phone	openid-connect
339b2f1b-055e-40ee-ab1e-34afd3809e15	roles	04fb5b65-a9ea-4a2d-8f5e-0b7fad82a2da	OpenID Connect scope for add user roles to the access token	openid-connect
34e0657e-0fbd-47ae-8ec2-4aacf8b1dc09	web-origins	04fb5b65-a9ea-4a2d-8f5e-0b7fad82a2da	OpenID Connect scope for add allowed web origins to the access token	openid-connect
b90377ac-b066-416c-8051-022d1a66217c	microprofile-jwt	04fb5b65-a9ea-4a2d-8f5e-0b7fad82a2da	Microprofile - JWT built-in scope	openid-connect
584da0a3-66aa-4baa-ba3c-d7633d7c1160	acr	04fb5b65-a9ea-4a2d-8f5e-0b7fad82a2da	OpenID Connect scope for add acr (authentication context class reference) to the token	openid-connect
97c9a8cc-9249-45af-baa3-179bf8dbe06a	offline_access	eaaeb62f-362b-40bb-b7f1-d927afd6a6e9	OpenID Connect built-in scope: offline_access	openid-connect
9db53642-e6f8-4e75-bc1d-dc1c863eaa98	role_list	eaaeb62f-362b-40bb-b7f1-d927afd6a6e9	SAML role list	saml
8ec7285c-58e2-42d6-90ce-68ffb6f871c5	profile	eaaeb62f-362b-40bb-b7f1-d927afd6a6e9	OpenID Connect built-in scope: profile	openid-connect
5f1dc33b-5e36-4f1e-a826-c8197297b919	email	eaaeb62f-362b-40bb-b7f1-d927afd6a6e9	OpenID Connect built-in scope: email	openid-connect
569500f8-3113-42af-9b3b-165b1b8f188f	address	eaaeb62f-362b-40bb-b7f1-d927afd6a6e9	OpenID Connect built-in scope: address	openid-connect
9db26fec-feea-4d24-a802-799be662a562	phone	eaaeb62f-362b-40bb-b7f1-d927afd6a6e9	OpenID Connect built-in scope: phone	openid-connect
29c47719-3609-4ee9-a7d5-c358459fd40e	roles	eaaeb62f-362b-40bb-b7f1-d927afd6a6e9	OpenID Connect scope for add user roles to the access token	openid-connect
d5fdbad2-73ad-417b-ae66-e65b5d6f2239	web-origins	eaaeb62f-362b-40bb-b7f1-d927afd6a6e9	OpenID Connect scope for add allowed web origins to the access token	openid-connect
9bac8767-31e1-41db-97d4-72dbcd4bfbb5	microprofile-jwt	eaaeb62f-362b-40bb-b7f1-d927afd6a6e9	Microprofile - JWT built-in scope	openid-connect
3defc30c-ec86-4800-a53a-3a27f84508e5	acr	eaaeb62f-362b-40bb-b7f1-d927afd6a6e9	OpenID Connect scope for add acr (authentication context class reference) to the token	openid-connect
\.


--
-- Data for Name: client_scope_attributes; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_scope_attributes (scope_id, value, name) FROM stdin;
62cf695d-38a7-443d-9f5c-35f651cb379e	true	display.on.consent.screen
62cf695d-38a7-443d-9f5c-35f651cb379e	${offlineAccessScopeConsentText}	consent.screen.text
54a48c9c-fad0-48fc-8083-72aa4ca8f338	true	display.on.consent.screen
54a48c9c-fad0-48fc-8083-72aa4ca8f338	${samlRoleListScopeConsentText}	consent.screen.text
464bffc3-b3fa-4493-bf68-99378bee7460	true	display.on.consent.screen
464bffc3-b3fa-4493-bf68-99378bee7460	${profileScopeConsentText}	consent.screen.text
464bffc3-b3fa-4493-bf68-99378bee7460	true	include.in.token.scope
d3eda79f-2105-4fb6-9778-ce734e615834	true	display.on.consent.screen
d3eda79f-2105-4fb6-9778-ce734e615834	${emailScopeConsentText}	consent.screen.text
d3eda79f-2105-4fb6-9778-ce734e615834	true	include.in.token.scope
d72156b9-9a80-41a2-9068-2c189f9c1bf7	true	display.on.consent.screen
d72156b9-9a80-41a2-9068-2c189f9c1bf7	${addressScopeConsentText}	consent.screen.text
d72156b9-9a80-41a2-9068-2c189f9c1bf7	true	include.in.token.scope
e87eceff-e962-4875-93b7-55ef4cc30032	true	display.on.consent.screen
e87eceff-e962-4875-93b7-55ef4cc30032	${phoneScopeConsentText}	consent.screen.text
e87eceff-e962-4875-93b7-55ef4cc30032	true	include.in.token.scope
339b2f1b-055e-40ee-ab1e-34afd3809e15	true	display.on.consent.screen
339b2f1b-055e-40ee-ab1e-34afd3809e15	${rolesScopeConsentText}	consent.screen.text
339b2f1b-055e-40ee-ab1e-34afd3809e15	false	include.in.token.scope
34e0657e-0fbd-47ae-8ec2-4aacf8b1dc09	false	display.on.consent.screen
34e0657e-0fbd-47ae-8ec2-4aacf8b1dc09		consent.screen.text
34e0657e-0fbd-47ae-8ec2-4aacf8b1dc09	false	include.in.token.scope
b90377ac-b066-416c-8051-022d1a66217c	false	display.on.consent.screen
b90377ac-b066-416c-8051-022d1a66217c	true	include.in.token.scope
584da0a3-66aa-4baa-ba3c-d7633d7c1160	false	display.on.consent.screen
584da0a3-66aa-4baa-ba3c-d7633d7c1160	false	include.in.token.scope
97c9a8cc-9249-45af-baa3-179bf8dbe06a	true	display.on.consent.screen
97c9a8cc-9249-45af-baa3-179bf8dbe06a	${offlineAccessScopeConsentText}	consent.screen.text
9db53642-e6f8-4e75-bc1d-dc1c863eaa98	true	display.on.consent.screen
9db53642-e6f8-4e75-bc1d-dc1c863eaa98	${samlRoleListScopeConsentText}	consent.screen.text
8ec7285c-58e2-42d6-90ce-68ffb6f871c5	true	display.on.consent.screen
8ec7285c-58e2-42d6-90ce-68ffb6f871c5	${profileScopeConsentText}	consent.screen.text
8ec7285c-58e2-42d6-90ce-68ffb6f871c5	true	include.in.token.scope
5f1dc33b-5e36-4f1e-a826-c8197297b919	true	display.on.consent.screen
5f1dc33b-5e36-4f1e-a826-c8197297b919	${emailScopeConsentText}	consent.screen.text
5f1dc33b-5e36-4f1e-a826-c8197297b919	true	include.in.token.scope
569500f8-3113-42af-9b3b-165b1b8f188f	true	display.on.consent.screen
569500f8-3113-42af-9b3b-165b1b8f188f	${addressScopeConsentText}	consent.screen.text
569500f8-3113-42af-9b3b-165b1b8f188f	true	include.in.token.scope
9db26fec-feea-4d24-a802-799be662a562	true	display.on.consent.screen
9db26fec-feea-4d24-a802-799be662a562	${phoneScopeConsentText}	consent.screen.text
9db26fec-feea-4d24-a802-799be662a562	true	include.in.token.scope
29c47719-3609-4ee9-a7d5-c358459fd40e	true	display.on.consent.screen
29c47719-3609-4ee9-a7d5-c358459fd40e	${rolesScopeConsentText}	consent.screen.text
29c47719-3609-4ee9-a7d5-c358459fd40e	false	include.in.token.scope
d5fdbad2-73ad-417b-ae66-e65b5d6f2239	false	display.on.consent.screen
d5fdbad2-73ad-417b-ae66-e65b5d6f2239		consent.screen.text
d5fdbad2-73ad-417b-ae66-e65b5d6f2239	false	include.in.token.scope
9bac8767-31e1-41db-97d4-72dbcd4bfbb5	false	display.on.consent.screen
9bac8767-31e1-41db-97d4-72dbcd4bfbb5	true	include.in.token.scope
3defc30c-ec86-4800-a53a-3a27f84508e5	false	display.on.consent.screen
3defc30c-ec86-4800-a53a-3a27f84508e5	false	include.in.token.scope
\.


--
-- Data for Name: client_scope_client; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_scope_client (client_id, scope_id, default_scope) FROM stdin;
928ae892-62d7-4e34-bd4c-5f8f3f9a8994	464bffc3-b3fa-4493-bf68-99378bee7460	t
928ae892-62d7-4e34-bd4c-5f8f3f9a8994	584da0a3-66aa-4baa-ba3c-d7633d7c1160	t
928ae892-62d7-4e34-bd4c-5f8f3f9a8994	d3eda79f-2105-4fb6-9778-ce734e615834	t
928ae892-62d7-4e34-bd4c-5f8f3f9a8994	339b2f1b-055e-40ee-ab1e-34afd3809e15	t
928ae892-62d7-4e34-bd4c-5f8f3f9a8994	34e0657e-0fbd-47ae-8ec2-4aacf8b1dc09	t
928ae892-62d7-4e34-bd4c-5f8f3f9a8994	e87eceff-e962-4875-93b7-55ef4cc30032	f
928ae892-62d7-4e34-bd4c-5f8f3f9a8994	62cf695d-38a7-443d-9f5c-35f651cb379e	f
928ae892-62d7-4e34-bd4c-5f8f3f9a8994	d72156b9-9a80-41a2-9068-2c189f9c1bf7	f
928ae892-62d7-4e34-bd4c-5f8f3f9a8994	b90377ac-b066-416c-8051-022d1a66217c	f
f740cab7-40a8-4ae7-8347-36f262b2336a	464bffc3-b3fa-4493-bf68-99378bee7460	t
f740cab7-40a8-4ae7-8347-36f262b2336a	584da0a3-66aa-4baa-ba3c-d7633d7c1160	t
f740cab7-40a8-4ae7-8347-36f262b2336a	d3eda79f-2105-4fb6-9778-ce734e615834	t
f740cab7-40a8-4ae7-8347-36f262b2336a	339b2f1b-055e-40ee-ab1e-34afd3809e15	t
f740cab7-40a8-4ae7-8347-36f262b2336a	34e0657e-0fbd-47ae-8ec2-4aacf8b1dc09	t
f740cab7-40a8-4ae7-8347-36f262b2336a	e87eceff-e962-4875-93b7-55ef4cc30032	f
f740cab7-40a8-4ae7-8347-36f262b2336a	62cf695d-38a7-443d-9f5c-35f651cb379e	f
f740cab7-40a8-4ae7-8347-36f262b2336a	d72156b9-9a80-41a2-9068-2c189f9c1bf7	f
f740cab7-40a8-4ae7-8347-36f262b2336a	b90377ac-b066-416c-8051-022d1a66217c	f
d18341ec-c15a-47f7-bc4e-58023ff7acb8	464bffc3-b3fa-4493-bf68-99378bee7460	t
d18341ec-c15a-47f7-bc4e-58023ff7acb8	584da0a3-66aa-4baa-ba3c-d7633d7c1160	t
d18341ec-c15a-47f7-bc4e-58023ff7acb8	d3eda79f-2105-4fb6-9778-ce734e615834	t
d18341ec-c15a-47f7-bc4e-58023ff7acb8	339b2f1b-055e-40ee-ab1e-34afd3809e15	t
d18341ec-c15a-47f7-bc4e-58023ff7acb8	34e0657e-0fbd-47ae-8ec2-4aacf8b1dc09	t
d18341ec-c15a-47f7-bc4e-58023ff7acb8	e87eceff-e962-4875-93b7-55ef4cc30032	f
d18341ec-c15a-47f7-bc4e-58023ff7acb8	62cf695d-38a7-443d-9f5c-35f651cb379e	f
d18341ec-c15a-47f7-bc4e-58023ff7acb8	d72156b9-9a80-41a2-9068-2c189f9c1bf7	f
d18341ec-c15a-47f7-bc4e-58023ff7acb8	b90377ac-b066-416c-8051-022d1a66217c	f
2e85f692-8d9e-4cbb-b2b5-f6df657b292f	464bffc3-b3fa-4493-bf68-99378bee7460	t
2e85f692-8d9e-4cbb-b2b5-f6df657b292f	584da0a3-66aa-4baa-ba3c-d7633d7c1160	t
2e85f692-8d9e-4cbb-b2b5-f6df657b292f	d3eda79f-2105-4fb6-9778-ce734e615834	t
2e85f692-8d9e-4cbb-b2b5-f6df657b292f	339b2f1b-055e-40ee-ab1e-34afd3809e15	t
2e85f692-8d9e-4cbb-b2b5-f6df657b292f	34e0657e-0fbd-47ae-8ec2-4aacf8b1dc09	t
2e85f692-8d9e-4cbb-b2b5-f6df657b292f	e87eceff-e962-4875-93b7-55ef4cc30032	f
2e85f692-8d9e-4cbb-b2b5-f6df657b292f	62cf695d-38a7-443d-9f5c-35f651cb379e	f
2e85f692-8d9e-4cbb-b2b5-f6df657b292f	d72156b9-9a80-41a2-9068-2c189f9c1bf7	f
2e85f692-8d9e-4cbb-b2b5-f6df657b292f	b90377ac-b066-416c-8051-022d1a66217c	f
83325b84-08c9-4828-b471-d93aaa781ce0	464bffc3-b3fa-4493-bf68-99378bee7460	t
83325b84-08c9-4828-b471-d93aaa781ce0	584da0a3-66aa-4baa-ba3c-d7633d7c1160	t
83325b84-08c9-4828-b471-d93aaa781ce0	d3eda79f-2105-4fb6-9778-ce734e615834	t
83325b84-08c9-4828-b471-d93aaa781ce0	339b2f1b-055e-40ee-ab1e-34afd3809e15	t
83325b84-08c9-4828-b471-d93aaa781ce0	34e0657e-0fbd-47ae-8ec2-4aacf8b1dc09	t
83325b84-08c9-4828-b471-d93aaa781ce0	e87eceff-e962-4875-93b7-55ef4cc30032	f
83325b84-08c9-4828-b471-d93aaa781ce0	62cf695d-38a7-443d-9f5c-35f651cb379e	f
83325b84-08c9-4828-b471-d93aaa781ce0	d72156b9-9a80-41a2-9068-2c189f9c1bf7	f
83325b84-08c9-4828-b471-d93aaa781ce0	b90377ac-b066-416c-8051-022d1a66217c	f
6af6154c-9581-4825-ae34-fe235c49a845	464bffc3-b3fa-4493-bf68-99378bee7460	t
6af6154c-9581-4825-ae34-fe235c49a845	584da0a3-66aa-4baa-ba3c-d7633d7c1160	t
6af6154c-9581-4825-ae34-fe235c49a845	d3eda79f-2105-4fb6-9778-ce734e615834	t
6af6154c-9581-4825-ae34-fe235c49a845	339b2f1b-055e-40ee-ab1e-34afd3809e15	t
6af6154c-9581-4825-ae34-fe235c49a845	34e0657e-0fbd-47ae-8ec2-4aacf8b1dc09	t
6af6154c-9581-4825-ae34-fe235c49a845	e87eceff-e962-4875-93b7-55ef4cc30032	f
6af6154c-9581-4825-ae34-fe235c49a845	62cf695d-38a7-443d-9f5c-35f651cb379e	f
6af6154c-9581-4825-ae34-fe235c49a845	d72156b9-9a80-41a2-9068-2c189f9c1bf7	f
6af6154c-9581-4825-ae34-fe235c49a845	b90377ac-b066-416c-8051-022d1a66217c	f
9fd40948-70b2-47ea-98c4-f94d80a06ddb	29c47719-3609-4ee9-a7d5-c358459fd40e	t
9fd40948-70b2-47ea-98c4-f94d80a06ddb	3defc30c-ec86-4800-a53a-3a27f84508e5	t
9fd40948-70b2-47ea-98c4-f94d80a06ddb	8ec7285c-58e2-42d6-90ce-68ffb6f871c5	t
9fd40948-70b2-47ea-98c4-f94d80a06ddb	5f1dc33b-5e36-4f1e-a826-c8197297b919	t
9fd40948-70b2-47ea-98c4-f94d80a06ddb	d5fdbad2-73ad-417b-ae66-e65b5d6f2239	t
9fd40948-70b2-47ea-98c4-f94d80a06ddb	97c9a8cc-9249-45af-baa3-179bf8dbe06a	f
9fd40948-70b2-47ea-98c4-f94d80a06ddb	9db26fec-feea-4d24-a802-799be662a562	f
9fd40948-70b2-47ea-98c4-f94d80a06ddb	9bac8767-31e1-41db-97d4-72dbcd4bfbb5	f
9fd40948-70b2-47ea-98c4-f94d80a06ddb	569500f8-3113-42af-9b3b-165b1b8f188f	f
9e4684e7-1f36-4bbf-a0d1-f9c156a8a2e2	29c47719-3609-4ee9-a7d5-c358459fd40e	t
9e4684e7-1f36-4bbf-a0d1-f9c156a8a2e2	3defc30c-ec86-4800-a53a-3a27f84508e5	t
9e4684e7-1f36-4bbf-a0d1-f9c156a8a2e2	8ec7285c-58e2-42d6-90ce-68ffb6f871c5	t
9e4684e7-1f36-4bbf-a0d1-f9c156a8a2e2	5f1dc33b-5e36-4f1e-a826-c8197297b919	t
9e4684e7-1f36-4bbf-a0d1-f9c156a8a2e2	d5fdbad2-73ad-417b-ae66-e65b5d6f2239	t
9e4684e7-1f36-4bbf-a0d1-f9c156a8a2e2	97c9a8cc-9249-45af-baa3-179bf8dbe06a	f
9e4684e7-1f36-4bbf-a0d1-f9c156a8a2e2	9db26fec-feea-4d24-a802-799be662a562	f
9e4684e7-1f36-4bbf-a0d1-f9c156a8a2e2	9bac8767-31e1-41db-97d4-72dbcd4bfbb5	f
9e4684e7-1f36-4bbf-a0d1-f9c156a8a2e2	569500f8-3113-42af-9b3b-165b1b8f188f	f
9c487d53-c03c-4fcf-838f-f0c92e6543f6	29c47719-3609-4ee9-a7d5-c358459fd40e	t
9c487d53-c03c-4fcf-838f-f0c92e6543f6	3defc30c-ec86-4800-a53a-3a27f84508e5	t
9c487d53-c03c-4fcf-838f-f0c92e6543f6	8ec7285c-58e2-42d6-90ce-68ffb6f871c5	t
9c487d53-c03c-4fcf-838f-f0c92e6543f6	5f1dc33b-5e36-4f1e-a826-c8197297b919	t
9c487d53-c03c-4fcf-838f-f0c92e6543f6	d5fdbad2-73ad-417b-ae66-e65b5d6f2239	t
9c487d53-c03c-4fcf-838f-f0c92e6543f6	97c9a8cc-9249-45af-baa3-179bf8dbe06a	f
9c487d53-c03c-4fcf-838f-f0c92e6543f6	9db26fec-feea-4d24-a802-799be662a562	f
9c487d53-c03c-4fcf-838f-f0c92e6543f6	9bac8767-31e1-41db-97d4-72dbcd4bfbb5	f
9c487d53-c03c-4fcf-838f-f0c92e6543f6	569500f8-3113-42af-9b3b-165b1b8f188f	f
1b3a4ed9-ab56-4592-9cce-4f70bbbe848e	29c47719-3609-4ee9-a7d5-c358459fd40e	t
1b3a4ed9-ab56-4592-9cce-4f70bbbe848e	3defc30c-ec86-4800-a53a-3a27f84508e5	t
1b3a4ed9-ab56-4592-9cce-4f70bbbe848e	8ec7285c-58e2-42d6-90ce-68ffb6f871c5	t
1b3a4ed9-ab56-4592-9cce-4f70bbbe848e	5f1dc33b-5e36-4f1e-a826-c8197297b919	t
1b3a4ed9-ab56-4592-9cce-4f70bbbe848e	d5fdbad2-73ad-417b-ae66-e65b5d6f2239	t
1b3a4ed9-ab56-4592-9cce-4f70bbbe848e	97c9a8cc-9249-45af-baa3-179bf8dbe06a	f
1b3a4ed9-ab56-4592-9cce-4f70bbbe848e	9db26fec-feea-4d24-a802-799be662a562	f
1b3a4ed9-ab56-4592-9cce-4f70bbbe848e	9bac8767-31e1-41db-97d4-72dbcd4bfbb5	f
1b3a4ed9-ab56-4592-9cce-4f70bbbe848e	569500f8-3113-42af-9b3b-165b1b8f188f	f
d50b8e95-48d7-42ac-8d8b-14b1d7c1aaa9	29c47719-3609-4ee9-a7d5-c358459fd40e	t
d50b8e95-48d7-42ac-8d8b-14b1d7c1aaa9	3defc30c-ec86-4800-a53a-3a27f84508e5	t
d50b8e95-48d7-42ac-8d8b-14b1d7c1aaa9	8ec7285c-58e2-42d6-90ce-68ffb6f871c5	t
d50b8e95-48d7-42ac-8d8b-14b1d7c1aaa9	5f1dc33b-5e36-4f1e-a826-c8197297b919	t
d50b8e95-48d7-42ac-8d8b-14b1d7c1aaa9	d5fdbad2-73ad-417b-ae66-e65b5d6f2239	t
d50b8e95-48d7-42ac-8d8b-14b1d7c1aaa9	97c9a8cc-9249-45af-baa3-179bf8dbe06a	f
d50b8e95-48d7-42ac-8d8b-14b1d7c1aaa9	9db26fec-feea-4d24-a802-799be662a562	f
d50b8e95-48d7-42ac-8d8b-14b1d7c1aaa9	9bac8767-31e1-41db-97d4-72dbcd4bfbb5	f
d50b8e95-48d7-42ac-8d8b-14b1d7c1aaa9	569500f8-3113-42af-9b3b-165b1b8f188f	f
327efb3f-a5b2-4cf8-9b6d-95ac614dfab1	29c47719-3609-4ee9-a7d5-c358459fd40e	t
327efb3f-a5b2-4cf8-9b6d-95ac614dfab1	3defc30c-ec86-4800-a53a-3a27f84508e5	t
327efb3f-a5b2-4cf8-9b6d-95ac614dfab1	8ec7285c-58e2-42d6-90ce-68ffb6f871c5	t
327efb3f-a5b2-4cf8-9b6d-95ac614dfab1	5f1dc33b-5e36-4f1e-a826-c8197297b919	t
327efb3f-a5b2-4cf8-9b6d-95ac614dfab1	d5fdbad2-73ad-417b-ae66-e65b5d6f2239	t
327efb3f-a5b2-4cf8-9b6d-95ac614dfab1	97c9a8cc-9249-45af-baa3-179bf8dbe06a	f
327efb3f-a5b2-4cf8-9b6d-95ac614dfab1	9db26fec-feea-4d24-a802-799be662a562	f
327efb3f-a5b2-4cf8-9b6d-95ac614dfab1	9bac8767-31e1-41db-97d4-72dbcd4bfbb5	f
327efb3f-a5b2-4cf8-9b6d-95ac614dfab1	569500f8-3113-42af-9b3b-165b1b8f188f	f
51435200-25cc-473c-8d97-03217017a185	29c47719-3609-4ee9-a7d5-c358459fd40e	t
51435200-25cc-473c-8d97-03217017a185	3defc30c-ec86-4800-a53a-3a27f84508e5	t
51435200-25cc-473c-8d97-03217017a185	8ec7285c-58e2-42d6-90ce-68ffb6f871c5	t
51435200-25cc-473c-8d97-03217017a185	5f1dc33b-5e36-4f1e-a826-c8197297b919	t
51435200-25cc-473c-8d97-03217017a185	d5fdbad2-73ad-417b-ae66-e65b5d6f2239	t
51435200-25cc-473c-8d97-03217017a185	97c9a8cc-9249-45af-baa3-179bf8dbe06a	f
51435200-25cc-473c-8d97-03217017a185	9db26fec-feea-4d24-a802-799be662a562	f
51435200-25cc-473c-8d97-03217017a185	9bac8767-31e1-41db-97d4-72dbcd4bfbb5	f
51435200-25cc-473c-8d97-03217017a185	569500f8-3113-42af-9b3b-165b1b8f188f	f
\.


--
-- Data for Name: client_scope_role_mapping; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_scope_role_mapping (scope_id, role_id) FROM stdin;
62cf695d-38a7-443d-9f5c-35f651cb379e	0282cdc5-1f82-4b83-9e2a-dd3655b20b07
97c9a8cc-9249-45af-baa3-179bf8dbe06a	78a51bf4-b969-4b05-b339-bc9cce0d0022
\.


--
-- Data for Name: client_session; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_session (id, client_id, redirect_uri, state, "timestamp", session_id, auth_method, realm_id, auth_user_id, current_action) FROM stdin;
\.


--
-- Data for Name: client_session_auth_status; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_session_auth_status (authenticator, status, client_session) FROM stdin;
\.


--
-- Data for Name: client_session_note; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_session_note (name, value, client_session) FROM stdin;
\.


--
-- Data for Name: client_session_prot_mapper; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_session_prot_mapper (protocol_mapper_id, client_session) FROM stdin;
\.


--
-- Data for Name: client_session_role; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_session_role (role_id, client_session) FROM stdin;
\.


--
-- Data for Name: client_user_session_note; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_user_session_note (name, value, client_session) FROM stdin;
\.


--
-- Data for Name: component; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.component (id, name, parent_id, provider_id, provider_type, realm_id, sub_type) FROM stdin;
ecab045a-52fa-4a99-abd9-ce9a469df352	Trusted Hosts	04fb5b65-a9ea-4a2d-8f5e-0b7fad82a2da	trusted-hosts	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	04fb5b65-a9ea-4a2d-8f5e-0b7fad82a2da	anonymous
e66d1420-d004-4297-874f-6f70080f52e0	Consent Required	04fb5b65-a9ea-4a2d-8f5e-0b7fad82a2da	consent-required	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	04fb5b65-a9ea-4a2d-8f5e-0b7fad82a2da	anonymous
c591ab2a-3f32-422f-9cba-2a11d5d5991f	Full Scope Disabled	04fb5b65-a9ea-4a2d-8f5e-0b7fad82a2da	scope	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	04fb5b65-a9ea-4a2d-8f5e-0b7fad82a2da	anonymous
32df4514-6a95-4905-b06e-55d5399a8138	Max Clients Limit	04fb5b65-a9ea-4a2d-8f5e-0b7fad82a2da	max-clients	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	04fb5b65-a9ea-4a2d-8f5e-0b7fad82a2da	anonymous
0b3243b9-0e15-40bc-8e16-b66ad8080742	Allowed Protocol Mapper Types	04fb5b65-a9ea-4a2d-8f5e-0b7fad82a2da	allowed-protocol-mappers	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	04fb5b65-a9ea-4a2d-8f5e-0b7fad82a2da	anonymous
c0330947-025c-4218-a7fa-a82644c6af13	Allowed Client Scopes	04fb5b65-a9ea-4a2d-8f5e-0b7fad82a2da	allowed-client-templates	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	04fb5b65-a9ea-4a2d-8f5e-0b7fad82a2da	anonymous
40abe5ed-6214-4180-b539-c3f732612b11	Allowed Protocol Mapper Types	04fb5b65-a9ea-4a2d-8f5e-0b7fad82a2da	allowed-protocol-mappers	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	04fb5b65-a9ea-4a2d-8f5e-0b7fad82a2da	authenticated
dd85d80c-6858-438f-a80d-2856a9ee98bc	Allowed Client Scopes	04fb5b65-a9ea-4a2d-8f5e-0b7fad82a2da	allowed-client-templates	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	04fb5b65-a9ea-4a2d-8f5e-0b7fad82a2da	authenticated
20e7c1c8-6338-42e9-9519-2c2470fb8a05	rsa-generated	04fb5b65-a9ea-4a2d-8f5e-0b7fad82a2da	rsa-generated	org.keycloak.keys.KeyProvider	04fb5b65-a9ea-4a2d-8f5e-0b7fad82a2da	\N
fe8a0977-0cb4-440e-84c4-265367107028	rsa-enc-generated	04fb5b65-a9ea-4a2d-8f5e-0b7fad82a2da	rsa-enc-generated	org.keycloak.keys.KeyProvider	04fb5b65-a9ea-4a2d-8f5e-0b7fad82a2da	\N
a3fa10b2-dc5b-43b0-ae61-309d93d1e188	hmac-generated	04fb5b65-a9ea-4a2d-8f5e-0b7fad82a2da	hmac-generated	org.keycloak.keys.KeyProvider	04fb5b65-a9ea-4a2d-8f5e-0b7fad82a2da	\N
b749c696-24d8-4863-a926-d596a982a1be	aes-generated	04fb5b65-a9ea-4a2d-8f5e-0b7fad82a2da	aes-generated	org.keycloak.keys.KeyProvider	04fb5b65-a9ea-4a2d-8f5e-0b7fad82a2da	\N
18505990-a144-4fbf-8e69-85a2545a7f0b	rsa-generated	eaaeb62f-362b-40bb-b7f1-d927afd6a6e9	rsa-generated	org.keycloak.keys.KeyProvider	eaaeb62f-362b-40bb-b7f1-d927afd6a6e9	\N
b569e435-eecf-4e38-9f00-d673cec02d48	rsa-enc-generated	eaaeb62f-362b-40bb-b7f1-d927afd6a6e9	rsa-enc-generated	org.keycloak.keys.KeyProvider	eaaeb62f-362b-40bb-b7f1-d927afd6a6e9	\N
ea1db454-626d-463a-9514-9dcb759aa18d	hmac-generated	eaaeb62f-362b-40bb-b7f1-d927afd6a6e9	hmac-generated	org.keycloak.keys.KeyProvider	eaaeb62f-362b-40bb-b7f1-d927afd6a6e9	\N
75eda4db-6b8d-4a77-bbbe-55d63de3ea5d	aes-generated	eaaeb62f-362b-40bb-b7f1-d927afd6a6e9	aes-generated	org.keycloak.keys.KeyProvider	eaaeb62f-362b-40bb-b7f1-d927afd6a6e9	\N
d93ecbad-748b-4821-8ae3-28fabce1f06f	Trusted Hosts	eaaeb62f-362b-40bb-b7f1-d927afd6a6e9	trusted-hosts	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	eaaeb62f-362b-40bb-b7f1-d927afd6a6e9	anonymous
1e5a177c-0427-4240-8891-ed727b27f7d9	Consent Required	eaaeb62f-362b-40bb-b7f1-d927afd6a6e9	consent-required	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	eaaeb62f-362b-40bb-b7f1-d927afd6a6e9	anonymous
ea52e959-0fab-4a00-b544-d4abf90411cc	Full Scope Disabled	eaaeb62f-362b-40bb-b7f1-d927afd6a6e9	scope	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	eaaeb62f-362b-40bb-b7f1-d927afd6a6e9	anonymous
99230b92-60a7-4edf-b4de-a66fb4d74f1b	Max Clients Limit	eaaeb62f-362b-40bb-b7f1-d927afd6a6e9	max-clients	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	eaaeb62f-362b-40bb-b7f1-d927afd6a6e9	anonymous
b375cd59-2bef-4641-adca-cce75503e6ba	Allowed Protocol Mapper Types	eaaeb62f-362b-40bb-b7f1-d927afd6a6e9	allowed-protocol-mappers	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	eaaeb62f-362b-40bb-b7f1-d927afd6a6e9	anonymous
d77ebb41-b276-4802-83a7-85bad0298020	Allowed Client Scopes	eaaeb62f-362b-40bb-b7f1-d927afd6a6e9	allowed-client-templates	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	eaaeb62f-362b-40bb-b7f1-d927afd6a6e9	anonymous
c5c16a4e-7680-4f09-8951-1e60311f2cc1	Allowed Protocol Mapper Types	eaaeb62f-362b-40bb-b7f1-d927afd6a6e9	allowed-protocol-mappers	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	eaaeb62f-362b-40bb-b7f1-d927afd6a6e9	authenticated
5fe24767-78c3-4bad-bdc6-b9adc6aa1d3a	Allowed Client Scopes	eaaeb62f-362b-40bb-b7f1-d927afd6a6e9	allowed-client-templates	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	eaaeb62f-362b-40bb-b7f1-d927afd6a6e9	authenticated
c7da728c-5bf3-459b-86c1-421b6492ae45	\N	eaaeb62f-362b-40bb-b7f1-d927afd6a6e9	declarative-user-profile	org.keycloak.userprofile.UserProfileProvider	eaaeb62f-362b-40bb-b7f1-d927afd6a6e9	\N
\.


--
-- Data for Name: component_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.component_config (id, component_id, name, value) FROM stdin;
fbfe458e-0b67-417f-9239-eacab47a6bb8	dd85d80c-6858-438f-a80d-2856a9ee98bc	allow-default-scopes	true
9a78009c-5d8a-46f1-a082-bbc032a10658	32df4514-6a95-4905-b06e-55d5399a8138	max-clients	200
dfef72a8-50ee-4057-99fb-68b6e2a8edb8	ecab045a-52fa-4a99-abd9-ce9a469df352	client-uris-must-match	true
ddbf9766-63b6-4957-b084-2e374bea6765	ecab045a-52fa-4a99-abd9-ce9a469df352	host-sending-registration-request-must-match	true
bbd959ba-7c25-4898-bee7-80c991d4b8ae	0b3243b9-0e15-40bc-8e16-b66ad8080742	allowed-protocol-mapper-types	saml-user-attribute-mapper
7e4b1795-6bce-45f0-99ee-b27dacf3b009	0b3243b9-0e15-40bc-8e16-b66ad8080742	allowed-protocol-mapper-types	saml-user-property-mapper
b134afe2-7757-4ec1-a8f4-df6a4478e9c9	0b3243b9-0e15-40bc-8e16-b66ad8080742	allowed-protocol-mapper-types	oidc-usermodel-property-mapper
09fc8c22-2ecb-44ac-b1bb-3883c03cd3a7	0b3243b9-0e15-40bc-8e16-b66ad8080742	allowed-protocol-mapper-types	oidc-address-mapper
3ad03ec4-6641-4fdc-a2f6-dd842732644f	0b3243b9-0e15-40bc-8e16-b66ad8080742	allowed-protocol-mapper-types	oidc-sha256-pairwise-sub-mapper
8047f30a-05de-4ada-8b94-b2e7b8e5e142	0b3243b9-0e15-40bc-8e16-b66ad8080742	allowed-protocol-mapper-types	saml-role-list-mapper
f1da4654-595a-43c5-ba98-1e4578454c3e	0b3243b9-0e15-40bc-8e16-b66ad8080742	allowed-protocol-mapper-types	oidc-full-name-mapper
f578f6cf-4acb-497e-870d-1eb0a2bb21c3	0b3243b9-0e15-40bc-8e16-b66ad8080742	allowed-protocol-mapper-types	oidc-usermodel-attribute-mapper
0d211300-2909-46ce-b77b-709f4b746281	40abe5ed-6214-4180-b539-c3f732612b11	allowed-protocol-mapper-types	saml-user-property-mapper
e4e079e6-2b11-401c-9835-7c165db49b3a	40abe5ed-6214-4180-b539-c3f732612b11	allowed-protocol-mapper-types	oidc-sha256-pairwise-sub-mapper
72c60128-20f8-4f57-a43f-20f3a04c6850	40abe5ed-6214-4180-b539-c3f732612b11	allowed-protocol-mapper-types	oidc-usermodel-property-mapper
3cd1e2d8-a575-418b-9d00-38f5dc18cd6e	40abe5ed-6214-4180-b539-c3f732612b11	allowed-protocol-mapper-types	oidc-usermodel-attribute-mapper
5c0cc9fc-4a2d-4952-9d0f-313423047028	40abe5ed-6214-4180-b539-c3f732612b11	allowed-protocol-mapper-types	saml-user-attribute-mapper
d4f21faf-b3f0-43d1-89f7-fc7800f5351d	40abe5ed-6214-4180-b539-c3f732612b11	allowed-protocol-mapper-types	oidc-address-mapper
d9c36b93-19e9-4f15-84f4-a8f6e47560d9	40abe5ed-6214-4180-b539-c3f732612b11	allowed-protocol-mapper-types	oidc-full-name-mapper
13043bd9-5f88-43b1-bd2f-4ced84e632d0	40abe5ed-6214-4180-b539-c3f732612b11	allowed-protocol-mapper-types	saml-role-list-mapper
9178267f-5d33-4bf0-8370-c37a2e54812d	c0330947-025c-4218-a7fa-a82644c6af13	allow-default-scopes	true
f2ca349c-653c-4a5d-8155-bb426fe91dd2	b749c696-24d8-4863-a926-d596a982a1be	priority	100
654e5319-f166-45bc-928a-9ceb5b4f14e8	b749c696-24d8-4863-a926-d596a982a1be	kid	6ec7ff99-a6db-4adb-bc06-a42e99bcaaf9
4f51a2aa-8ebf-4f07-aea7-445c35ea04b3	b749c696-24d8-4863-a926-d596a982a1be	secret	Y4fKGDTotQFJ_keFhsDO-g
51d1e5fc-cc63-4e93-979b-51a7574880c0	a3fa10b2-dc5b-43b0-ae61-309d93d1e188	algorithm	HS256
7bf47d07-b95a-4529-af2c-ee7426a8ac5d	a3fa10b2-dc5b-43b0-ae61-309d93d1e188	priority	100
9347104a-1a3e-40cf-ba0c-c056a89f0e18	a3fa10b2-dc5b-43b0-ae61-309d93d1e188	kid	f29353db-3535-4499-a2a3-f6d9ee1433fb
64b21fcb-d02c-45e5-81cb-c3856b5e1482	a3fa10b2-dc5b-43b0-ae61-309d93d1e188	secret	2hl_QCO_Cdy7Vl2-TnMbGFpaATXpS9j9K_PGZYgCR9iGskicXiT2tVfpOYygPTEpf603cEtphkm8AmQO_oU_wg
20cdd42d-5511-44b9-b491-bb4454834833	fe8a0977-0cb4-440e-84c4-265367107028	keyUse	ENC
2d4e164e-395b-4da5-a80c-f0a173635f0f	fe8a0977-0cb4-440e-84c4-265367107028	priority	100
cfbaa33a-61d3-40f1-95c9-9443026c0d93	fe8a0977-0cb4-440e-84c4-265367107028	certificate	MIICmzCCAYMCBgGMku72kjANBgkqhkiG9w0BAQsFADARMQ8wDQYDVQQDDAZtYXN0ZXIwHhcNMjMxMjIyMTkwODAzWhcNMzMxMjIyMTkwOTQzWjARMQ8wDQYDVQQDDAZtYXN0ZXIwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQC7Q5kjcSqyjwLSPesluZwthxMyNbrj2tpMQZqi+1gs0HCYiGTJ5KUNe3QLPPgbe2wpV7eAeE6M7izw660iU74CdWIHJTTjfl5exVEiPCCffGf3ACC4RdCKvSVhcammDNdHxTxSLK/Xae/MFfjhPdOPC9nJA3QYcaku1PaoyohkOstqer3dEZI4lzU9wzsS1qRCLFliq8y1fY38bQkS2fZqWBjz4AF1DkCUX6udRP2JTQLTlgJN8SzA4Yib9VVOiMGc7y8BHpTkStD/Dk16DJKz73pdzAbGLdY9JvY4hpNiL81utBFNj9VkPqvg+wZx5fZX0xeUtY/kjJkvHscl7J6JAgMBAAEwDQYJKoZIhvcNAQELBQADggEBADrrjpXgD+QDnXhsM+7BoAbd5M2vGc4vDVWGdov6zKtunps1j66wYnjjOPGFbeHcjQuOGAJfxru1RTdoTIXglqVjrXiuXlJmaCri+SqJQh7O8ZIyGD7fYsoRczSovYdq1wDXTdCG3ROCkrzbyqIXM55111B3qYokMbNEL4Ffv6+LsZj9AQKmzotT665+GIsyC9/5sx34mZMrPfGpwX0nrGsdENpObuSHivSNEDZtZrta8Rkpj1DKXEYxpkI5mfyHvqm7d+4OEpTVT206TUL55PCQV5druus8opLqi5r0Vp1fILX+cfbiKpsdov1ueIvhVr761watNwNC4Kc91ruH6XI=
b0942a00-60f5-49ec-8bd7-7efe54c855ed	fe8a0977-0cb4-440e-84c4-265367107028	algorithm	RSA-OAEP
3825f542-107d-4897-8a4a-2c6d13bb7da7	fe8a0977-0cb4-440e-84c4-265367107028	privateKey	MIIEogIBAAKCAQEAu0OZI3Eqso8C0j3rJbmcLYcTMjW649raTEGaovtYLNBwmIhkyeSlDXt0Czz4G3tsKVe3gHhOjO4s8OutIlO+AnViByU0435eXsVRIjwgn3xn9wAguEXQir0lYXGppgzXR8U8Uiyv12nvzBX44T3TjwvZyQN0GHGpLtT2qMqIZDrLanq93RGSOJc1PcM7EtakQixZYqvMtX2N/G0JEtn2algY8+ABdQ5AlF+rnUT9iU0C05YCTfEswOGIm/VVTojBnO8vAR6U5ErQ/w5NegySs+96XcwGxi3WPSb2OIaTYi/NbrQRTY/VZD6r4PsGceX2V9MXlLWP5IyZLx7HJeyeiQIDAQABAoIBAAIF96eEFDSF5Aw2fA4JZKnlqp9UjxZ7XMSnKGirZsDKzcFwJwduNeeHFnIxCfM63aicS7csVZjwBKjjuv6pQSvQoRFq5WV+p4r5mDTsL/2l8yk38jwoRCaqALd+HWZvmOHfIskDT5d4JXQJWfBarsIxNa/jOCoz2Pw3DXIC1WXT0gMhH58blPZE8l2Sm2Lg85IOaAjAOr3jp5dDPwm3sKhSNAzOehgKCv1D5DJwds8ABaSozKOtjOpNqZkewzL8y6bw5uyP3b2cRu3Fdb1paq6swGeBiOAkSjbPDTQPgz5FcMGbut0vCSiY884Okp5DjFNKh6wkrB4MNHhKBUyNPakCgYEA/zixmD47hTa9j8L21jS49oqB3+/TA8vCKj6DTI1fsdSia37BvuB0xi4zE7PfHvqlGErqXFH7GHxHJWtkhyXel0zthNDui9Tq6FAn6xR2YSjCmGGuerJ+oAm2D93xscDZyjik32RZp/vNKtdujwg3Q4Jn4dUiWasa5vEBHdKd8X0CgYEAu9XV4/3F3XvKmBiUlqfWJmTGddlIGlKvieCIxgrx1c7F/jhMiS59abrHheV4ptJ30R/97unHqTxCf69CoqYLp+UnkNuhDIoJIJgzK2HOaejMr9sX8zrsSk1yjvepMrD1w1jhN98NfWcaDIM2QBXbBrHS+4PxQp4fVUuRdssarv0CgYAo798MnG7Pn0golw0grrQ8V1sdoEoogbZTMFO/I64FyCWFOH+7LiWM5DwtHNzdCzcP/nQ4+q1b8BM5XVBynRBnFF/Evf6FT1GekbzVaCLU0sTjzEdARwEoimY5hVAPQu+sEAniCyaWWz09cfC54Id8vJ4NCzLHTzqxcFbNgcrzwQKBgFOc03KCw7Jc6Ykc3//URFKg52sMRrlY90Tjy16E/rPTMHWCsCccp70J5MkopbV02NshZ5MTQ8qExYE7DemDCos5SYyFB8KiK3/z4Es+ZXjlpT/ewmGGaCqHISic/BdRiITlqpOJWeLpo0HQorSSRgZL4AQP7rRd2MrKMb10mbMtAoGAYJ1OC3+7OXwx03tyUyLIjfLjpPzwZ6c/rjJzrjflZPtmD+7iRQpoP1oqG7yKEf+9z38nW6NcfgeGpYY43N+h5ZAN6KT/uxfIFJhNV44k6h2X0JRwlD8X79xvPBHG9FwiqgJHj0Ae1/fn2miJofteAdOEJH1ZQ1/K0HmDiW42ZF4=
0b000822-382c-4e9d-9df9-4ff77de6bded	20e7c1c8-6338-42e9-9519-2c2470fb8a05	keyUse	SIG
65d2891f-9a0d-4310-9aae-989ee3f5badc	20e7c1c8-6338-42e9-9519-2c2470fb8a05	privateKey	MIIEogIBAAKCAQEApGciL1UxO7hUy0JsU/MQaS2encwdq25ZL71YMQFqwlRBNhMnFOmvaONaPPuuFOv+plsWGfHgMw08jajymcVJWmtGTRGIBwKk9Kt3PP5YL6ufH3O13twluN4adfBCSv7qFc3jhMgzlmIC4/hfelV8Ro6HuM6Inslba/4aoBWj45DdM5nIwTzeWBiNNtpXxvmzT2zUHRFga3U62RJegWgH6nrNkC71Ina2PKzk0UOIwSdIi/31MU3g78ZA/OfrQhELWt+bHQtM9z74b+Uj9jKvL/84ttkZ/fFcGoz2iABDYDZ7z3suaUF2MKkj2G3KStabqsPR7aZYenMxNdtMnYBGCQIDAQABAoIBAAnpxRwtCyWyePxzoiQSvz3UWCDkNrLIWdzg0jFMSFN08KSx1XSznZXZxa5xL59H1qhRzDyewtnZNbpGAnDmvkRTPR83DCh+DpPJRgyZupgPRW5IVCJezHCABgDwDpNGmTdc3Zf7WW77NHjqGFnAT1jSzdjFLWRDuH1Dyne2LlZxpDiqzGx3HAnzmsSsqf0M8uidbRHCOc0miBBdIzMg/9Q4hC7JAK5omZWdaCVYDQy5Ob1UIc11KSotj19JGPZfv75DZVwJEdMNFRFuFRDNaPHGRtL5vrW1rkQOhfyMcxD2uGRzf30JbImWqkfEfml8xv/sBJqjSOcry0bOw6rMtP0CgYEA2WHmlQfgl0xH2UOMdZu6kfMnIQMluZG+/J7FOoNXH47Qa+N9XB2ZIjAnyssM6mn/bu8ypN4kb7vGdwwdJuquHmjUj49ZT28YQx+pTMXyiAjUA2+18fv9ixx8DaESnBmja5tNety3Lz9puoSLEMW15/ID3REOQ91PMBDTpkQPrf0CgYEAwZvVPSH20DeEaJdur0kQ+eeH2IAkhqVY0HqE4YJq9OEHNBCr/w41TxuImWJu41jnM1jxp+dNnVyzIgmCFRO5h96VYL7aT0c2wAiwaj/yCv5Xl9ve+l8+qB2923BmDvbHD0komo6q23xBaXYrbiHByCnbZ+trhkJvEsZZY69lj/0CgYAzz4Wpl4sMBH5LZjIgBdHd31pAIAPpyrb+dskDPTKSrvM2A65pOhS5dUjGqMaXSFQ9GH21lcyRZOvUi+qWz/BYBxxCayQaLpxVw0ISrksz6Qa/Guz+k9TGRy+5/93znpi4mPdKhTiT5kVI0zZh9P16HtCU6+++dQzeo+QOCMLD8QKBgHdVoQL0S1gd0BxTsqKSK8eNYVsd6OWhRvQBgKQrKdfUWAdMe2dTj6I5+2Fnnae+JYutuA3g8SMcf0FskOSC6umHVZVzLcaNw35sHKjwzzTdfooYuQCj8k/XPS3jwtRYYWvXkRJq+38bwInLj4trfTDuM9GC9xyjGCl/XpumAbjVAoGAMutQx1B+TIEAYwliAOr3DTeBNog3L7iCWWcwSYlMAMUxte8BbTNWuzkluqHHbA/WIBDZ8fxoGPvzoBRumU+RPry3s42ufWIVFnD9lxrpNvfFOuf0BdXuSUR+H6fscTRbHweE8vxgxR6GqQMGvkLFKBRFCYfCKNcym7hNamg8rzA=
9a05ea05-5cde-4dd7-ba98-1b1dbec1dc92	20e7c1c8-6338-42e9-9519-2c2470fb8a05	certificate	MIICmzCCAYMCBgGMku708zANBgkqhkiG9w0BAQsFADARMQ8wDQYDVQQDDAZtYXN0ZXIwHhcNMjMxMjIyMTkwODAzWhcNMzMxMjIyMTkwOTQzWjARMQ8wDQYDVQQDDAZtYXN0ZXIwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCkZyIvVTE7uFTLQmxT8xBpLZ6dzB2rblkvvVgxAWrCVEE2EycU6a9o41o8+64U6/6mWxYZ8eAzDTyNqPKZxUlaa0ZNEYgHAqT0q3c8/lgvq58fc7Xe3CW43hp18EJK/uoVzeOEyDOWYgLj+F96VXxGjoe4zoieyVtr/hqgFaPjkN0zmcjBPN5YGI022lfG+bNPbNQdEWBrdTrZEl6BaAfqes2QLvUidrY8rOTRQ4jBJ0iL/fUxTeDvxkD85+tCEQta35sdC0z3Pvhv5SP2Mq8v/zi22Rn98VwajPaIAENgNnvPey5pQXYwqSPYbcpK1puqw9Htplh6czE120ydgEYJAgMBAAEwDQYJKoZIhvcNAQELBQADggEBAG8M0MABp8bMO8PvWgZDy3VZBmb4cBiwz8KzUjQ24cWCynhsmMY2fbwLZuZMsKaVEe3XeQpUqhTg2k8KxTdtK83lllHAaV1LNN8nuDHn2RCY7wJhNFJSahO14xF3NessHuBVY1nFHKUAk8PBzHFBoJb1koPzeOiPbPhRCi8jL2JGOaD+bI58AMTu69oMmZZDJqIVgdZz6r1InDqKerXgSnBjwkXXTrPIaKfBCBa88t/G2QJtHXxa6LGNQUuk0l/lEinAE1O+OhIJigFpRH8Jgg2djA14sdxo0wcgr7C9BQB3iDGgzhmhPzx8UFQ2/I8xHbS7zJeKtMhF5JT6YKDAjEg=
3f2c4a67-7e87-435c-9574-54747c695d0c	20e7c1c8-6338-42e9-9519-2c2470fb8a05	priority	100
7764f4a2-39fa-4ce4-b8dc-2be38ae15ccb	18505990-a144-4fbf-8e69-85a2545a7f0b	privateKey	MIIEowIBAAKCAQEAmjvpKz/st4TJ1Ye7DHwpdn67YVPi2BwT0SlyIH6/1jaeZupIl3mFcNE0lRY3gAYNSjUCAgDaci2hYX1FhqaD8DLzas34qqkC3qZQwAnG/UvS7+DQhjkGf5Hq0HayXjN3SIz130KfDPdEQ7b6YWcx+IozAe17MwokZKmBq+Un7B9x51wLSX9vNV7aYS7lACxA92f+XGGore8DLvzZidoPLq/nV/tyNYuu6LDmCY/T2JmagOdzHMzmkSZt6B9DuDDN0K6BMDGUA1E7S71J4cXUAOvzyNUrIro5JNcMEP512oLk5M/OGeKPJELnnuQby8Xo1Dr5yz0lQThee6LYAVc+MwIDAQABAoIBAC3cSJ3KmTmMa3Nps42n0bBhSJhNGDOITcAw4bWV2rb4cKtLWKBpyurb2hXGkGQp6IO7NUihNlMjDExvsl+yXaLrk4ObkSg1rxvDOlmPzrJ8fFFFeNugUzVVjwvDb5AhH4PcHjPvnFl/oLW9z79srugnN7mIAs0PY/jmih8xuWg1DyzLxzPBhEuIe4WXRAAXNo73cNUFDAUkBrrnco8iufBYfH3SfSuHBIZOS6zgC6vABEtzsN/jhA+HS5zv/8S5H8DAFiJDGDXpl7UukKTcJjub0nhfNmGmu5nx+6ss0vSN4SWCfUZy3U/TkWAntIoVOM5dhHSJvOGYwuuO63UyPgECgYEAzbp+IxCd6l/B2DVhkCmOt8smriSQ98YbB+mGIWHfEeD6+M9w9YsXeioK0grTdNw6A4hH4b+yEczz0eL3tW6aTbrRd76lYzwNR/01ZiEgyZPyxinumU2RAnt2kERfyKJnKH2zRvxJfnHY71Go2JjuAMNV39UjyWGMely7ezRhKQECgYEAv+wkQW2khfarONHlPvyk4k4Hv/R6CgLZpS+MiKUvYPJLUA7hOv5y/yr93Argx48J3tZcv7rEJ3MqCtPN1Y8i6kKOt0EOW8aLpND9i+0kbbstTfzViMUbKrK1p9US1PrTmtUtfY1/KYsBL9XUHXV6KZ/3IK/M9kFB6+t838LxEzMCgYEAiQaVKz/PHqNnFl3/vKihYXOTMNw0HoQ5ztxQtX1duafTIdPxVeqt2XWVPW9uhmCE14N29TrcHRUYtQxqltKzPeCX0h0ORXljEzbo0TxxfTHouuqE/GD4m+GmB9MyxQy+ju6icT5qqSilKEmIn7PEmoeAdBSfwGsTyRBo41fw+wECgYB1M+o4IpL0VFzfyB5tRrASm4BUEyJr9q2fGNiDogy68XxYmZ2l/zmO5lw9Ak+ezpVChjoBxDaBuOyVzB7JKi4yTQ8Gji4MkcU5k38i8mDqugHCvIJSkbwzaQtSQObNNZf/1+t93uknH4JMChMNIm7F+LBcP7+1KsjtH9QUeeHqzQKBgFpSQdo6BoHD08A/6QQiv8eYmxADmziCDx7Iy2zRXeKa9HXtX/9HPHHeitPLGB4vEUeeoy4giwUZsjYTNWOu1zD+GjVNDPC/HuoxVf2Eaim9e+XnCnfPQtgehag56CZ3fTHH8t+CEaAV4yGbeia4gt3K9z+na9xztY/OY5AsWUGQ
d878e93c-5314-49f6-a4fa-9fa2cbc1cdd4	18505990-a144-4fbf-8e69-85a2545a7f0b	certificate	MIICnTCCAYUCBgGMlAg+ljANBgkqhkiG9w0BAQsFADASMRAwDgYDVQQDDAdobW15em9uMB4XDTIzMTIyMzAwMTUxN1oXDTMzMTIyMzAwMTY1N1owEjEQMA4GA1UEAwwHaG1teXpvbjCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAJo76Ss/7LeEydWHuwx8KXZ+u2FT4tgcE9EpciB+v9Y2nmbqSJd5hXDRNJUWN4AGDUo1AgIA2nItoWF9RYamg/Ay82rN+KqpAt6mUMAJxv1L0u/g0IY5Bn+R6tB2sl4zd0iM9d9Cnwz3REO2+mFnMfiKMwHtezMKJGSpgavlJ+wfcedcC0l/bzVe2mEu5QAsQPdn/lxhqK3vAy782YnaDy6v51f7cjWLruiw5gmP09iZmoDncxzM5pEmbegfQ7gwzdCugTAxlANRO0u9SeHF1ADr88jVKyK6OSTXDBD+ddqC5OTPzhnijyRC557kG8vF6NQ6+cs9JUE4Xnui2AFXPjMCAwEAATANBgkqhkiG9w0BAQsFAAOCAQEAgZJCLeiOo4oTCBHojcB+zaL6HcGCJ07ovtLY6R+WJZT3B2x8MsIyZcEt8wNVjj4neKAcvArh7s7yZOwOTRdenXcsGK/rr9M5jsGbhzpWx1gK7PO7OfHFEv0E5mVZKhfYlCcbkGACPD/JWA2ucJRpk/pPAeflT7TvoTuAhZWA/eaLMdQj6t5HptJzCX2bTGay4LwWzQU++nxKllGUm8UsMYCJf1vtx+mk/u20kfKdVgKzxZgebvTxBA3mL4tMoU71+mDHiHGjcUbQq9PNskp3Ephc/BtQQk7qrH+g05JUngHPuPn15q3Xrc4+l2TFobC8IpGlEFhl4+/wVJKge/9Qew==
d79fc0c5-3601-45ec-8441-6b390d890d35	18505990-a144-4fbf-8e69-85a2545a7f0b	priority	100
28bf9b69-06e9-4ab8-9e31-1be36d0098a9	18505990-a144-4fbf-8e69-85a2545a7f0b	keyUse	SIG
69c40046-b8d9-4563-99d6-a7d7fe4ed605	75eda4db-6b8d-4a77-bbbe-55d63de3ea5d	kid	72567645-188e-4ca3-a74f-577be547ec21
fd53aee5-de64-47e6-9de6-ebf2577e6e09	75eda4db-6b8d-4a77-bbbe-55d63de3ea5d	priority	100
13eba29a-9293-4769-a4d3-bb435a9dea86	75eda4db-6b8d-4a77-bbbe-55d63de3ea5d	secret	VMYboB9jPTkuWFYWjc7k9A
77368f81-36a7-4f27-9afe-a6a748292033	b569e435-eecf-4e38-9f00-d673cec02d48	certificate	MIICnTCCAYUCBgGMlAg/gjANBgkqhkiG9w0BAQsFADASMRAwDgYDVQQDDAdobW15em9uMB4XDTIzMTIyMzAwMTUxN1oXDTMzMTIyMzAwMTY1N1owEjEQMA4GA1UEAwwHaG1teXpvbjCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAMgPsh0QKpYX432vXJmRcH41udcJ7bKmliAtBC7gUGtegYdlBDlT848F20aObkRU82PBLngJKfv9WDSe+HXVi8tXVEUZjlAnYuATJJeWVqVPYfX0S+FzxrE49VThPhHLaptoaLpGMuWdtt40G+Y/ZEwr68IPxF/59C9qPyF1PwKDQLt7NZzS5KsZ5tw6waGpxtbOI8KmO3OdK1Tn+lrnw+pWmi9pPt9fffMnRphAnvYGOvmMCGxhGbj+2aF0vT1FlBeQSp19UPjxGkeZxX/X8zf0i7krP11Ma4WNuG4cwVLOxU7VMMqRz4xCMXH722wf1/95Whh9hLKzuqgib3XS6ksCAwEAATANBgkqhkiG9w0BAQsFAAOCAQEAmFZAKf2hbLFRJsvf08Nt6gfvAz4B5yQuIrip7PuEuxh9aDWZ5dOceE3krFc9HY5jjanTNC5usTvHynQtP5yc2IuMQgq4IIEoMZZJzhpoT7tXuJqWVyKEDXQ9CGnMApRz66cnjxcRUvjBBQ3d0bbbZl4eurft80Oqu7sd//B9OO2+ItKdvglmys4r5BnNxaXoc9cKM69XcpWDOUBRMKrtrtWcRxJgDdDkWoPm8YiMHXqnIOYxlO6HXtf0AmtzYVSmq8kgDIWjM2JBTZJfnjlPT7IrnGfjJrt5WF3/UQB1qps60LO6ThdcmcNhW1aJNkAN0OBp9UqmpnwPuTvdeleXpw==
0960e2b6-0aad-47cd-b56a-66f2a0ef65c1	b569e435-eecf-4e38-9f00-d673cec02d48	privateKey	MIIEpAIBAAKCAQEAyA+yHRAqlhfjfa9cmZFwfjW51wntsqaWIC0ELuBQa16Bh2UEOVPzjwXbRo5uRFTzY8EueAkp+/1YNJ74ddWLy1dURRmOUCdi4BMkl5ZWpU9h9fRL4XPGsTj1VOE+Ectqm2houkYy5Z223jQb5j9kTCvrwg/EX/n0L2o/IXU/AoNAu3s1nNLkqxnm3DrBoanG1s4jwqY7c50rVOf6WufD6laaL2k+31998ydGmECe9gY6+YwIbGEZuP7ZoXS9PUWUF5BKnX1Q+PEaR5nFf9fzN/SLuSs/XUxrhY24bhzBUs7FTtUwypHPjEIxcfvbbB/X/3laGH2EsrO6qCJvddLqSwIDAQABAoIBAF1o0rF2NGQbKEktQS+ktCEBpdEtHhI9bLf+PMdETdgr6o+Uj1nTBFPhmKXDZ+G4xmFrt+4s3TD+c5oyJXEjMV/SWRLgYU20bhqQZZPvimop++OyWmGcRIfHv+iPOINndlG0eL2MfEQwlMsACozBSWu1UCEuanKjiqs+0NYm37IkUeMzFUis1NgQw01Du9P9eTIkM7/HFSOP35EMV38g3tLjU7VP7AMmfbIoSW8CMOSqxXhhCO6QuihT0Srw6zlednIOf9HT+XXU0SQRStotm74bKOoI/QMzUJ0i4z+pdx/jS+uM0gUa0/VAGvYbue4UDIWH6bmJ3dr4yw99WgFpluECgYEA7GIC9ic0SmIGSn4p4tCcGaLzYZco1y3vUegkIbkVYuv6v6CeYh8jSKCGHh9vu22nW3Hycn4m00gVdwG89duw2PN8pPtgSW8bv5SI+9vSzZtxe7TVwwDGmpbCJPyr9+4hPBuQ3Xjn9Fj97PZcfxmlPScRMWDYLQD4aPZNAqe8oqECgYEA2KoHEhzdxFa5nxYSGXP9cukTFaF5j4lZPco/yDBOipNLwaefQEQCqKlVDw+8cEYAJGCuOf5+iXHx8aDmphgTDZXBpsKL51OAVnRh/GpE1s38aualwA8IXxhSEjX2vSi0rqcRsnayka6buKY3mWFGTqZj8LxVlsSc5TVb0aLGUWsCgYEA4fZvTk77tX8u9FbWQ3OXRQp4DXoqGEhY1btLjtEWmJFsCXLI9JM/b1XD31e9vzV7Hfc3BCuDgcUOf8yxjXSNAVcAd9W0nX4Q0Hp02A2y3ckSGmcrUFWVhIFI5YKEAWUpcAQJ3yyMzw+i7Lo0gWtKgcKutL0W6S5cSDnqM/eUYwECgYAjxU6Niv6CH99diINMeH3rrtdbxuEO9ZoqPW3yWydccZ0cR9RfA9t8hRhp+CsgTi5P0zZwlLfHcWyEfBAYc/kRURw7r/rxIjQaEfTre5AJ9tApxhKvdsvnB1jlcMtfx4ytGSAu2rH4o19KSQb857Z33bi6Uh2/Wo6cuQaDweAEKQKBgQDbkupj9HfgW/nLV5DWcFCC3w1qyIFRzn3G70YhKagIKn6fGf6rfB5SZAj/pSznLMW2l6+hhjyll97/Us7WIB9YjtkaJBiALYjPS/eEdJmYJA47NG0gkBp7ZEohfeOeHrbQdHDHLlVa6nFNsFOjXLdhWLIF6mwxVFwFXydPh8p9gA==
92902fff-472d-4208-9cfe-dda514f28a8e	b569e435-eecf-4e38-9f00-d673cec02d48	priority	100
8ba4c03e-7ad8-48f2-819a-37aa661fdae6	b569e435-eecf-4e38-9f00-d673cec02d48	keyUse	ENC
584f14f9-231f-4c15-98aa-08f1877c608f	b569e435-eecf-4e38-9f00-d673cec02d48	algorithm	RSA-OAEP
c7e95967-b8aa-48c6-ae0e-f72f521082b8	ea1db454-626d-463a-9514-9dcb759aa18d	algorithm	HS256
64eab240-4258-4329-acde-8bddaad3216e	ea1db454-626d-463a-9514-9dcb759aa18d	kid	cff64a41-4a31-492a-a2ad-8b6b6eea8f8f
8e0246a3-6330-4763-abf6-97f3bbbdac7c	ea1db454-626d-463a-9514-9dcb759aa18d	secret	pepor1hljnRs3YWlsO_VfbzFM7Rf00lbFEPI99303i32Y2oYFUCorEKQ1rl_ae-Z7c5HnEW8JoCLJ3EHaBWezQ
f6e240cb-3b74-44aa-8908-d5aa9f86a21a	ea1db454-626d-463a-9514-9dcb759aa18d	priority	100
8a0bb6fe-8e72-4563-bed4-4a94bf31b6aa	d77ebb41-b276-4802-83a7-85bad0298020	allow-default-scopes	true
faf2a0be-eafd-4c93-977c-d29cb147f29b	c5c16a4e-7680-4f09-8951-1e60311f2cc1	allowed-protocol-mapper-types	saml-user-property-mapper
790e00cb-8503-4a1d-95de-9c44f9384c90	c5c16a4e-7680-4f09-8951-1e60311f2cc1	allowed-protocol-mapper-types	oidc-full-name-mapper
67e39d73-6083-47e5-b42e-5de772fe7b90	c5c16a4e-7680-4f09-8951-1e60311f2cc1	allowed-protocol-mapper-types	oidc-usermodel-property-mapper
f22883a9-43be-44ab-8b97-863a1d441723	c5c16a4e-7680-4f09-8951-1e60311f2cc1	allowed-protocol-mapper-types	oidc-usermodel-attribute-mapper
fdd492e6-c396-4393-ad89-959960057bee	c5c16a4e-7680-4f09-8951-1e60311f2cc1	allowed-protocol-mapper-types	oidc-address-mapper
4ef78e88-c35b-4f14-b225-b999fe9e106c	c5c16a4e-7680-4f09-8951-1e60311f2cc1	allowed-protocol-mapper-types	saml-role-list-mapper
74796eba-7aa1-4542-a4ce-f7630532d0ab	c5c16a4e-7680-4f09-8951-1e60311f2cc1	allowed-protocol-mapper-types	saml-user-attribute-mapper
85662736-efb7-4b23-b9f1-1940daee09a3	c5c16a4e-7680-4f09-8951-1e60311f2cc1	allowed-protocol-mapper-types	oidc-sha256-pairwise-sub-mapper
77bd54c9-4fdc-412b-bf4a-fd638fd2df0b	d93ecbad-748b-4821-8ae3-28fabce1f06f	client-uris-must-match	true
89a608bb-4694-406b-951a-68b373724678	d93ecbad-748b-4821-8ae3-28fabce1f06f	host-sending-registration-request-must-match	true
c83ae128-5c18-462b-8aba-7ca7f9187223	5fe24767-78c3-4bad-bdc6-b9adc6aa1d3a	allow-default-scopes	true
f1d6241c-fd36-42ac-ae97-2b7ec0dfb7fa	99230b92-60a7-4edf-b4de-a66fb4d74f1b	max-clients	200
e6bf38f7-ad6a-4e5c-907b-f4b41f7b2df3	b375cd59-2bef-4641-adca-cce75503e6ba	allowed-protocol-mapper-types	oidc-address-mapper
bd1714b5-2ac6-4723-afd7-cb1b5d98b737	b375cd59-2bef-4641-adca-cce75503e6ba	allowed-protocol-mapper-types	oidc-usermodel-attribute-mapper
76c9847f-d5f8-422f-aa3e-30a160aec845	b375cd59-2bef-4641-adca-cce75503e6ba	allowed-protocol-mapper-types	oidc-sha256-pairwise-sub-mapper
0fc502dd-6242-4f4b-b691-6aa88f1d0b89	b375cd59-2bef-4641-adca-cce75503e6ba	allowed-protocol-mapper-types	saml-user-property-mapper
44ad6d11-b60e-442c-a0f6-25faa2bb7ca9	b375cd59-2bef-4641-adca-cce75503e6ba	allowed-protocol-mapper-types	saml-user-attribute-mapper
864fecc0-80e5-406a-b7c1-9fb1586b6ec3	b375cd59-2bef-4641-adca-cce75503e6ba	allowed-protocol-mapper-types	oidc-usermodel-property-mapper
b89ea7a6-ee51-481f-8ded-31f882a5c637	b375cd59-2bef-4641-adca-cce75503e6ba	allowed-protocol-mapper-types	oidc-full-name-mapper
4c865fb8-1500-485a-93ca-b443c89b12b4	b375cd59-2bef-4641-adca-cce75503e6ba	allowed-protocol-mapper-types	saml-role-list-mapper
\.


--
-- Data for Name: composite_role; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.composite_role (composite, child_role) FROM stdin;
b4122d25-9a3f-4dc5-a3f8-68ea17c4bcaa	6a7cb953-f272-40f0-b781-f0528d7890f4
b4122d25-9a3f-4dc5-a3f8-68ea17c4bcaa	a7568ef9-ba01-44de-af02-654be59f2a04
b4122d25-9a3f-4dc5-a3f8-68ea17c4bcaa	078bcaa9-f0ed-4a7d-83c8-d5ad55d9bb7d
b4122d25-9a3f-4dc5-a3f8-68ea17c4bcaa	d8f885fb-4b78-4f77-b2d3-96500e04f37a
b4122d25-9a3f-4dc5-a3f8-68ea17c4bcaa	295ffeea-efcd-4ab1-8697-9631dc002385
b4122d25-9a3f-4dc5-a3f8-68ea17c4bcaa	3743f98b-8579-4816-8264-c97c6efb0152
b4122d25-9a3f-4dc5-a3f8-68ea17c4bcaa	54ca9551-1aeb-4697-912e-479b86d26f64
b4122d25-9a3f-4dc5-a3f8-68ea17c4bcaa	c0c8cebc-2891-4659-9521-bfb2f2d8b222
b4122d25-9a3f-4dc5-a3f8-68ea17c4bcaa	2825b25b-6192-4715-abe3-f2bc563180ef
b4122d25-9a3f-4dc5-a3f8-68ea17c4bcaa	bb17aef6-35e2-44e8-82c1-da6b1f0864b4
b4122d25-9a3f-4dc5-a3f8-68ea17c4bcaa	11b0efa7-eef8-410e-b3ee-d3d739f89c0b
b4122d25-9a3f-4dc5-a3f8-68ea17c4bcaa	535c6f8b-b0b6-48bb-bcac-d317b958444f
b4122d25-9a3f-4dc5-a3f8-68ea17c4bcaa	10dd6c9a-bfe5-49d3-a457-6b5e3f257e4f
b4122d25-9a3f-4dc5-a3f8-68ea17c4bcaa	9d86466f-25d2-4626-a465-aa1cd9545e66
b4122d25-9a3f-4dc5-a3f8-68ea17c4bcaa	516f7b14-66d7-47c0-a3f2-2557449c64c4
b4122d25-9a3f-4dc5-a3f8-68ea17c4bcaa	77b99335-7ab0-4dd6-8860-1066ea72b5e6
b4122d25-9a3f-4dc5-a3f8-68ea17c4bcaa	de9da760-8281-47cf-881a-75b2ee755f52
b4122d25-9a3f-4dc5-a3f8-68ea17c4bcaa	13b79050-2fe1-4b7a-b21a-22f7717fcdc8
295ffeea-efcd-4ab1-8697-9631dc002385	77b99335-7ab0-4dd6-8860-1066ea72b5e6
d8f885fb-4b78-4f77-b2d3-96500e04f37a	516f7b14-66d7-47c0-a3f2-2557449c64c4
d8f885fb-4b78-4f77-b2d3-96500e04f37a	13b79050-2fe1-4b7a-b21a-22f7717fcdc8
d3f8884c-19d7-47d1-a3d9-ffa85bb27479	a2b93aca-6c5f-4459-b68b-ed5fbe77719b
d3f8884c-19d7-47d1-a3d9-ffa85bb27479	2a20a74d-5aa9-4399-8c3b-0dc29da48000
2a20a74d-5aa9-4399-8c3b-0dc29da48000	ad83776a-ff76-49d8-972e-0305b85cfeab
46864175-b0f7-4e54-b3da-e75a063a0ffa	49241d44-87f7-42da-a2de-c27e6f391935
b4122d25-9a3f-4dc5-a3f8-68ea17c4bcaa	d8ca5a5f-6166-4baa-aff6-4fa2bee811dc
d3f8884c-19d7-47d1-a3d9-ffa85bb27479	0282cdc5-1f82-4b83-9e2a-dd3655b20b07
d3f8884c-19d7-47d1-a3d9-ffa85bb27479	752f795e-0401-4652-b071-9e8ff939eddc
b4122d25-9a3f-4dc5-a3f8-68ea17c4bcaa	33c6f1ba-367c-4d9b-a527-bddd530bb591
b4122d25-9a3f-4dc5-a3f8-68ea17c4bcaa	b40bd39a-981a-4b26-84f4-624a443c67ed
b4122d25-9a3f-4dc5-a3f8-68ea17c4bcaa	f6135e69-bbff-46f7-ae0e-213ad922fbd3
b4122d25-9a3f-4dc5-a3f8-68ea17c4bcaa	ce84955c-80d1-4819-b8ec-7e54d6152094
b4122d25-9a3f-4dc5-a3f8-68ea17c4bcaa	abcd05eb-2f8c-431b-90d1-d89f2d648eb3
b4122d25-9a3f-4dc5-a3f8-68ea17c4bcaa	3352ac0e-ff9d-4a40-ad49-3e3da15baeb5
b4122d25-9a3f-4dc5-a3f8-68ea17c4bcaa	db24d0fc-4e73-4f71-84f4-1f4befc4e2e1
b4122d25-9a3f-4dc5-a3f8-68ea17c4bcaa	77b07242-62fa-4d18-b83a-3f0ddb7c9c1d
b4122d25-9a3f-4dc5-a3f8-68ea17c4bcaa	e6098035-831e-4668-8ebb-d99d1f1b15d6
b4122d25-9a3f-4dc5-a3f8-68ea17c4bcaa	475a7e23-8fca-4d52-8ab0-c657b81b7419
b4122d25-9a3f-4dc5-a3f8-68ea17c4bcaa	3d2b0e71-1b37-4bd3-aae2-f960d582bb4d
b4122d25-9a3f-4dc5-a3f8-68ea17c4bcaa	00dec864-c1ef-4a5b-b0f0-aadf1d02f04c
b4122d25-9a3f-4dc5-a3f8-68ea17c4bcaa	daae66bc-a19c-45d2-a340-c35e498caba9
b4122d25-9a3f-4dc5-a3f8-68ea17c4bcaa	b007b78e-670a-4499-959c-498aa2dc6c28
b4122d25-9a3f-4dc5-a3f8-68ea17c4bcaa	5ceb1fc2-e023-4202-8954-ef76c3522dbb
b4122d25-9a3f-4dc5-a3f8-68ea17c4bcaa	ed5561a6-e43b-4f70-a186-a34f121b408f
b4122d25-9a3f-4dc5-a3f8-68ea17c4bcaa	4a809901-0b51-442d-b6f0-236f31998ba1
ce84955c-80d1-4819-b8ec-7e54d6152094	5ceb1fc2-e023-4202-8954-ef76c3522dbb
f6135e69-bbff-46f7-ae0e-213ad922fbd3	4a809901-0b51-442d-b6f0-236f31998ba1
f6135e69-bbff-46f7-ae0e-213ad922fbd3	b007b78e-670a-4499-959c-498aa2dc6c28
6bfa124a-1774-49f1-8720-d0c9a174e225	422bbee0-8c19-4568-a2d9-35747d3f1c4b
6bfa124a-1774-49f1-8720-d0c9a174e225	a86189af-86fe-40dd-a851-b76cbcc05e4a
6bfa124a-1774-49f1-8720-d0c9a174e225	92a845dc-a243-4756-8f17-a8de8674d5d3
6bfa124a-1774-49f1-8720-d0c9a174e225	36f3770f-1619-4d34-9133-d57f3f47c88a
6bfa124a-1774-49f1-8720-d0c9a174e225	608ca91a-62cc-4756-b686-5efd3e54e091
6bfa124a-1774-49f1-8720-d0c9a174e225	b02ffd3f-6e14-4d6b-a9ed-82ec2c9c9e95
6bfa124a-1774-49f1-8720-d0c9a174e225	923f38b1-fa51-46a8-9f3f-513463f14c39
6bfa124a-1774-49f1-8720-d0c9a174e225	3bbb1a10-138f-4c61-a83d-312e600ef6d8
6bfa124a-1774-49f1-8720-d0c9a174e225	53ad4741-17f7-4657-a04a-0571f0c40c86
6bfa124a-1774-49f1-8720-d0c9a174e225	b7029340-ee02-4e8b-87c3-d0df4a98d4c2
6bfa124a-1774-49f1-8720-d0c9a174e225	0e47d7c5-a54c-4bd3-a364-87a428b526a2
6bfa124a-1774-49f1-8720-d0c9a174e225	bc52908d-8e53-4cd9-9e51-8d38c080a06b
6bfa124a-1774-49f1-8720-d0c9a174e225	1fd58f71-e1f8-4f3d-8a7b-cc0fab19b2ee
6bfa124a-1774-49f1-8720-d0c9a174e225	427b9e33-0cbf-4c21-95ff-de0948420e9e
6bfa124a-1774-49f1-8720-d0c9a174e225	37515999-93e2-4c57-9224-201349fdd22e
6bfa124a-1774-49f1-8720-d0c9a174e225	5d527ba0-ba02-4551-a958-68df2aabb99e
6bfa124a-1774-49f1-8720-d0c9a174e225	04f12c19-e19d-479f-9cf8-41478ad64d7a
36f3770f-1619-4d34-9133-d57f3f47c88a	37515999-93e2-4c57-9224-201349fdd22e
92a845dc-a243-4756-8f17-a8de8674d5d3	04f12c19-e19d-479f-9cf8-41478ad64d7a
92a845dc-a243-4756-8f17-a8de8674d5d3	427b9e33-0cbf-4c21-95ff-de0948420e9e
a7e79e49-a86a-45e0-8aa3-3cd3ec4d7c1f	26474066-8e0e-4ffd-8882-3a38de4da06c
a7e79e49-a86a-45e0-8aa3-3cd3ec4d7c1f	38a3e485-ddf6-4ab4-94fe-d42f1f5855b0
38a3e485-ddf6-4ab4-94fe-d42f1f5855b0	946769de-22da-4c1e-8c2c-649187dc7503
d0ff4f3c-5f07-422c-a934-aa2927cf5730	5d251638-e88f-4143-ba64-1d25285eaab5
b4122d25-9a3f-4dc5-a3f8-68ea17c4bcaa	b43a400e-bbeb-496d-8836-7d9731500805
6bfa124a-1774-49f1-8720-d0c9a174e225	801bafcd-73f5-492c-aa59-8b354510d3e8
a7e79e49-a86a-45e0-8aa3-3cd3ec4d7c1f	78a51bf4-b969-4b05-b339-bc9cce0d0022
a7e79e49-a86a-45e0-8aa3-3cd3ec4d7c1f	0fd91175-a400-4687-bbfb-ad9b0e397723
\.


--
-- Data for Name: credential; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.credential (id, salt, type, user_id, created_date, user_label, secret_data, credential_data, priority) FROM stdin;
2fd30877-0e50-45a2-9e03-95796776c971	\N	password	ced0ad4b-46de-4b77-b381-c20bafa2a763	1703277713582	\N	{"value":"ejI5MsU1vDUm8vwyWNTTJKwALY6N/YOU8/niAskzKsIrdVm9NbQJZ+sou0AubdFdXqDOAh01AIzL0ua+ysXZ8A==","salt":"dY4LNQ7ybQ8BSobob/6SHg==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
e79dc2c6-ffa6-49bc-be79-4995d4839801	\N	password	3831468b-5f32-4f14-98c6-dace721f46fd	1703292267957	\N	{"value":"4fDG77wTLYdqgDHwKtADWFI3bRxmx/kGCF5kE+r3VXx+4wBpBtOl6jrBkRSXzy6OFBeGTv6zlTpyWBuM5o8n3A==","salt":"tAQn340iW37Q+MZ3JDtADQ==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
60290a1c-e9e5-4659-a9e8-567d3c47231e	\N	password	59c357ec-085c-4df1-a578-16ab398a1e2e	1703292400314	\N	{"value":"dXYNEV1E/A3mS7YURxrOZlWuEzWOxO5qx0YgHfs20Y3KGGPKAgW4mWfFOdm9RJ++kO88YWmHZ7IYTLX2ihz4Vg==","salt":"KGb6ZWWRpmTuEKlgBOC1tQ==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
89247fc9-49bb-48f9-86ea-07fcdb306787	\N	password	bc26c93f-3892-4582-a4cc-ef739142b3c2	1703292943754	\N	{"value":"U+zpLRMPVxMSvRKteKK0fHZH+whC+2pFpF4+XmI0jVI2I5UJDIEkH0gFL2dRXDXPlqh7IjDk1n++Rb4UipcZOQ==","salt":"thxcrwgc/68RFmAKn0mwiQ==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
96a0084e-4bc6-4967-923f-fde1fb3e197f	\N	password	75979798-99e2-4758-8ee1-c4168c50a8f9	1703293270613	\N	{"value":"uAh2DGj/b/ZWEnf0gPkWRco5xwPWLu2jIwd16E5kkoni+/wF0pPyHztbEQtftqsZINYFoGNJrjH8Ymev/OyNUQ==","salt":"4GQAh91Vd9k6pNPEk8c6ww==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
\.


--
-- Data for Name: databasechangelog; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) FROM stdin;
1.0.0.Final-KEYCLOAK-5461	sthorger@redhat.com	META-INF/jpa-changelog-1.0.0.Final.xml	2023-12-22 19:09:37.998837	1	EXECUTED	8:bda77d94bf90182a1e30c24f1c155ec7	createTable tableName=APPLICATION_DEFAULT_ROLES; createTable tableName=CLIENT; createTable tableName=CLIENT_SESSION; createTable tableName=CLIENT_SESSION_ROLE; createTable tableName=COMPOSITE_ROLE; createTable tableName=CREDENTIAL; createTable tab...		\N	4.8.0	\N	\N	3272177339
1.0.0.Final-KEYCLOAK-5461	sthorger@redhat.com	META-INF/db2-jpa-changelog-1.0.0.Final.xml	2023-12-22 19:09:38.011925	2	MARK_RAN	8:1ecb330f30986693d1cba9ab579fa219	createTable tableName=APPLICATION_DEFAULT_ROLES; createTable tableName=CLIENT; createTable tableName=CLIENT_SESSION; createTable tableName=CLIENT_SESSION_ROLE; createTable tableName=COMPOSITE_ROLE; createTable tableName=CREDENTIAL; createTable tab...		\N	4.8.0	\N	\N	3272177339
1.1.0.Beta1	sthorger@redhat.com	META-INF/jpa-changelog-1.1.0.Beta1.xml	2023-12-22 19:09:38.055161	3	EXECUTED	8:cb7ace19bc6d959f305605d255d4c843	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=CLIENT_ATTRIBUTES; createTable tableName=CLIENT_SESSION_NOTE; createTable tableName=APP_NODE_REGISTRATIONS; addColumn table...		\N	4.8.0	\N	\N	3272177339
1.1.0.Final	sthorger@redhat.com	META-INF/jpa-changelog-1.1.0.Final.xml	2023-12-22 19:09:38.06247	4	EXECUTED	8:80230013e961310e6872e871be424a63	renameColumn newColumnName=EVENT_TIME, oldColumnName=TIME, tableName=EVENT_ENTITY		\N	4.8.0	\N	\N	3272177339
1.2.0.Beta1	psilva@redhat.com	META-INF/jpa-changelog-1.2.0.Beta1.xml	2023-12-22 19:09:38.170654	5	EXECUTED	8:67f4c20929126adc0c8e9bf48279d244	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=PROTOCOL_MAPPER; createTable tableName=PROTOCOL_MAPPER_CONFIG; createTable tableName=...		\N	4.8.0	\N	\N	3272177339
1.2.0.Beta1	psilva@redhat.com	META-INF/db2-jpa-changelog-1.2.0.Beta1.xml	2023-12-22 19:09:38.174017	6	MARK_RAN	8:7311018b0b8179ce14628ab412bb6783	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=PROTOCOL_MAPPER; createTable tableName=PROTOCOL_MAPPER_CONFIG; createTable tableName=...		\N	4.8.0	\N	\N	3272177339
1.2.0.RC1	bburke@redhat.com	META-INF/jpa-changelog-1.2.0.CR1.xml	2023-12-22 19:09:38.269118	7	EXECUTED	8:037ba1216c3640f8785ee6b8e7c8e3c1	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=MIGRATION_MODEL; createTable tableName=IDENTITY_P...		\N	4.8.0	\N	\N	3272177339
1.2.0.RC1	bburke@redhat.com	META-INF/db2-jpa-changelog-1.2.0.CR1.xml	2023-12-22 19:09:38.272018	8	MARK_RAN	8:7fe6ffe4af4df289b3157de32c624263	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=MIGRATION_MODEL; createTable tableName=IDENTITY_P...		\N	4.8.0	\N	\N	3272177339
1.2.0.Final	keycloak	META-INF/jpa-changelog-1.2.0.Final.xml	2023-12-22 19:09:38.279286	9	EXECUTED	8:9c136bc3187083a98745c7d03bc8a303	update tableName=CLIENT; update tableName=CLIENT; update tableName=CLIENT		\N	4.8.0	\N	\N	3272177339
1.3.0	bburke@redhat.com	META-INF/jpa-changelog-1.3.0.xml	2023-12-22 19:09:38.38811	10	EXECUTED	8:b5f09474dca81fb56a97cf5b6553d331	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=ADMI...		\N	4.8.0	\N	\N	3272177339
1.4.0	bburke@redhat.com	META-INF/jpa-changelog-1.4.0.xml	2023-12-22 19:09:38.45884	11	EXECUTED	8:ca924f31bd2a3b219fdcfe78c82dacf4	delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...		\N	4.8.0	\N	\N	3272177339
1.4.0	bburke@redhat.com	META-INF/db2-jpa-changelog-1.4.0.xml	2023-12-22 19:09:38.462399	12	MARK_RAN	8:8acad7483e106416bcfa6f3b824a16cd	delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...		\N	4.8.0	\N	\N	3272177339
1.5.0	bburke@redhat.com	META-INF/jpa-changelog-1.5.0.xml	2023-12-22 19:09:38.484677	13	EXECUTED	8:9b1266d17f4f87c78226f5055408fd5e	delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...		\N	4.8.0	\N	\N	3272177339
1.6.1_from15	mposolda@redhat.com	META-INF/jpa-changelog-1.6.1.xml	2023-12-22 19:09:38.50708	14	EXECUTED	8:d80ec4ab6dbfe573550ff72396c7e910	addColumn tableName=REALM; addColumn tableName=KEYCLOAK_ROLE; addColumn tableName=CLIENT; createTable tableName=OFFLINE_USER_SESSION; createTable tableName=OFFLINE_CLIENT_SESSION; addPrimaryKey constraintName=CONSTRAINT_OFFL_US_SES_PK2, tableName=...		\N	4.8.0	\N	\N	3272177339
1.6.1_from16-pre	mposolda@redhat.com	META-INF/jpa-changelog-1.6.1.xml	2023-12-22 19:09:38.514181	15	MARK_RAN	8:d86eb172171e7c20b9c849b584d147b2	delete tableName=OFFLINE_CLIENT_SESSION; delete tableName=OFFLINE_USER_SESSION		\N	4.8.0	\N	\N	3272177339
1.6.1_from16	mposolda@redhat.com	META-INF/jpa-changelog-1.6.1.xml	2023-12-22 19:09:38.518672	16	MARK_RAN	8:5735f46f0fa60689deb0ecdc2a0dea22	dropPrimaryKey constraintName=CONSTRAINT_OFFLINE_US_SES_PK, tableName=OFFLINE_USER_SESSION; dropPrimaryKey constraintName=CONSTRAINT_OFFLINE_CL_SES_PK, tableName=OFFLINE_CLIENT_SESSION; addColumn tableName=OFFLINE_USER_SESSION; update tableName=OF...		\N	4.8.0	\N	\N	3272177339
1.6.1	mposolda@redhat.com	META-INF/jpa-changelog-1.6.1.xml	2023-12-22 19:09:38.523627	17	EXECUTED	8:d41d8cd98f00b204e9800998ecf8427e	empty		\N	4.8.0	\N	\N	3272177339
1.7.0	bburke@redhat.com	META-INF/jpa-changelog-1.7.0.xml	2023-12-22 19:09:38.687631	18	EXECUTED	8:5c1a8fd2014ac7fc43b90a700f117b23	createTable tableName=KEYCLOAK_GROUP; createTable tableName=GROUP_ROLE_MAPPING; createTable tableName=GROUP_ATTRIBUTE; createTable tableName=USER_GROUP_MEMBERSHIP; createTable tableName=REALM_DEFAULT_GROUPS; addColumn tableName=IDENTITY_PROVIDER; ...		\N	4.8.0	\N	\N	3272177339
1.8.0	mposolda@redhat.com	META-INF/jpa-changelog-1.8.0.xml	2023-12-22 19:09:38.783443	19	EXECUTED	8:1f6c2c2dfc362aff4ed75b3f0ef6b331	addColumn tableName=IDENTITY_PROVIDER; createTable tableName=CLIENT_TEMPLATE; createTable tableName=CLIENT_TEMPLATE_ATTRIBUTES; createTable tableName=TEMPLATE_SCOPE_MAPPING; dropNotNullConstraint columnName=CLIENT_ID, tableName=PROTOCOL_MAPPER; ad...		\N	4.8.0	\N	\N	3272177339
1.8.0-2	keycloak	META-INF/jpa-changelog-1.8.0.xml	2023-12-22 19:09:38.792653	20	EXECUTED	8:dee9246280915712591f83a127665107	dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; update tableName=CREDENTIAL		\N	4.8.0	\N	\N	3272177339
authz-3.4.0.CR1-resource-server-pk-change-part1	glavoie@gmail.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2023-12-22 19:09:39.779568	45	EXECUTED	8:a164ae073c56ffdbc98a615493609a52	addColumn tableName=RESOURCE_SERVER_POLICY; addColumn tableName=RESOURCE_SERVER_RESOURCE; addColumn tableName=RESOURCE_SERVER_SCOPE		\N	4.8.0	\N	\N	3272177339
1.8.0	mposolda@redhat.com	META-INF/db2-jpa-changelog-1.8.0.xml	2023-12-22 19:09:38.796196	21	MARK_RAN	8:9eb2ee1fa8ad1c5e426421a6f8fdfa6a	addColumn tableName=IDENTITY_PROVIDER; createTable tableName=CLIENT_TEMPLATE; createTable tableName=CLIENT_TEMPLATE_ATTRIBUTES; createTable tableName=TEMPLATE_SCOPE_MAPPING; dropNotNullConstraint columnName=CLIENT_ID, tableName=PROTOCOL_MAPPER; ad...		\N	4.8.0	\N	\N	3272177339
1.8.0-2	keycloak	META-INF/db2-jpa-changelog-1.8.0.xml	2023-12-22 19:09:38.799615	22	MARK_RAN	8:dee9246280915712591f83a127665107	dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; update tableName=CREDENTIAL		\N	4.8.0	\N	\N	3272177339
1.9.0	mposolda@redhat.com	META-INF/jpa-changelog-1.9.0.xml	2023-12-22 19:09:38.889472	23	EXECUTED	8:d9fa18ffa355320395b86270680dd4fe	update tableName=REALM; update tableName=REALM; update tableName=REALM; update tableName=REALM; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=REALM; update tableName=REALM; customChange; dr...		\N	4.8.0	\N	\N	3272177339
1.9.1	keycloak	META-INF/jpa-changelog-1.9.1.xml	2023-12-22 19:09:38.905209	24	EXECUTED	8:90cff506fedb06141ffc1c71c4a1214c	modifyDataType columnName=PRIVATE_KEY, tableName=REALM; modifyDataType columnName=PUBLIC_KEY, tableName=REALM; modifyDataType columnName=CERTIFICATE, tableName=REALM		\N	4.8.0	\N	\N	3272177339
1.9.1	keycloak	META-INF/db2-jpa-changelog-1.9.1.xml	2023-12-22 19:09:38.907546	25	MARK_RAN	8:11a788aed4961d6d29c427c063af828c	modifyDataType columnName=PRIVATE_KEY, tableName=REALM; modifyDataType columnName=CERTIFICATE, tableName=REALM		\N	4.8.0	\N	\N	3272177339
1.9.2	keycloak	META-INF/jpa-changelog-1.9.2.xml	2023-12-22 19:09:39.069401	26	EXECUTED	8:a4218e51e1faf380518cce2af5d39b43	createIndex indexName=IDX_USER_EMAIL, tableName=USER_ENTITY; createIndex indexName=IDX_USER_ROLE_MAPPING, tableName=USER_ROLE_MAPPING; createIndex indexName=IDX_USER_GROUP_MAPPING, tableName=USER_GROUP_MEMBERSHIP; createIndex indexName=IDX_USER_CO...		\N	4.8.0	\N	\N	3272177339
authz-2.0.0	psilva@redhat.com	META-INF/jpa-changelog-authz-2.0.0.xml	2023-12-22 19:09:39.155842	27	EXECUTED	8:d9e9a1bfaa644da9952456050f07bbdc	createTable tableName=RESOURCE_SERVER; addPrimaryKey constraintName=CONSTRAINT_FARS, tableName=RESOURCE_SERVER; addUniqueConstraint constraintName=UK_AU8TT6T700S9V50BU18WS5HA6, tableName=RESOURCE_SERVER; createTable tableName=RESOURCE_SERVER_RESOU...		\N	4.8.0	\N	\N	3272177339
authz-2.5.1	psilva@redhat.com	META-INF/jpa-changelog-authz-2.5.1.xml	2023-12-22 19:09:39.158278	28	EXECUTED	8:d1bf991a6163c0acbfe664b615314505	update tableName=RESOURCE_SERVER_POLICY		\N	4.8.0	\N	\N	3272177339
2.1.0-KEYCLOAK-5461	bburke@redhat.com	META-INF/jpa-changelog-2.1.0.xml	2023-12-22 19:09:39.281945	29	EXECUTED	8:88a743a1e87ec5e30bf603da68058a8c	createTable tableName=BROKER_LINK; createTable tableName=FED_USER_ATTRIBUTE; createTable tableName=FED_USER_CONSENT; createTable tableName=FED_USER_CONSENT_ROLE; createTable tableName=FED_USER_CONSENT_PROT_MAPPER; createTable tableName=FED_USER_CR...		\N	4.8.0	\N	\N	3272177339
2.2.0	bburke@redhat.com	META-INF/jpa-changelog-2.2.0.xml	2023-12-22 19:09:39.311163	30	EXECUTED	8:c5517863c875d325dea463d00ec26d7a	addColumn tableName=ADMIN_EVENT_ENTITY; createTable tableName=CREDENTIAL_ATTRIBUTE; createTable tableName=FED_CREDENTIAL_ATTRIBUTE; modifyDataType columnName=VALUE, tableName=CREDENTIAL; addForeignKeyConstraint baseTableName=FED_CREDENTIAL_ATTRIBU...		\N	4.8.0	\N	\N	3272177339
2.3.0	bburke@redhat.com	META-INF/jpa-changelog-2.3.0.xml	2023-12-22 19:09:39.340998	31	EXECUTED	8:ada8b4833b74a498f376d7136bc7d327	createTable tableName=FEDERATED_USER; addPrimaryKey constraintName=CONSTR_FEDERATED_USER, tableName=FEDERATED_USER; dropDefaultValue columnName=TOTP, tableName=USER_ENTITY; dropColumn columnName=TOTP, tableName=USER_ENTITY; addColumn tableName=IDE...		\N	4.8.0	\N	\N	3272177339
2.4.0	bburke@redhat.com	META-INF/jpa-changelog-2.4.0.xml	2023-12-22 19:09:39.349151	32	EXECUTED	8:b9b73c8ea7299457f99fcbb825c263ba	customChange		\N	4.8.0	\N	\N	3272177339
2.5.0	bburke@redhat.com	META-INF/jpa-changelog-2.5.0.xml	2023-12-22 19:09:39.357364	33	EXECUTED	8:07724333e625ccfcfc5adc63d57314f3	customChange; modifyDataType columnName=USER_ID, tableName=OFFLINE_USER_SESSION		\N	4.8.0	\N	\N	3272177339
2.5.0-unicode-oracle	hmlnarik@redhat.com	META-INF/jpa-changelog-2.5.0.xml	2023-12-22 19:09:39.361259	34	MARK_RAN	8:8b6fd445958882efe55deb26fc541a7b	modifyDataType columnName=DESCRIPTION, tableName=AUTHENTICATION_FLOW; modifyDataType columnName=DESCRIPTION, tableName=CLIENT_TEMPLATE; modifyDataType columnName=DESCRIPTION, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=DESCRIPTION,...		\N	4.8.0	\N	\N	3272177339
2.5.0-unicode-other-dbs	hmlnarik@redhat.com	META-INF/jpa-changelog-2.5.0.xml	2023-12-22 19:09:39.412544	35	EXECUTED	8:29b29cfebfd12600897680147277a9d7	modifyDataType columnName=DESCRIPTION, tableName=AUTHENTICATION_FLOW; modifyDataType columnName=DESCRIPTION, tableName=CLIENT_TEMPLATE; modifyDataType columnName=DESCRIPTION, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=DESCRIPTION,...		\N	4.8.0	\N	\N	3272177339
2.5.0-duplicate-email-support	slawomir@dabek.name	META-INF/jpa-changelog-2.5.0.xml	2023-12-22 19:09:39.416558	36	EXECUTED	8:73ad77ca8fd0410c7f9f15a471fa52bc	addColumn tableName=REALM		\N	4.8.0	\N	\N	3272177339
2.5.0-unique-group-names	hmlnarik@redhat.com	META-INF/jpa-changelog-2.5.0.xml	2023-12-22 19:09:39.423112	37	EXECUTED	8:64f27a6fdcad57f6f9153210f2ec1bdb	addUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP		\N	4.8.0	\N	\N	3272177339
2.5.1	bburke@redhat.com	META-INF/jpa-changelog-2.5.1.xml	2023-12-22 19:09:39.426076	38	EXECUTED	8:27180251182e6c31846c2ddab4bc5781	addColumn tableName=FED_USER_CONSENT		\N	4.8.0	\N	\N	3272177339
3.0.0	bburke@redhat.com	META-INF/jpa-changelog-3.0.0.xml	2023-12-22 19:09:39.428868	39	EXECUTED	8:d56f201bfcfa7a1413eb3e9bc02978f9	addColumn tableName=IDENTITY_PROVIDER		\N	4.8.0	\N	\N	3272177339
3.2.0-fix	keycloak	META-INF/jpa-changelog-3.2.0.xml	2023-12-22 19:09:39.429732	40	MARK_RAN	8:91f5522bf6afdc2077dfab57fbd3455c	addNotNullConstraint columnName=REALM_ID, tableName=CLIENT_INITIAL_ACCESS		\N	4.8.0	\N	\N	3272177339
3.2.0-fix-with-keycloak-5416	keycloak	META-INF/jpa-changelog-3.2.0.xml	2023-12-22 19:09:39.430874	41	MARK_RAN	8:0f01b554f256c22caeb7d8aee3a1cdc8	dropIndex indexName=IDX_CLIENT_INIT_ACC_REALM, tableName=CLIENT_INITIAL_ACCESS; addNotNullConstraint columnName=REALM_ID, tableName=CLIENT_INITIAL_ACCESS; createIndex indexName=IDX_CLIENT_INIT_ACC_REALM, tableName=CLIENT_INITIAL_ACCESS		\N	4.8.0	\N	\N	3272177339
3.2.0-fix-offline-sessions	hmlnarik	META-INF/jpa-changelog-3.2.0.xml	2023-12-22 19:09:39.434488	42	EXECUTED	8:ab91cf9cee415867ade0e2df9651a947	customChange		\N	4.8.0	\N	\N	3272177339
3.2.0-fixed	keycloak	META-INF/jpa-changelog-3.2.0.xml	2023-12-22 19:09:39.774486	43	EXECUTED	8:ceac9b1889e97d602caf373eadb0d4b7	addColumn tableName=REALM; dropPrimaryKey constraintName=CONSTRAINT_OFFL_CL_SES_PK2, tableName=OFFLINE_CLIENT_SESSION; dropColumn columnName=CLIENT_SESSION_ID, tableName=OFFLINE_CLIENT_SESSION; addPrimaryKey constraintName=CONSTRAINT_OFFL_CL_SES_P...		\N	4.8.0	\N	\N	3272177339
3.3.0	keycloak	META-INF/jpa-changelog-3.3.0.xml	2023-12-22 19:09:39.777186	44	EXECUTED	8:84b986e628fe8f7fd8fd3c275c5259f2	addColumn tableName=USER_ENTITY		\N	4.8.0	\N	\N	3272177339
authz-3.4.0.CR1-resource-server-pk-change-part2-KEYCLOAK-6095	hmlnarik@redhat.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2023-12-22 19:09:39.781921	46	EXECUTED	8:70a2b4f1f4bd4dbf487114bdb1810e64	customChange		\N	4.8.0	\N	\N	3272177339
authz-3.4.0.CR1-resource-server-pk-change-part3-fixed	glavoie@gmail.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2023-12-22 19:09:39.782838	47	MARK_RAN	8:7be68b71d2f5b94b8df2e824f2860fa2	dropIndex indexName=IDX_RES_SERV_POL_RES_SERV, tableName=RESOURCE_SERVER_POLICY; dropIndex indexName=IDX_RES_SRV_RES_RES_SRV, tableName=RESOURCE_SERVER_RESOURCE; dropIndex indexName=IDX_RES_SRV_SCOPE_RES_SRV, tableName=RESOURCE_SERVER_SCOPE		\N	4.8.0	\N	\N	3272177339
authz-3.4.0.CR1-resource-server-pk-change-part3-fixed-nodropindex	glavoie@gmail.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2023-12-22 19:09:39.811819	48	EXECUTED	8:bab7c631093c3861d6cf6144cd944982	addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, tableName=RESOURCE_SERVER_POLICY; addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, tableName=RESOURCE_SERVER_RESOURCE; addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, ...		\N	4.8.0	\N	\N	3272177339
authn-3.4.0.CR1-refresh-token-max-reuse	glavoie@gmail.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2023-12-22 19:09:39.813454	49	EXECUTED	8:fa809ac11877d74d76fe40869916daad	addColumn tableName=REALM		\N	4.8.0	\N	\N	3272177339
3.4.0	keycloak	META-INF/jpa-changelog-3.4.0.xml	2023-12-22 19:09:39.833381	50	EXECUTED	8:fac23540a40208f5f5e326f6ceb4d291	addPrimaryKey constraintName=CONSTRAINT_REALM_DEFAULT_ROLES, tableName=REALM_DEFAULT_ROLES; addPrimaryKey constraintName=CONSTRAINT_COMPOSITE_ROLE, tableName=COMPOSITE_ROLE; addPrimaryKey constraintName=CONSTR_REALM_DEFAULT_GROUPS, tableName=REALM...		\N	4.8.0	\N	\N	3272177339
3.4.0-KEYCLOAK-5230	hmlnarik@redhat.com	META-INF/jpa-changelog-3.4.0.xml	2023-12-22 19:09:39.893641	51	EXECUTED	8:2612d1b8a97e2b5588c346e817307593	createIndex indexName=IDX_FU_ATTRIBUTE, tableName=FED_USER_ATTRIBUTE; createIndex indexName=IDX_FU_CONSENT, tableName=FED_USER_CONSENT; createIndex indexName=IDX_FU_CONSENT_RU, tableName=FED_USER_CONSENT; createIndex indexName=IDX_FU_CREDENTIAL, t...		\N	4.8.0	\N	\N	3272177339
3.4.1	psilva@redhat.com	META-INF/jpa-changelog-3.4.1.xml	2023-12-22 19:09:39.894875	52	EXECUTED	8:9842f155c5db2206c88bcb5d1046e941	modifyDataType columnName=VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.8.0	\N	\N	3272177339
3.4.2	keycloak	META-INF/jpa-changelog-3.4.2.xml	2023-12-22 19:09:39.895954	53	EXECUTED	8:2e12e06e45498406db72d5b3da5bbc76	update tableName=REALM		\N	4.8.0	\N	\N	3272177339
3.4.2-KEYCLOAK-5172	mkanis@redhat.com	META-INF/jpa-changelog-3.4.2.xml	2023-12-22 19:09:39.896945	54	EXECUTED	8:33560e7c7989250c40da3abdabdc75a4	update tableName=CLIENT		\N	4.8.0	\N	\N	3272177339
4.0.0-KEYCLOAK-6335	bburke@redhat.com	META-INF/jpa-changelog-4.0.0.xml	2023-12-22 19:09:39.899653	55	EXECUTED	8:87a8d8542046817a9107c7eb9cbad1cd	createTable tableName=CLIENT_AUTH_FLOW_BINDINGS; addPrimaryKey constraintName=C_CLI_FLOW_BIND, tableName=CLIENT_AUTH_FLOW_BINDINGS		\N	4.8.0	\N	\N	3272177339
4.0.0-CLEANUP-UNUSED-TABLE	bburke@redhat.com	META-INF/jpa-changelog-4.0.0.xml	2023-12-22 19:09:39.901442	56	EXECUTED	8:3ea08490a70215ed0088c273d776311e	dropTable tableName=CLIENT_IDENTITY_PROV_MAPPING		\N	4.8.0	\N	\N	3272177339
4.0.0-KEYCLOAK-6228	bburke@redhat.com	META-INF/jpa-changelog-4.0.0.xml	2023-12-22 19:09:39.913878	57	EXECUTED	8:2d56697c8723d4592ab608ce14b6ed68	dropUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHOGM8UEWRT, tableName=USER_CONSENT; dropNotNullConstraint columnName=CLIENT_ID, tableName=USER_CONSENT; addColumn tableName=USER_CONSENT; addUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHO...		\N	4.8.0	\N	\N	3272177339
4.0.0-KEYCLOAK-5579-fixed	mposolda@redhat.com	META-INF/jpa-changelog-4.0.0.xml	2023-12-22 19:09:40.014787	58	EXECUTED	8:3e423e249f6068ea2bbe48bf907f9d86	dropForeignKeyConstraint baseTableName=CLIENT_TEMPLATE_ATTRIBUTES, constraintName=FK_CL_TEMPL_ATTR_TEMPL; renameTable newTableName=CLIENT_SCOPE_ATTRIBUTES, oldTableName=CLIENT_TEMPLATE_ATTRIBUTES; renameColumn newColumnName=SCOPE_ID, oldColumnName...		\N	4.8.0	\N	\N	3272177339
authz-4.0.0.CR1	psilva@redhat.com	META-INF/jpa-changelog-authz-4.0.0.CR1.xml	2023-12-22 19:09:40.026175	59	EXECUTED	8:15cabee5e5df0ff099510a0fc03e4103	createTable tableName=RESOURCE_SERVER_PERM_TICKET; addPrimaryKey constraintName=CONSTRAINT_FAPMT, tableName=RESOURCE_SERVER_PERM_TICKET; addForeignKeyConstraint baseTableName=RESOURCE_SERVER_PERM_TICKET, constraintName=FK_FRSRHO213XCX4WNKOG82SSPMT...		\N	4.8.0	\N	\N	3272177339
authz-4.0.0.Beta3	psilva@redhat.com	META-INF/jpa-changelog-authz-4.0.0.Beta3.xml	2023-12-22 19:09:40.028364	60	EXECUTED	8:4b80200af916ac54d2ffbfc47918ab0e	addColumn tableName=RESOURCE_SERVER_POLICY; addColumn tableName=RESOURCE_SERVER_PERM_TICKET; addForeignKeyConstraint baseTableName=RESOURCE_SERVER_PERM_TICKET, constraintName=FK_FRSRPO2128CX4WNKOG82SSRFY, referencedTableName=RESOURCE_SERVER_POLICY		\N	4.8.0	\N	\N	3272177339
authz-4.2.0.Final	mhajas@redhat.com	META-INF/jpa-changelog-authz-4.2.0.Final.xml	2023-12-22 19:09:40.031366	61	EXECUTED	8:66564cd5e168045d52252c5027485bbb	createTable tableName=RESOURCE_URIS; addForeignKeyConstraint baseTableName=RESOURCE_URIS, constraintName=FK_RESOURCE_SERVER_URIS, referencedTableName=RESOURCE_SERVER_RESOURCE; customChange; dropColumn columnName=URI, tableName=RESOURCE_SERVER_RESO...		\N	4.8.0	\N	\N	3272177339
authz-4.2.0.Final-KEYCLOAK-9944	hmlnarik@redhat.com	META-INF/jpa-changelog-authz-4.2.0.Final.xml	2023-12-22 19:09:40.033386	62	EXECUTED	8:1c7064fafb030222be2bd16ccf690f6f	addPrimaryKey constraintName=CONSTRAINT_RESOUR_URIS_PK, tableName=RESOURCE_URIS		\N	4.8.0	\N	\N	3272177339
4.2.0-KEYCLOAK-6313	wadahiro@gmail.com	META-INF/jpa-changelog-4.2.0.xml	2023-12-22 19:09:40.034548	63	EXECUTED	8:2de18a0dce10cdda5c7e65c9b719b6e5	addColumn tableName=REQUIRED_ACTION_PROVIDER		\N	4.8.0	\N	\N	3272177339
4.3.0-KEYCLOAK-7984	wadahiro@gmail.com	META-INF/jpa-changelog-4.3.0.xml	2023-12-22 19:09:40.035666	64	EXECUTED	8:03e413dd182dcbd5c57e41c34d0ef682	update tableName=REQUIRED_ACTION_PROVIDER		\N	4.8.0	\N	\N	3272177339
4.6.0-KEYCLOAK-7950	psilva@redhat.com	META-INF/jpa-changelog-4.6.0.xml	2023-12-22 19:09:40.036676	65	EXECUTED	8:d27b42bb2571c18fbe3fe4e4fb7582a7	update tableName=RESOURCE_SERVER_RESOURCE		\N	4.8.0	\N	\N	3272177339
4.6.0-KEYCLOAK-8377	keycloak	META-INF/jpa-changelog-4.6.0.xml	2023-12-22 19:09:40.04821	66	EXECUTED	8:698baf84d9fd0027e9192717c2154fb8	createTable tableName=ROLE_ATTRIBUTE; addPrimaryKey constraintName=CONSTRAINT_ROLE_ATTRIBUTE_PK, tableName=ROLE_ATTRIBUTE; addForeignKeyConstraint baseTableName=ROLE_ATTRIBUTE, constraintName=FK_ROLE_ATTRIBUTE_ID, referencedTableName=KEYCLOAK_ROLE...		\N	4.8.0	\N	\N	3272177339
4.6.0-KEYCLOAK-8555	gideonray@gmail.com	META-INF/jpa-changelog-4.6.0.xml	2023-12-22 19:09:40.054502	67	EXECUTED	8:ced8822edf0f75ef26eb51582f9a821a	createIndex indexName=IDX_COMPONENT_PROVIDER_TYPE, tableName=COMPONENT		\N	4.8.0	\N	\N	3272177339
4.7.0-KEYCLOAK-1267	sguilhen@redhat.com	META-INF/jpa-changelog-4.7.0.xml	2023-12-22 19:09:40.056167	68	EXECUTED	8:f0abba004cf429e8afc43056df06487d	addColumn tableName=REALM		\N	4.8.0	\N	\N	3272177339
4.7.0-KEYCLOAK-7275	keycloak	META-INF/jpa-changelog-4.7.0.xml	2023-12-22 19:09:40.064647	69	EXECUTED	8:6662f8b0b611caa359fcf13bf63b4e24	renameColumn newColumnName=CREATED_ON, oldColumnName=LAST_SESSION_REFRESH, tableName=OFFLINE_USER_SESSION; addNotNullConstraint columnName=CREATED_ON, tableName=OFFLINE_USER_SESSION; addColumn tableName=OFFLINE_USER_SESSION; customChange; createIn...		\N	4.8.0	\N	\N	3272177339
4.8.0-KEYCLOAK-8835	sguilhen@redhat.com	META-INF/jpa-changelog-4.8.0.xml	2023-12-22 19:09:40.066855	70	EXECUTED	8:9e6b8009560f684250bdbdf97670d39e	addNotNullConstraint columnName=SSO_MAX_LIFESPAN_REMEMBER_ME, tableName=REALM; addNotNullConstraint columnName=SSO_IDLE_TIMEOUT_REMEMBER_ME, tableName=REALM		\N	4.8.0	\N	\N	3272177339
authz-7.0.0-KEYCLOAK-10443	psilva@redhat.com	META-INF/jpa-changelog-authz-7.0.0.xml	2023-12-22 19:09:40.068307	71	EXECUTED	8:4223f561f3b8dc655846562b57bb502e	addColumn tableName=RESOURCE_SERVER		\N	4.8.0	\N	\N	3272177339
8.0.0-adding-credential-columns	keycloak	META-INF/jpa-changelog-8.0.0.xml	2023-12-22 19:09:40.070513	72	EXECUTED	8:215a31c398b363ce383a2b301202f29e	addColumn tableName=CREDENTIAL; addColumn tableName=FED_USER_CREDENTIAL		\N	4.8.0	\N	\N	3272177339
8.0.0-updating-credential-data-not-oracle-fixed	keycloak	META-INF/jpa-changelog-8.0.0.xml	2023-12-22 19:09:40.073032	73	EXECUTED	8:83f7a671792ca98b3cbd3a1a34862d3d	update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL		\N	4.8.0	\N	\N	3272177339
8.0.0-updating-credential-data-oracle-fixed	keycloak	META-INF/jpa-changelog-8.0.0.xml	2023-12-22 19:09:40.073714	74	MARK_RAN	8:f58ad148698cf30707a6efbdf8061aa7	update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL		\N	4.8.0	\N	\N	3272177339
8.0.0-credential-cleanup-fixed	keycloak	META-INF/jpa-changelog-8.0.0.xml	2023-12-22 19:09:40.081207	75	EXECUTED	8:79e4fd6c6442980e58d52ffc3ee7b19c	dropDefaultValue columnName=COUNTER, tableName=CREDENTIAL; dropDefaultValue columnName=DIGITS, tableName=CREDENTIAL; dropDefaultValue columnName=PERIOD, tableName=CREDENTIAL; dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; dropColumn ...		\N	4.8.0	\N	\N	3272177339
8.0.0-resource-tag-support	keycloak	META-INF/jpa-changelog-8.0.0.xml	2023-12-22 19:09:40.088467	76	EXECUTED	8:87af6a1e6d241ca4b15801d1f86a297d	addColumn tableName=MIGRATION_MODEL; createIndex indexName=IDX_UPDATE_TIME, tableName=MIGRATION_MODEL		\N	4.8.0	\N	\N	3272177339
9.0.0-always-display-client	keycloak	META-INF/jpa-changelog-9.0.0.xml	2023-12-22 19:09:40.089763	77	EXECUTED	8:b44f8d9b7b6ea455305a6d72a200ed15	addColumn tableName=CLIENT		\N	4.8.0	\N	\N	3272177339
9.0.0-drop-constraints-for-column-increase	keycloak	META-INF/jpa-changelog-9.0.0.xml	2023-12-22 19:09:40.090424	78	MARK_RAN	8:2d8ed5aaaeffd0cb004c046b4a903ac5	dropUniqueConstraint constraintName=UK_FRSR6T700S9V50BU18WS5PMT, tableName=RESOURCE_SERVER_PERM_TICKET; dropUniqueConstraint constraintName=UK_FRSR6T700S9V50BU18WS5HA6, tableName=RESOURCE_SERVER_RESOURCE; dropPrimaryKey constraintName=CONSTRAINT_O...		\N	4.8.0	\N	\N	3272177339
9.0.0-increase-column-size-federated-fk	keycloak	META-INF/jpa-changelog-9.0.0.xml	2023-12-22 19:09:40.097088	79	EXECUTED	8:e290c01fcbc275326c511633f6e2acde	modifyDataType columnName=CLIENT_ID, tableName=FED_USER_CONSENT; modifyDataType columnName=CLIENT_REALM_CONSTRAINT, tableName=KEYCLOAK_ROLE; modifyDataType columnName=OWNER, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=CLIENT_ID, ta...		\N	4.8.0	\N	\N	3272177339
9.0.0-recreate-constraints-after-column-increase	keycloak	META-INF/jpa-changelog-9.0.0.xml	2023-12-22 19:09:40.098114	80	MARK_RAN	8:c9db8784c33cea210872ac2d805439f8	addNotNullConstraint columnName=CLIENT_ID, tableName=OFFLINE_CLIENT_SESSION; addNotNullConstraint columnName=OWNER, tableName=RESOURCE_SERVER_PERM_TICKET; addNotNullConstraint columnName=REQUESTER, tableName=RESOURCE_SERVER_PERM_TICKET; addNotNull...		\N	4.8.0	\N	\N	3272177339
9.0.1-add-index-to-client.client_id	keycloak	META-INF/jpa-changelog-9.0.1.xml	2023-12-22 19:09:40.115052	81	EXECUTED	8:95b676ce8fc546a1fcfb4c92fae4add5	createIndex indexName=IDX_CLIENT_ID, tableName=CLIENT		\N	4.8.0	\N	\N	3272177339
9.0.1-KEYCLOAK-12579-drop-constraints	keycloak	META-INF/jpa-changelog-9.0.1.xml	2023-12-22 19:09:40.116425	82	MARK_RAN	8:38a6b2a41f5651018b1aca93a41401e5	dropUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP		\N	4.8.0	\N	\N	3272177339
9.0.1-KEYCLOAK-12579-add-not-null-constraint	keycloak	META-INF/jpa-changelog-9.0.1.xml	2023-12-22 19:09:40.118862	83	EXECUTED	8:3fb99bcad86a0229783123ac52f7609c	addNotNullConstraint columnName=PARENT_GROUP, tableName=KEYCLOAK_GROUP		\N	4.8.0	\N	\N	3272177339
9.0.1-KEYCLOAK-12579-recreate-constraints	keycloak	META-INF/jpa-changelog-9.0.1.xml	2023-12-22 19:09:40.119707	84	MARK_RAN	8:64f27a6fdcad57f6f9153210f2ec1bdb	addUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP		\N	4.8.0	\N	\N	3272177339
9.0.1-add-index-to-events	keycloak	META-INF/jpa-changelog-9.0.1.xml	2023-12-22 19:09:40.128456	85	EXECUTED	8:ab4f863f39adafd4c862f7ec01890abc	createIndex indexName=IDX_EVENT_TIME, tableName=EVENT_ENTITY		\N	4.8.0	\N	\N	3272177339
map-remove-ri	keycloak	META-INF/jpa-changelog-11.0.0.xml	2023-12-22 19:09:40.130472	86	EXECUTED	8:13c419a0eb336e91ee3a3bf8fda6e2a7	dropForeignKeyConstraint baseTableName=REALM, constraintName=FK_TRAF444KK6QRKMS7N56AIWQ5Y; dropForeignKeyConstraint baseTableName=KEYCLOAK_ROLE, constraintName=FK_KJHO5LE2C0RAL09FL8CM9WFW9		\N	4.8.0	\N	\N	3272177339
map-remove-ri	keycloak	META-INF/jpa-changelog-12.0.0.xml	2023-12-22 19:09:40.133574	87	EXECUTED	8:e3fb1e698e0471487f51af1ed80fe3ac	dropForeignKeyConstraint baseTableName=REALM_DEFAULT_GROUPS, constraintName=FK_DEF_GROUPS_GROUP; dropForeignKeyConstraint baseTableName=REALM_DEFAULT_ROLES, constraintName=FK_H4WPD7W4HSOOLNI3H0SW7BTJE; dropForeignKeyConstraint baseTableName=CLIENT...		\N	4.8.0	\N	\N	3272177339
12.1.0-add-realm-localization-table	keycloak	META-INF/jpa-changelog-12.0.0.xml	2023-12-22 19:09:40.137117	88	EXECUTED	8:babadb686aab7b56562817e60bf0abd0	createTable tableName=REALM_LOCALIZATIONS; addPrimaryKey tableName=REALM_LOCALIZATIONS		\N	4.8.0	\N	\N	3272177339
default-roles	keycloak	META-INF/jpa-changelog-13.0.0.xml	2023-12-22 19:09:40.13946	89	EXECUTED	8:72d03345fda8e2f17093d08801947773	addColumn tableName=REALM; customChange		\N	4.8.0	\N	\N	3272177339
default-roles-cleanup	keycloak	META-INF/jpa-changelog-13.0.0.xml	2023-12-22 19:09:40.142783	90	EXECUTED	8:61c9233951bd96ffecd9ba75f7d978a4	dropTable tableName=REALM_DEFAULT_ROLES; dropTable tableName=CLIENT_DEFAULT_ROLES		\N	4.8.0	\N	\N	3272177339
13.0.0-KEYCLOAK-16844	keycloak	META-INF/jpa-changelog-13.0.0.xml	2023-12-22 19:09:40.149753	91	EXECUTED	8:ea82e6ad945cec250af6372767b25525	createIndex indexName=IDX_OFFLINE_USS_PRELOAD, tableName=OFFLINE_USER_SESSION		\N	4.8.0	\N	\N	3272177339
map-remove-ri-13.0.0	keycloak	META-INF/jpa-changelog-13.0.0.xml	2023-12-22 19:09:40.152813	92	EXECUTED	8:d3f4a33f41d960ddacd7e2ef30d126b3	dropForeignKeyConstraint baseTableName=DEFAULT_CLIENT_SCOPE, constraintName=FK_R_DEF_CLI_SCOPE_SCOPE; dropForeignKeyConstraint baseTableName=CLIENT_SCOPE_CLIENT, constraintName=FK_C_CLI_SCOPE_SCOPE; dropForeignKeyConstraint baseTableName=CLIENT_SC...		\N	4.8.0	\N	\N	3272177339
13.0.0-KEYCLOAK-17992-drop-constraints	keycloak	META-INF/jpa-changelog-13.0.0.xml	2023-12-22 19:09:40.153453	93	MARK_RAN	8:1284a27fbd049d65831cb6fc07c8a783	dropPrimaryKey constraintName=C_CLI_SCOPE_BIND, tableName=CLIENT_SCOPE_CLIENT; dropIndex indexName=IDX_CLSCOPE_CL, tableName=CLIENT_SCOPE_CLIENT; dropIndex indexName=IDX_CL_CLSCOPE, tableName=CLIENT_SCOPE_CLIENT		\N	4.8.0	\N	\N	3272177339
13.0.0-increase-column-size-federated	keycloak	META-INF/jpa-changelog-13.0.0.xml	2023-12-22 19:09:40.156678	94	EXECUTED	8:9d11b619db2ae27c25853b8a37cd0dea	modifyDataType columnName=CLIENT_ID, tableName=CLIENT_SCOPE_CLIENT; modifyDataType columnName=SCOPE_ID, tableName=CLIENT_SCOPE_CLIENT		\N	4.8.0	\N	\N	3272177339
13.0.0-KEYCLOAK-17992-recreate-constraints	keycloak	META-INF/jpa-changelog-13.0.0.xml	2023-12-22 19:09:40.157364	95	MARK_RAN	8:3002bb3997451bb9e8bac5c5cd8d6327	addNotNullConstraint columnName=CLIENT_ID, tableName=CLIENT_SCOPE_CLIENT; addNotNullConstraint columnName=SCOPE_ID, tableName=CLIENT_SCOPE_CLIENT; addPrimaryKey constraintName=C_CLI_SCOPE_BIND, tableName=CLIENT_SCOPE_CLIENT; createIndex indexName=...		\N	4.8.0	\N	\N	3272177339
json-string-accomodation-fixed	keycloak	META-INF/jpa-changelog-13.0.0.xml	2023-12-22 19:09:40.159191	96	EXECUTED	8:dfbee0d6237a23ef4ccbb7a4e063c163	addColumn tableName=REALM_ATTRIBUTE; update tableName=REALM_ATTRIBUTE; dropColumn columnName=VALUE, tableName=REALM_ATTRIBUTE; renameColumn newColumnName=VALUE, oldColumnName=VALUE_NEW, tableName=REALM_ATTRIBUTE		\N	4.8.0	\N	\N	3272177339
14.0.0-KEYCLOAK-11019	keycloak	META-INF/jpa-changelog-14.0.0.xml	2023-12-22 19:09:40.173563	97	EXECUTED	8:75f3e372df18d38c62734eebb986b960	createIndex indexName=IDX_OFFLINE_CSS_PRELOAD, tableName=OFFLINE_CLIENT_SESSION; createIndex indexName=IDX_OFFLINE_USS_BY_USER, tableName=OFFLINE_USER_SESSION; createIndex indexName=IDX_OFFLINE_USS_BY_USERSESS, tableName=OFFLINE_USER_SESSION		\N	4.8.0	\N	\N	3272177339
14.0.0-KEYCLOAK-18286	keycloak	META-INF/jpa-changelog-14.0.0.xml	2023-12-22 19:09:40.174261	98	MARK_RAN	8:7fee73eddf84a6035691512c85637eef	createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.8.0	\N	\N	3272177339
14.0.0-KEYCLOAK-18286-revert	keycloak	META-INF/jpa-changelog-14.0.0.xml	2023-12-22 19:09:40.178947	99	MARK_RAN	8:7a11134ab12820f999fbf3bb13c3adc8	dropIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.8.0	\N	\N	3272177339
14.0.0-KEYCLOAK-18286-supported-dbs	keycloak	META-INF/jpa-changelog-14.0.0.xml	2023-12-22 19:09:40.185503	100	EXECUTED	8:c0f6eaac1f3be773ffe54cb5b8482b70	createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.8.0	\N	\N	3272177339
14.0.0-KEYCLOAK-18286-unsupported-dbs	keycloak	META-INF/jpa-changelog-14.0.0.xml	2023-12-22 19:09:40.186321	101	MARK_RAN	8:18186f0008b86e0f0f49b0c4d0e842ac	createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.8.0	\N	\N	3272177339
KEYCLOAK-17267-add-index-to-user-attributes	keycloak	META-INF/jpa-changelog-14.0.0.xml	2023-12-22 19:09:40.191785	102	EXECUTED	8:09c2780bcb23b310a7019d217dc7b433	createIndex indexName=IDX_USER_ATTRIBUTE_NAME, tableName=USER_ATTRIBUTE		\N	4.8.0	\N	\N	3272177339
KEYCLOAK-18146-add-saml-art-binding-identifier	keycloak	META-INF/jpa-changelog-14.0.0.xml	2023-12-22 19:09:40.193505	103	EXECUTED	8:276a44955eab693c970a42880197fff2	customChange		\N	4.8.0	\N	\N	3272177339
15.0.0-KEYCLOAK-18467	keycloak	META-INF/jpa-changelog-15.0.0.xml	2023-12-22 19:09:40.19549	104	EXECUTED	8:ba8ee3b694d043f2bfc1a1079d0760d7	addColumn tableName=REALM_LOCALIZATIONS; update tableName=REALM_LOCALIZATIONS; dropColumn columnName=TEXTS, tableName=REALM_LOCALIZATIONS; renameColumn newColumnName=TEXTS, oldColumnName=TEXTS_NEW, tableName=REALM_LOCALIZATIONS; addNotNullConstrai...		\N	4.8.0	\N	\N	3272177339
17.0.0-9562	keycloak	META-INF/jpa-changelog-17.0.0.xml	2023-12-22 19:09:40.200812	105	EXECUTED	8:5e06b1d75f5d17685485e610c2851b17	createIndex indexName=IDX_USER_SERVICE_ACCOUNT, tableName=USER_ENTITY		\N	4.8.0	\N	\N	3272177339
18.0.0-10625-IDX_ADMIN_EVENT_TIME	keycloak	META-INF/jpa-changelog-18.0.0.xml	2023-12-22 19:09:40.205934	106	EXECUTED	8:4b80546c1dc550ac552ee7b24a4ab7c0	createIndex indexName=IDX_ADMIN_EVENT_TIME, tableName=ADMIN_EVENT_ENTITY		\N	4.8.0	\N	\N	3272177339
19.0.0-10135	keycloak	META-INF/jpa-changelog-19.0.0.xml	2023-12-22 19:09:40.207334	107	EXECUTED	8:af510cd1bb2ab6339c45372f3e491696	customChange		\N	4.8.0	\N	\N	3272177339
\.


--
-- Data for Name: databasechangeloglock; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.databasechangeloglock (id, locked, lockgranted, lockedby) FROM stdin;
1	f	\N	\N
1000	f	\N	\N
1001	f	\N	\N
\.


--
-- Data for Name: default_client_scope; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.default_client_scope (realm_id, scope_id, default_scope) FROM stdin;
04fb5b65-a9ea-4a2d-8f5e-0b7fad82a2da	62cf695d-38a7-443d-9f5c-35f651cb379e	f
04fb5b65-a9ea-4a2d-8f5e-0b7fad82a2da	54a48c9c-fad0-48fc-8083-72aa4ca8f338	t
04fb5b65-a9ea-4a2d-8f5e-0b7fad82a2da	464bffc3-b3fa-4493-bf68-99378bee7460	t
04fb5b65-a9ea-4a2d-8f5e-0b7fad82a2da	d3eda79f-2105-4fb6-9778-ce734e615834	t
04fb5b65-a9ea-4a2d-8f5e-0b7fad82a2da	d72156b9-9a80-41a2-9068-2c189f9c1bf7	f
04fb5b65-a9ea-4a2d-8f5e-0b7fad82a2da	e87eceff-e962-4875-93b7-55ef4cc30032	f
04fb5b65-a9ea-4a2d-8f5e-0b7fad82a2da	339b2f1b-055e-40ee-ab1e-34afd3809e15	t
04fb5b65-a9ea-4a2d-8f5e-0b7fad82a2da	34e0657e-0fbd-47ae-8ec2-4aacf8b1dc09	t
04fb5b65-a9ea-4a2d-8f5e-0b7fad82a2da	b90377ac-b066-416c-8051-022d1a66217c	f
04fb5b65-a9ea-4a2d-8f5e-0b7fad82a2da	584da0a3-66aa-4baa-ba3c-d7633d7c1160	t
eaaeb62f-362b-40bb-b7f1-d927afd6a6e9	97c9a8cc-9249-45af-baa3-179bf8dbe06a	f
eaaeb62f-362b-40bb-b7f1-d927afd6a6e9	9db53642-e6f8-4e75-bc1d-dc1c863eaa98	t
eaaeb62f-362b-40bb-b7f1-d927afd6a6e9	8ec7285c-58e2-42d6-90ce-68ffb6f871c5	t
eaaeb62f-362b-40bb-b7f1-d927afd6a6e9	5f1dc33b-5e36-4f1e-a826-c8197297b919	t
eaaeb62f-362b-40bb-b7f1-d927afd6a6e9	569500f8-3113-42af-9b3b-165b1b8f188f	f
eaaeb62f-362b-40bb-b7f1-d927afd6a6e9	9db26fec-feea-4d24-a802-799be662a562	f
eaaeb62f-362b-40bb-b7f1-d927afd6a6e9	29c47719-3609-4ee9-a7d5-c358459fd40e	t
eaaeb62f-362b-40bb-b7f1-d927afd6a6e9	d5fdbad2-73ad-417b-ae66-e65b5d6f2239	t
eaaeb62f-362b-40bb-b7f1-d927afd6a6e9	9bac8767-31e1-41db-97d4-72dbcd4bfbb5	f
eaaeb62f-362b-40bb-b7f1-d927afd6a6e9	3defc30c-ec86-4800-a53a-3a27f84508e5	t
\.


--
-- Data for Name: event_entity; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.event_entity (id, client_id, details_json, error, ip_address, realm_id, session_id, event_time, type, user_id) FROM stdin;
\.


--
-- Data for Name: fed_user_attribute; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.fed_user_attribute (id, name, user_id, realm_id, storage_provider_id, value) FROM stdin;
\.


--
-- Data for Name: fed_user_consent; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.fed_user_consent (id, client_id, user_id, realm_id, storage_provider_id, created_date, last_updated_date, client_storage_provider, external_client_id) FROM stdin;
\.


--
-- Data for Name: fed_user_consent_cl_scope; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.fed_user_consent_cl_scope (user_consent_id, scope_id) FROM stdin;
\.


--
-- Data for Name: fed_user_credential; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.fed_user_credential (id, salt, type, created_date, user_id, realm_id, storage_provider_id, user_label, secret_data, credential_data, priority) FROM stdin;
\.


--
-- Data for Name: fed_user_group_membership; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.fed_user_group_membership (group_id, user_id, realm_id, storage_provider_id) FROM stdin;
\.


--
-- Data for Name: fed_user_required_action; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.fed_user_required_action (required_action, user_id, realm_id, storage_provider_id) FROM stdin;
\.


--
-- Data for Name: fed_user_role_mapping; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.fed_user_role_mapping (role_id, user_id, realm_id, storage_provider_id) FROM stdin;
\.


--
-- Data for Name: federated_identity; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.federated_identity (identity_provider, realm_id, federated_user_id, federated_username, token, user_id) FROM stdin;
\.


--
-- Data for Name: federated_user; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.federated_user (id, storage_provider_id, realm_id) FROM stdin;
\.


--
-- Data for Name: group_attribute; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.group_attribute (id, name, value, group_id) FROM stdin;
\.


--
-- Data for Name: group_role_mapping; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.group_role_mapping (role_id, group_id) FROM stdin;
37be74b9-903c-4de7-9f5d-c7635e4f0ded	44c63a06-e216-4e4b-8dbf-c5bbc6dcd1aa
d08e5c85-dcf6-469c-bc29-9d91aa6c2321	a410c078-fb2e-4dae-8d49-7727ef71c488
\.


--
-- Data for Name: identity_provider; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.identity_provider (internal_id, enabled, provider_alias, provider_id, store_token, authenticate_by_default, realm_id, add_token_role, trust_email, first_broker_login_flow_id, post_broker_login_flow_id, provider_display_name, link_only) FROM stdin;
\.


--
-- Data for Name: identity_provider_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.identity_provider_config (identity_provider_id, value, name) FROM stdin;
\.


--
-- Data for Name: identity_provider_mapper; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.identity_provider_mapper (id, name, idp_alias, idp_mapper_name, realm_id) FROM stdin;
\.


--
-- Data for Name: idp_mapper_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.idp_mapper_config (idp_mapper_id, value, name) FROM stdin;
\.


--
-- Data for Name: keycloak_group; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.keycloak_group (id, name, parent_group, realm_id) FROM stdin;
a410c078-fb2e-4dae-8d49-7727ef71c488	sellers	 	eaaeb62f-362b-40bb-b7f1-d927afd6a6e9
44c63a06-e216-4e4b-8dbf-c5bbc6dcd1aa	customers	 	eaaeb62f-362b-40bb-b7f1-d927afd6a6e9
\.


--
-- Data for Name: keycloak_role; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) FROM stdin;
d3f8884c-19d7-47d1-a3d9-ffa85bb27479	04fb5b65-a9ea-4a2d-8f5e-0b7fad82a2da	f	${role_default-roles}	default-roles-master	04fb5b65-a9ea-4a2d-8f5e-0b7fad82a2da	\N	\N
b4122d25-9a3f-4dc5-a3f8-68ea17c4bcaa	04fb5b65-a9ea-4a2d-8f5e-0b7fad82a2da	f	${role_admin}	admin	04fb5b65-a9ea-4a2d-8f5e-0b7fad82a2da	\N	\N
6a7cb953-f272-40f0-b781-f0528d7890f4	04fb5b65-a9ea-4a2d-8f5e-0b7fad82a2da	f	${role_create-realm}	create-realm	04fb5b65-a9ea-4a2d-8f5e-0b7fad82a2da	\N	\N
a7568ef9-ba01-44de-af02-654be59f2a04	83325b84-08c9-4828-b471-d93aaa781ce0	t	${role_create-client}	create-client	04fb5b65-a9ea-4a2d-8f5e-0b7fad82a2da	83325b84-08c9-4828-b471-d93aaa781ce0	\N
078bcaa9-f0ed-4a7d-83c8-d5ad55d9bb7d	83325b84-08c9-4828-b471-d93aaa781ce0	t	${role_view-realm}	view-realm	04fb5b65-a9ea-4a2d-8f5e-0b7fad82a2da	83325b84-08c9-4828-b471-d93aaa781ce0	\N
d8f885fb-4b78-4f77-b2d3-96500e04f37a	83325b84-08c9-4828-b471-d93aaa781ce0	t	${role_view-users}	view-users	04fb5b65-a9ea-4a2d-8f5e-0b7fad82a2da	83325b84-08c9-4828-b471-d93aaa781ce0	\N
295ffeea-efcd-4ab1-8697-9631dc002385	83325b84-08c9-4828-b471-d93aaa781ce0	t	${role_view-clients}	view-clients	04fb5b65-a9ea-4a2d-8f5e-0b7fad82a2da	83325b84-08c9-4828-b471-d93aaa781ce0	\N
3743f98b-8579-4816-8264-c97c6efb0152	83325b84-08c9-4828-b471-d93aaa781ce0	t	${role_view-events}	view-events	04fb5b65-a9ea-4a2d-8f5e-0b7fad82a2da	83325b84-08c9-4828-b471-d93aaa781ce0	\N
54ca9551-1aeb-4697-912e-479b86d26f64	83325b84-08c9-4828-b471-d93aaa781ce0	t	${role_view-identity-providers}	view-identity-providers	04fb5b65-a9ea-4a2d-8f5e-0b7fad82a2da	83325b84-08c9-4828-b471-d93aaa781ce0	\N
c0c8cebc-2891-4659-9521-bfb2f2d8b222	83325b84-08c9-4828-b471-d93aaa781ce0	t	${role_view-authorization}	view-authorization	04fb5b65-a9ea-4a2d-8f5e-0b7fad82a2da	83325b84-08c9-4828-b471-d93aaa781ce0	\N
2825b25b-6192-4715-abe3-f2bc563180ef	83325b84-08c9-4828-b471-d93aaa781ce0	t	${role_manage-realm}	manage-realm	04fb5b65-a9ea-4a2d-8f5e-0b7fad82a2da	83325b84-08c9-4828-b471-d93aaa781ce0	\N
bb17aef6-35e2-44e8-82c1-da6b1f0864b4	83325b84-08c9-4828-b471-d93aaa781ce0	t	${role_manage-users}	manage-users	04fb5b65-a9ea-4a2d-8f5e-0b7fad82a2da	83325b84-08c9-4828-b471-d93aaa781ce0	\N
11b0efa7-eef8-410e-b3ee-d3d739f89c0b	83325b84-08c9-4828-b471-d93aaa781ce0	t	${role_manage-clients}	manage-clients	04fb5b65-a9ea-4a2d-8f5e-0b7fad82a2da	83325b84-08c9-4828-b471-d93aaa781ce0	\N
535c6f8b-b0b6-48bb-bcac-d317b958444f	83325b84-08c9-4828-b471-d93aaa781ce0	t	${role_manage-events}	manage-events	04fb5b65-a9ea-4a2d-8f5e-0b7fad82a2da	83325b84-08c9-4828-b471-d93aaa781ce0	\N
10dd6c9a-bfe5-49d3-a457-6b5e3f257e4f	83325b84-08c9-4828-b471-d93aaa781ce0	t	${role_manage-identity-providers}	manage-identity-providers	04fb5b65-a9ea-4a2d-8f5e-0b7fad82a2da	83325b84-08c9-4828-b471-d93aaa781ce0	\N
9d86466f-25d2-4626-a465-aa1cd9545e66	83325b84-08c9-4828-b471-d93aaa781ce0	t	${role_manage-authorization}	manage-authorization	04fb5b65-a9ea-4a2d-8f5e-0b7fad82a2da	83325b84-08c9-4828-b471-d93aaa781ce0	\N
516f7b14-66d7-47c0-a3f2-2557449c64c4	83325b84-08c9-4828-b471-d93aaa781ce0	t	${role_query-users}	query-users	04fb5b65-a9ea-4a2d-8f5e-0b7fad82a2da	83325b84-08c9-4828-b471-d93aaa781ce0	\N
77b99335-7ab0-4dd6-8860-1066ea72b5e6	83325b84-08c9-4828-b471-d93aaa781ce0	t	${role_query-clients}	query-clients	04fb5b65-a9ea-4a2d-8f5e-0b7fad82a2da	83325b84-08c9-4828-b471-d93aaa781ce0	\N
de9da760-8281-47cf-881a-75b2ee755f52	83325b84-08c9-4828-b471-d93aaa781ce0	t	${role_query-realms}	query-realms	04fb5b65-a9ea-4a2d-8f5e-0b7fad82a2da	83325b84-08c9-4828-b471-d93aaa781ce0	\N
13b79050-2fe1-4b7a-b21a-22f7717fcdc8	83325b84-08c9-4828-b471-d93aaa781ce0	t	${role_query-groups}	query-groups	04fb5b65-a9ea-4a2d-8f5e-0b7fad82a2da	83325b84-08c9-4828-b471-d93aaa781ce0	\N
a2b93aca-6c5f-4459-b68b-ed5fbe77719b	928ae892-62d7-4e34-bd4c-5f8f3f9a8994	t	${role_view-profile}	view-profile	04fb5b65-a9ea-4a2d-8f5e-0b7fad82a2da	928ae892-62d7-4e34-bd4c-5f8f3f9a8994	\N
2a20a74d-5aa9-4399-8c3b-0dc29da48000	928ae892-62d7-4e34-bd4c-5f8f3f9a8994	t	${role_manage-account}	manage-account	04fb5b65-a9ea-4a2d-8f5e-0b7fad82a2da	928ae892-62d7-4e34-bd4c-5f8f3f9a8994	\N
ad83776a-ff76-49d8-972e-0305b85cfeab	928ae892-62d7-4e34-bd4c-5f8f3f9a8994	t	${role_manage-account-links}	manage-account-links	04fb5b65-a9ea-4a2d-8f5e-0b7fad82a2da	928ae892-62d7-4e34-bd4c-5f8f3f9a8994	\N
95599fb4-7bec-4472-8482-71255ed2c85c	928ae892-62d7-4e34-bd4c-5f8f3f9a8994	t	${role_view-applications}	view-applications	04fb5b65-a9ea-4a2d-8f5e-0b7fad82a2da	928ae892-62d7-4e34-bd4c-5f8f3f9a8994	\N
49241d44-87f7-42da-a2de-c27e6f391935	928ae892-62d7-4e34-bd4c-5f8f3f9a8994	t	${role_view-consent}	view-consent	04fb5b65-a9ea-4a2d-8f5e-0b7fad82a2da	928ae892-62d7-4e34-bd4c-5f8f3f9a8994	\N
46864175-b0f7-4e54-b3da-e75a063a0ffa	928ae892-62d7-4e34-bd4c-5f8f3f9a8994	t	${role_manage-consent}	manage-consent	04fb5b65-a9ea-4a2d-8f5e-0b7fad82a2da	928ae892-62d7-4e34-bd4c-5f8f3f9a8994	\N
e8ef316e-a8e6-4856-bfdc-6b2db995ff60	928ae892-62d7-4e34-bd4c-5f8f3f9a8994	t	${role_delete-account}	delete-account	04fb5b65-a9ea-4a2d-8f5e-0b7fad82a2da	928ae892-62d7-4e34-bd4c-5f8f3f9a8994	\N
92ef9f3c-5ebf-4a77-b3fe-61ebe050d124	2e85f692-8d9e-4cbb-b2b5-f6df657b292f	t	${role_read-token}	read-token	04fb5b65-a9ea-4a2d-8f5e-0b7fad82a2da	2e85f692-8d9e-4cbb-b2b5-f6df657b292f	\N
d8ca5a5f-6166-4baa-aff6-4fa2bee811dc	83325b84-08c9-4828-b471-d93aaa781ce0	t	${role_impersonation}	impersonation	04fb5b65-a9ea-4a2d-8f5e-0b7fad82a2da	83325b84-08c9-4828-b471-d93aaa781ce0	\N
0282cdc5-1f82-4b83-9e2a-dd3655b20b07	04fb5b65-a9ea-4a2d-8f5e-0b7fad82a2da	f	${role_offline-access}	offline_access	04fb5b65-a9ea-4a2d-8f5e-0b7fad82a2da	\N	\N
752f795e-0401-4652-b071-9e8ff939eddc	04fb5b65-a9ea-4a2d-8f5e-0b7fad82a2da	f	${role_uma_authorization}	uma_authorization	04fb5b65-a9ea-4a2d-8f5e-0b7fad82a2da	\N	\N
a7e79e49-a86a-45e0-8aa3-3cd3ec4d7c1f	eaaeb62f-362b-40bb-b7f1-d927afd6a6e9	f	${role_default-roles}	default-roles-hmmyzon	eaaeb62f-362b-40bb-b7f1-d927afd6a6e9	\N	\N
33c6f1ba-367c-4d9b-a527-bddd530bb591	c29e055b-142f-4d40-a1f4-1d8807cf1b45	t	${role_create-client}	create-client	04fb5b65-a9ea-4a2d-8f5e-0b7fad82a2da	c29e055b-142f-4d40-a1f4-1d8807cf1b45	\N
b40bd39a-981a-4b26-84f4-624a443c67ed	c29e055b-142f-4d40-a1f4-1d8807cf1b45	t	${role_view-realm}	view-realm	04fb5b65-a9ea-4a2d-8f5e-0b7fad82a2da	c29e055b-142f-4d40-a1f4-1d8807cf1b45	\N
f6135e69-bbff-46f7-ae0e-213ad922fbd3	c29e055b-142f-4d40-a1f4-1d8807cf1b45	t	${role_view-users}	view-users	04fb5b65-a9ea-4a2d-8f5e-0b7fad82a2da	c29e055b-142f-4d40-a1f4-1d8807cf1b45	\N
ce84955c-80d1-4819-b8ec-7e54d6152094	c29e055b-142f-4d40-a1f4-1d8807cf1b45	t	${role_view-clients}	view-clients	04fb5b65-a9ea-4a2d-8f5e-0b7fad82a2da	c29e055b-142f-4d40-a1f4-1d8807cf1b45	\N
abcd05eb-2f8c-431b-90d1-d89f2d648eb3	c29e055b-142f-4d40-a1f4-1d8807cf1b45	t	${role_view-events}	view-events	04fb5b65-a9ea-4a2d-8f5e-0b7fad82a2da	c29e055b-142f-4d40-a1f4-1d8807cf1b45	\N
3352ac0e-ff9d-4a40-ad49-3e3da15baeb5	c29e055b-142f-4d40-a1f4-1d8807cf1b45	t	${role_view-identity-providers}	view-identity-providers	04fb5b65-a9ea-4a2d-8f5e-0b7fad82a2da	c29e055b-142f-4d40-a1f4-1d8807cf1b45	\N
db24d0fc-4e73-4f71-84f4-1f4befc4e2e1	c29e055b-142f-4d40-a1f4-1d8807cf1b45	t	${role_view-authorization}	view-authorization	04fb5b65-a9ea-4a2d-8f5e-0b7fad82a2da	c29e055b-142f-4d40-a1f4-1d8807cf1b45	\N
77b07242-62fa-4d18-b83a-3f0ddb7c9c1d	c29e055b-142f-4d40-a1f4-1d8807cf1b45	t	${role_manage-realm}	manage-realm	04fb5b65-a9ea-4a2d-8f5e-0b7fad82a2da	c29e055b-142f-4d40-a1f4-1d8807cf1b45	\N
e6098035-831e-4668-8ebb-d99d1f1b15d6	c29e055b-142f-4d40-a1f4-1d8807cf1b45	t	${role_manage-users}	manage-users	04fb5b65-a9ea-4a2d-8f5e-0b7fad82a2da	c29e055b-142f-4d40-a1f4-1d8807cf1b45	\N
475a7e23-8fca-4d52-8ab0-c657b81b7419	c29e055b-142f-4d40-a1f4-1d8807cf1b45	t	${role_manage-clients}	manage-clients	04fb5b65-a9ea-4a2d-8f5e-0b7fad82a2da	c29e055b-142f-4d40-a1f4-1d8807cf1b45	\N
3d2b0e71-1b37-4bd3-aae2-f960d582bb4d	c29e055b-142f-4d40-a1f4-1d8807cf1b45	t	${role_manage-events}	manage-events	04fb5b65-a9ea-4a2d-8f5e-0b7fad82a2da	c29e055b-142f-4d40-a1f4-1d8807cf1b45	\N
00dec864-c1ef-4a5b-b0f0-aadf1d02f04c	c29e055b-142f-4d40-a1f4-1d8807cf1b45	t	${role_manage-identity-providers}	manage-identity-providers	04fb5b65-a9ea-4a2d-8f5e-0b7fad82a2da	c29e055b-142f-4d40-a1f4-1d8807cf1b45	\N
daae66bc-a19c-45d2-a340-c35e498caba9	c29e055b-142f-4d40-a1f4-1d8807cf1b45	t	${role_manage-authorization}	manage-authorization	04fb5b65-a9ea-4a2d-8f5e-0b7fad82a2da	c29e055b-142f-4d40-a1f4-1d8807cf1b45	\N
b007b78e-670a-4499-959c-498aa2dc6c28	c29e055b-142f-4d40-a1f4-1d8807cf1b45	t	${role_query-users}	query-users	04fb5b65-a9ea-4a2d-8f5e-0b7fad82a2da	c29e055b-142f-4d40-a1f4-1d8807cf1b45	\N
5ceb1fc2-e023-4202-8954-ef76c3522dbb	c29e055b-142f-4d40-a1f4-1d8807cf1b45	t	${role_query-clients}	query-clients	04fb5b65-a9ea-4a2d-8f5e-0b7fad82a2da	c29e055b-142f-4d40-a1f4-1d8807cf1b45	\N
ed5561a6-e43b-4f70-a186-a34f121b408f	c29e055b-142f-4d40-a1f4-1d8807cf1b45	t	${role_query-realms}	query-realms	04fb5b65-a9ea-4a2d-8f5e-0b7fad82a2da	c29e055b-142f-4d40-a1f4-1d8807cf1b45	\N
4a809901-0b51-442d-b6f0-236f31998ba1	c29e055b-142f-4d40-a1f4-1d8807cf1b45	t	${role_query-groups}	query-groups	04fb5b65-a9ea-4a2d-8f5e-0b7fad82a2da	c29e055b-142f-4d40-a1f4-1d8807cf1b45	\N
6bfa124a-1774-49f1-8720-d0c9a174e225	d50b8e95-48d7-42ac-8d8b-14b1d7c1aaa9	t	${role_realm-admin}	realm-admin	eaaeb62f-362b-40bb-b7f1-d927afd6a6e9	d50b8e95-48d7-42ac-8d8b-14b1d7c1aaa9	\N
422bbee0-8c19-4568-a2d9-35747d3f1c4b	d50b8e95-48d7-42ac-8d8b-14b1d7c1aaa9	t	${role_create-client}	create-client	eaaeb62f-362b-40bb-b7f1-d927afd6a6e9	d50b8e95-48d7-42ac-8d8b-14b1d7c1aaa9	\N
a86189af-86fe-40dd-a851-b76cbcc05e4a	d50b8e95-48d7-42ac-8d8b-14b1d7c1aaa9	t	${role_view-realm}	view-realm	eaaeb62f-362b-40bb-b7f1-d927afd6a6e9	d50b8e95-48d7-42ac-8d8b-14b1d7c1aaa9	\N
92a845dc-a243-4756-8f17-a8de8674d5d3	d50b8e95-48d7-42ac-8d8b-14b1d7c1aaa9	t	${role_view-users}	view-users	eaaeb62f-362b-40bb-b7f1-d927afd6a6e9	d50b8e95-48d7-42ac-8d8b-14b1d7c1aaa9	\N
36f3770f-1619-4d34-9133-d57f3f47c88a	d50b8e95-48d7-42ac-8d8b-14b1d7c1aaa9	t	${role_view-clients}	view-clients	eaaeb62f-362b-40bb-b7f1-d927afd6a6e9	d50b8e95-48d7-42ac-8d8b-14b1d7c1aaa9	\N
608ca91a-62cc-4756-b686-5efd3e54e091	d50b8e95-48d7-42ac-8d8b-14b1d7c1aaa9	t	${role_view-events}	view-events	eaaeb62f-362b-40bb-b7f1-d927afd6a6e9	d50b8e95-48d7-42ac-8d8b-14b1d7c1aaa9	\N
b02ffd3f-6e14-4d6b-a9ed-82ec2c9c9e95	d50b8e95-48d7-42ac-8d8b-14b1d7c1aaa9	t	${role_view-identity-providers}	view-identity-providers	eaaeb62f-362b-40bb-b7f1-d927afd6a6e9	d50b8e95-48d7-42ac-8d8b-14b1d7c1aaa9	\N
923f38b1-fa51-46a8-9f3f-513463f14c39	d50b8e95-48d7-42ac-8d8b-14b1d7c1aaa9	t	${role_view-authorization}	view-authorization	eaaeb62f-362b-40bb-b7f1-d927afd6a6e9	d50b8e95-48d7-42ac-8d8b-14b1d7c1aaa9	\N
3bbb1a10-138f-4c61-a83d-312e600ef6d8	d50b8e95-48d7-42ac-8d8b-14b1d7c1aaa9	t	${role_manage-realm}	manage-realm	eaaeb62f-362b-40bb-b7f1-d927afd6a6e9	d50b8e95-48d7-42ac-8d8b-14b1d7c1aaa9	\N
53ad4741-17f7-4657-a04a-0571f0c40c86	d50b8e95-48d7-42ac-8d8b-14b1d7c1aaa9	t	${role_manage-users}	manage-users	eaaeb62f-362b-40bb-b7f1-d927afd6a6e9	d50b8e95-48d7-42ac-8d8b-14b1d7c1aaa9	\N
b7029340-ee02-4e8b-87c3-d0df4a98d4c2	d50b8e95-48d7-42ac-8d8b-14b1d7c1aaa9	t	${role_manage-clients}	manage-clients	eaaeb62f-362b-40bb-b7f1-d927afd6a6e9	d50b8e95-48d7-42ac-8d8b-14b1d7c1aaa9	\N
0e47d7c5-a54c-4bd3-a364-87a428b526a2	d50b8e95-48d7-42ac-8d8b-14b1d7c1aaa9	t	${role_manage-events}	manage-events	eaaeb62f-362b-40bb-b7f1-d927afd6a6e9	d50b8e95-48d7-42ac-8d8b-14b1d7c1aaa9	\N
bc52908d-8e53-4cd9-9e51-8d38c080a06b	d50b8e95-48d7-42ac-8d8b-14b1d7c1aaa9	t	${role_manage-identity-providers}	manage-identity-providers	eaaeb62f-362b-40bb-b7f1-d927afd6a6e9	d50b8e95-48d7-42ac-8d8b-14b1d7c1aaa9	\N
1fd58f71-e1f8-4f3d-8a7b-cc0fab19b2ee	d50b8e95-48d7-42ac-8d8b-14b1d7c1aaa9	t	${role_manage-authorization}	manage-authorization	eaaeb62f-362b-40bb-b7f1-d927afd6a6e9	d50b8e95-48d7-42ac-8d8b-14b1d7c1aaa9	\N
427b9e33-0cbf-4c21-95ff-de0948420e9e	d50b8e95-48d7-42ac-8d8b-14b1d7c1aaa9	t	${role_query-users}	query-users	eaaeb62f-362b-40bb-b7f1-d927afd6a6e9	d50b8e95-48d7-42ac-8d8b-14b1d7c1aaa9	\N
37515999-93e2-4c57-9224-201349fdd22e	d50b8e95-48d7-42ac-8d8b-14b1d7c1aaa9	t	${role_query-clients}	query-clients	eaaeb62f-362b-40bb-b7f1-d927afd6a6e9	d50b8e95-48d7-42ac-8d8b-14b1d7c1aaa9	\N
5d527ba0-ba02-4551-a958-68df2aabb99e	d50b8e95-48d7-42ac-8d8b-14b1d7c1aaa9	t	${role_query-realms}	query-realms	eaaeb62f-362b-40bb-b7f1-d927afd6a6e9	d50b8e95-48d7-42ac-8d8b-14b1d7c1aaa9	\N
04f12c19-e19d-479f-9cf8-41478ad64d7a	d50b8e95-48d7-42ac-8d8b-14b1d7c1aaa9	t	${role_query-groups}	query-groups	eaaeb62f-362b-40bb-b7f1-d927afd6a6e9	d50b8e95-48d7-42ac-8d8b-14b1d7c1aaa9	\N
26474066-8e0e-4ffd-8882-3a38de4da06c	9fd40948-70b2-47ea-98c4-f94d80a06ddb	t	${role_view-profile}	view-profile	eaaeb62f-362b-40bb-b7f1-d927afd6a6e9	9fd40948-70b2-47ea-98c4-f94d80a06ddb	\N
38a3e485-ddf6-4ab4-94fe-d42f1f5855b0	9fd40948-70b2-47ea-98c4-f94d80a06ddb	t	${role_manage-account}	manage-account	eaaeb62f-362b-40bb-b7f1-d927afd6a6e9	9fd40948-70b2-47ea-98c4-f94d80a06ddb	\N
946769de-22da-4c1e-8c2c-649187dc7503	9fd40948-70b2-47ea-98c4-f94d80a06ddb	t	${role_manage-account-links}	manage-account-links	eaaeb62f-362b-40bb-b7f1-d927afd6a6e9	9fd40948-70b2-47ea-98c4-f94d80a06ddb	\N
08763fcb-7a8d-4e52-b580-a011c009f560	9fd40948-70b2-47ea-98c4-f94d80a06ddb	t	${role_view-applications}	view-applications	eaaeb62f-362b-40bb-b7f1-d927afd6a6e9	9fd40948-70b2-47ea-98c4-f94d80a06ddb	\N
5d251638-e88f-4143-ba64-1d25285eaab5	9fd40948-70b2-47ea-98c4-f94d80a06ddb	t	${role_view-consent}	view-consent	eaaeb62f-362b-40bb-b7f1-d927afd6a6e9	9fd40948-70b2-47ea-98c4-f94d80a06ddb	\N
d0ff4f3c-5f07-422c-a934-aa2927cf5730	9fd40948-70b2-47ea-98c4-f94d80a06ddb	t	${role_manage-consent}	manage-consent	eaaeb62f-362b-40bb-b7f1-d927afd6a6e9	9fd40948-70b2-47ea-98c4-f94d80a06ddb	\N
8cae48a8-bdd7-4a7e-bd68-0308fa8f75ee	9fd40948-70b2-47ea-98c4-f94d80a06ddb	t	${role_delete-account}	delete-account	eaaeb62f-362b-40bb-b7f1-d927afd6a6e9	9fd40948-70b2-47ea-98c4-f94d80a06ddb	\N
b43a400e-bbeb-496d-8836-7d9731500805	c29e055b-142f-4d40-a1f4-1d8807cf1b45	t	${role_impersonation}	impersonation	04fb5b65-a9ea-4a2d-8f5e-0b7fad82a2da	c29e055b-142f-4d40-a1f4-1d8807cf1b45	\N
801bafcd-73f5-492c-aa59-8b354510d3e8	d50b8e95-48d7-42ac-8d8b-14b1d7c1aaa9	t	${role_impersonation}	impersonation	eaaeb62f-362b-40bb-b7f1-d927afd6a6e9	d50b8e95-48d7-42ac-8d8b-14b1d7c1aaa9	\N
5c4a439a-9500-4eb7-a74b-1f4bd324d032	1b3a4ed9-ab56-4592-9cce-4f70bbbe848e	t	${role_read-token}	read-token	eaaeb62f-362b-40bb-b7f1-d927afd6a6e9	1b3a4ed9-ab56-4592-9cce-4f70bbbe848e	\N
78a51bf4-b969-4b05-b339-bc9cce0d0022	eaaeb62f-362b-40bb-b7f1-d927afd6a6e9	f	${role_offline-access}	offline_access	eaaeb62f-362b-40bb-b7f1-d927afd6a6e9	\N	\N
0fd91175-a400-4687-bbfb-ad9b0e397723	eaaeb62f-362b-40bb-b7f1-d927afd6a6e9	f	${role_uma_authorization}	uma_authorization	eaaeb62f-362b-40bb-b7f1-d927afd6a6e9	\N	\N
d08e5c85-dcf6-469c-bc29-9d91aa6c2321	eaaeb62f-362b-40bb-b7f1-d927afd6a6e9	f	sells cool stuff	seller	eaaeb62f-362b-40bb-b7f1-d927afd6a6e9	\N	\N
37be74b9-903c-4de7-9f5d-c7635e4f0ded	eaaeb62f-362b-40bb-b7f1-d927afd6a6e9	f	buys in the name of capitalism 	customer	eaaeb62f-362b-40bb-b7f1-d927afd6a6e9	\N	\N
\.


--
-- Data for Name: migration_model; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.migration_model (id, version, update_time) FROM stdin;
gm4si	19.0.3	1703272182
\.


--
-- Data for Name: offline_client_session; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.offline_client_session (user_session_id, client_id, offline_flag, "timestamp", data, client_storage_provider, external_client_id) FROM stdin;
\.


--
-- Data for Name: offline_user_session; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.offline_user_session (user_session_id, user_id, realm_id, created_on, offline_flag, data, last_session_refresh) FROM stdin;
\.


--
-- Data for Name: policy_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.policy_config (policy_id, name, value) FROM stdin;
\.


--
-- Data for Name: protocol_mapper; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) FROM stdin;
3f677f72-f45b-4f56-9fb3-ac28b98f1ac7	audience resolve	openid-connect	oidc-audience-resolve-mapper	f740cab7-40a8-4ae7-8347-36f262b2336a	\N
d2b19792-7ab8-408b-899c-e692cc13292e	locale	openid-connect	oidc-usermodel-attribute-mapper	6af6154c-9581-4825-ae34-fe235c49a845	\N
cba93806-465d-4702-948c-a6b63cb16b44	role list	saml	saml-role-list-mapper	\N	54a48c9c-fad0-48fc-8083-72aa4ca8f338
9dae4e6a-9728-44ca-9a8c-50eab553a74b	full name	openid-connect	oidc-full-name-mapper	\N	464bffc3-b3fa-4493-bf68-99378bee7460
3313ebcb-3149-467b-9d19-ad6eab88026f	family name	openid-connect	oidc-usermodel-property-mapper	\N	464bffc3-b3fa-4493-bf68-99378bee7460
8389245e-8a71-4a2c-bbd5-bb8ac6f81d48	given name	openid-connect	oidc-usermodel-property-mapper	\N	464bffc3-b3fa-4493-bf68-99378bee7460
c8a748f5-7d5a-4e96-8520-7a4b44a3911b	middle name	openid-connect	oidc-usermodel-attribute-mapper	\N	464bffc3-b3fa-4493-bf68-99378bee7460
5ae8ec5d-a3b7-448e-9cf1-805c2a3734a1	nickname	openid-connect	oidc-usermodel-attribute-mapper	\N	464bffc3-b3fa-4493-bf68-99378bee7460
4c385d1f-6909-4d12-bbaf-c5e9774f7500	username	openid-connect	oidc-usermodel-property-mapper	\N	464bffc3-b3fa-4493-bf68-99378bee7460
809aa4ab-bcc5-4090-9eb7-f2e320308580	profile	openid-connect	oidc-usermodel-attribute-mapper	\N	464bffc3-b3fa-4493-bf68-99378bee7460
31b5851c-b735-41f8-af7b-522ce7d2f1b0	picture	openid-connect	oidc-usermodel-attribute-mapper	\N	464bffc3-b3fa-4493-bf68-99378bee7460
4dc694a5-b886-4fb3-b9d3-4e2a2900481c	website	openid-connect	oidc-usermodel-attribute-mapper	\N	464bffc3-b3fa-4493-bf68-99378bee7460
9aaeb6d0-6273-466b-b597-f01ae2c5ca69	gender	openid-connect	oidc-usermodel-attribute-mapper	\N	464bffc3-b3fa-4493-bf68-99378bee7460
8ac78a42-5430-4fb9-b3dc-654e26b02c32	birthdate	openid-connect	oidc-usermodel-attribute-mapper	\N	464bffc3-b3fa-4493-bf68-99378bee7460
0f44ad82-8153-4452-9845-b4862964e759	zoneinfo	openid-connect	oidc-usermodel-attribute-mapper	\N	464bffc3-b3fa-4493-bf68-99378bee7460
844d4855-2661-47b3-9d34-d7b04e92d95d	locale	openid-connect	oidc-usermodel-attribute-mapper	\N	464bffc3-b3fa-4493-bf68-99378bee7460
5cf88100-1fb7-42ad-93af-b8d66ac0a07b	updated at	openid-connect	oidc-usermodel-attribute-mapper	\N	464bffc3-b3fa-4493-bf68-99378bee7460
df73e90f-c35d-4216-b1b4-7ca668cab48e	email	openid-connect	oidc-usermodel-property-mapper	\N	d3eda79f-2105-4fb6-9778-ce734e615834
e2156c9e-ab6a-4f30-a424-4aceba8ba5b1	email verified	openid-connect	oidc-usermodel-property-mapper	\N	d3eda79f-2105-4fb6-9778-ce734e615834
a1b233ab-2d60-4cda-9c8f-894d6895aa32	address	openid-connect	oidc-address-mapper	\N	d72156b9-9a80-41a2-9068-2c189f9c1bf7
66ccb0ac-ff17-4d63-bd65-935d0fac2384	phone number	openid-connect	oidc-usermodel-attribute-mapper	\N	e87eceff-e962-4875-93b7-55ef4cc30032
f5dbc53a-d093-4845-9637-794c39600842	phone number verified	openid-connect	oidc-usermodel-attribute-mapper	\N	e87eceff-e962-4875-93b7-55ef4cc30032
737045d1-deed-42ef-b87a-e3668781fca5	realm roles	openid-connect	oidc-usermodel-realm-role-mapper	\N	339b2f1b-055e-40ee-ab1e-34afd3809e15
38295737-a880-402a-8d2b-d5f5f498c700	client roles	openid-connect	oidc-usermodel-client-role-mapper	\N	339b2f1b-055e-40ee-ab1e-34afd3809e15
ff896fa6-2eb0-448a-8ac9-2eef40a5003d	audience resolve	openid-connect	oidc-audience-resolve-mapper	\N	339b2f1b-055e-40ee-ab1e-34afd3809e15
f6b0ef0a-98ee-4b70-8340-6d76d50e4087	allowed web origins	openid-connect	oidc-allowed-origins-mapper	\N	34e0657e-0fbd-47ae-8ec2-4aacf8b1dc09
7099d05b-3a43-4f20-8580-f129f49abcd2	upn	openid-connect	oidc-usermodel-property-mapper	\N	b90377ac-b066-416c-8051-022d1a66217c
3196de17-d57c-48fb-a360-0e295dc9de5f	groups	openid-connect	oidc-usermodel-realm-role-mapper	\N	b90377ac-b066-416c-8051-022d1a66217c
d3befa2f-e745-450f-86d7-2f4a98497517	acr loa level	openid-connect	oidc-acr-mapper	\N	584da0a3-66aa-4baa-ba3c-d7633d7c1160
8eddcaf9-62c4-4d7d-87f1-7f69eaa760e8	audience resolve	openid-connect	oidc-audience-resolve-mapper	9e4684e7-1f36-4bbf-a0d1-f9c156a8a2e2	\N
ef9ac321-7b48-4c64-9883-be6723a2e5e3	role list	saml	saml-role-list-mapper	\N	9db53642-e6f8-4e75-bc1d-dc1c863eaa98
7617fb7e-aa63-4575-b5b1-5dcff16d16c7	full name	openid-connect	oidc-full-name-mapper	\N	8ec7285c-58e2-42d6-90ce-68ffb6f871c5
e6bdfa33-bb4d-4e86-8ab1-c61a22d9585a	family name	openid-connect	oidc-usermodel-property-mapper	\N	8ec7285c-58e2-42d6-90ce-68ffb6f871c5
eeada319-a4d8-4452-868d-c5baea677903	given name	openid-connect	oidc-usermodel-property-mapper	\N	8ec7285c-58e2-42d6-90ce-68ffb6f871c5
954fec6e-bcfe-4bee-837d-f7c368a32e0a	middle name	openid-connect	oidc-usermodel-attribute-mapper	\N	8ec7285c-58e2-42d6-90ce-68ffb6f871c5
a7a7b5b0-97df-465d-a923-93861ca31477	nickname	openid-connect	oidc-usermodel-attribute-mapper	\N	8ec7285c-58e2-42d6-90ce-68ffb6f871c5
707e1e6a-73a0-4dcc-8f16-49973a35af82	username	openid-connect	oidc-usermodel-property-mapper	\N	8ec7285c-58e2-42d6-90ce-68ffb6f871c5
4f9062d2-3d85-407d-8712-52844f7f0fa4	profile	openid-connect	oidc-usermodel-attribute-mapper	\N	8ec7285c-58e2-42d6-90ce-68ffb6f871c5
ad0798d0-06d6-4d54-b38c-fa52d700a6c0	picture	openid-connect	oidc-usermodel-attribute-mapper	\N	8ec7285c-58e2-42d6-90ce-68ffb6f871c5
858c3498-0514-4392-a4f9-ded712a17234	website	openid-connect	oidc-usermodel-attribute-mapper	\N	8ec7285c-58e2-42d6-90ce-68ffb6f871c5
c2f8e414-ce2f-480a-a306-4c292a56b9ad	gender	openid-connect	oidc-usermodel-attribute-mapper	\N	8ec7285c-58e2-42d6-90ce-68ffb6f871c5
4a37996d-3642-4ca6-873c-77343dee5015	birthdate	openid-connect	oidc-usermodel-attribute-mapper	\N	8ec7285c-58e2-42d6-90ce-68ffb6f871c5
b3b1aa37-9507-4016-bd78-3b878ddc851f	zoneinfo	openid-connect	oidc-usermodel-attribute-mapper	\N	8ec7285c-58e2-42d6-90ce-68ffb6f871c5
6b35194f-2bde-4c7c-b194-ebacca439259	locale	openid-connect	oidc-usermodel-attribute-mapper	\N	8ec7285c-58e2-42d6-90ce-68ffb6f871c5
6ce045a7-8ca5-40f2-9acc-dd398a36c603	updated at	openid-connect	oidc-usermodel-attribute-mapper	\N	8ec7285c-58e2-42d6-90ce-68ffb6f871c5
9b0d775a-086c-41a2-b485-911b2f7d1740	email	openid-connect	oidc-usermodel-property-mapper	\N	5f1dc33b-5e36-4f1e-a826-c8197297b919
c74159f5-6634-47d1-bd11-b1ecb54d6660	email verified	openid-connect	oidc-usermodel-property-mapper	\N	5f1dc33b-5e36-4f1e-a826-c8197297b919
88e3b23c-08bb-4da1-80e0-ba7774801395	address	openid-connect	oidc-address-mapper	\N	569500f8-3113-42af-9b3b-165b1b8f188f
b2e4e08d-2e15-4d41-9e05-fead6b8798e2	phone number	openid-connect	oidc-usermodel-attribute-mapper	\N	9db26fec-feea-4d24-a802-799be662a562
482d8bfd-0099-42d2-9e20-ea90000eb3e9	phone number verified	openid-connect	oidc-usermodel-attribute-mapper	\N	9db26fec-feea-4d24-a802-799be662a562
00044747-4355-4388-a68c-ccd32b4de2b8	realm roles	openid-connect	oidc-usermodel-realm-role-mapper	\N	29c47719-3609-4ee9-a7d5-c358459fd40e
49b0527d-ed9d-4724-b0b0-0a8bc670eb30	client roles	openid-connect	oidc-usermodel-client-role-mapper	\N	29c47719-3609-4ee9-a7d5-c358459fd40e
16f4584a-33ca-4a6a-a49a-18d0af525d0a	audience resolve	openid-connect	oidc-audience-resolve-mapper	\N	29c47719-3609-4ee9-a7d5-c358459fd40e
fac98860-0f83-4bcc-85b9-3a8ac26aa68d	allowed web origins	openid-connect	oidc-allowed-origins-mapper	\N	d5fdbad2-73ad-417b-ae66-e65b5d6f2239
d8d1d136-f560-4aa7-b9fe-84e447e687af	upn	openid-connect	oidc-usermodel-property-mapper	\N	9bac8767-31e1-41db-97d4-72dbcd4bfbb5
afa2d9c2-6407-41de-8a1c-3a43d51dc2d4	groups	openid-connect	oidc-usermodel-realm-role-mapper	\N	9bac8767-31e1-41db-97d4-72dbcd4bfbb5
3c39982a-16bf-4f11-a817-ca2673dc7772	acr loa level	openid-connect	oidc-acr-mapper	\N	3defc30c-ec86-4800-a53a-3a27f84508e5
66e4663d-4acd-4ada-8acd-2c034e359248	locale	openid-connect	oidc-usermodel-attribute-mapper	327efb3f-a5b2-4cf8-9b6d-95ac614dfab1	\N
a4a0ebfd-e90b-42e3-aa92-5c8b51bf3729	Client ID	openid-connect	oidc-usersessionmodel-note-mapper	d18341ec-c15a-47f7-bc4e-58023ff7acb8	\N
47840704-7f8a-4d51-9bc5-d1f1fe8447bb	Client Host	openid-connect	oidc-usersessionmodel-note-mapper	d18341ec-c15a-47f7-bc4e-58023ff7acb8	\N
0cba7e63-8ca2-46e4-b59f-990b4f1d721d	Client IP Address	openid-connect	oidc-usersessionmodel-note-mapper	d18341ec-c15a-47f7-bc4e-58023ff7acb8	\N
\.


--
-- Data for Name: protocol_mapper_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.protocol_mapper_config (protocol_mapper_id, value, name) FROM stdin;
d2b19792-7ab8-408b-899c-e692cc13292e	true	userinfo.token.claim
d2b19792-7ab8-408b-899c-e692cc13292e	locale	user.attribute
d2b19792-7ab8-408b-899c-e692cc13292e	true	id.token.claim
d2b19792-7ab8-408b-899c-e692cc13292e	true	access.token.claim
d2b19792-7ab8-408b-899c-e692cc13292e	locale	claim.name
d2b19792-7ab8-408b-899c-e692cc13292e	String	jsonType.label
cba93806-465d-4702-948c-a6b63cb16b44	false	single
cba93806-465d-4702-948c-a6b63cb16b44	Basic	attribute.nameformat
cba93806-465d-4702-948c-a6b63cb16b44	Role	attribute.name
9dae4e6a-9728-44ca-9a8c-50eab553a74b	true	userinfo.token.claim
9dae4e6a-9728-44ca-9a8c-50eab553a74b	true	id.token.claim
9dae4e6a-9728-44ca-9a8c-50eab553a74b	true	access.token.claim
3313ebcb-3149-467b-9d19-ad6eab88026f	true	userinfo.token.claim
3313ebcb-3149-467b-9d19-ad6eab88026f	lastName	user.attribute
3313ebcb-3149-467b-9d19-ad6eab88026f	true	id.token.claim
3313ebcb-3149-467b-9d19-ad6eab88026f	true	access.token.claim
3313ebcb-3149-467b-9d19-ad6eab88026f	family_name	claim.name
3313ebcb-3149-467b-9d19-ad6eab88026f	String	jsonType.label
8389245e-8a71-4a2c-bbd5-bb8ac6f81d48	true	userinfo.token.claim
8389245e-8a71-4a2c-bbd5-bb8ac6f81d48	firstName	user.attribute
8389245e-8a71-4a2c-bbd5-bb8ac6f81d48	true	id.token.claim
8389245e-8a71-4a2c-bbd5-bb8ac6f81d48	true	access.token.claim
8389245e-8a71-4a2c-bbd5-bb8ac6f81d48	given_name	claim.name
8389245e-8a71-4a2c-bbd5-bb8ac6f81d48	String	jsonType.label
c8a748f5-7d5a-4e96-8520-7a4b44a3911b	true	userinfo.token.claim
c8a748f5-7d5a-4e96-8520-7a4b44a3911b	middleName	user.attribute
c8a748f5-7d5a-4e96-8520-7a4b44a3911b	true	id.token.claim
c8a748f5-7d5a-4e96-8520-7a4b44a3911b	true	access.token.claim
c8a748f5-7d5a-4e96-8520-7a4b44a3911b	middle_name	claim.name
c8a748f5-7d5a-4e96-8520-7a4b44a3911b	String	jsonType.label
5ae8ec5d-a3b7-448e-9cf1-805c2a3734a1	true	userinfo.token.claim
5ae8ec5d-a3b7-448e-9cf1-805c2a3734a1	nickname	user.attribute
5ae8ec5d-a3b7-448e-9cf1-805c2a3734a1	true	id.token.claim
5ae8ec5d-a3b7-448e-9cf1-805c2a3734a1	true	access.token.claim
5ae8ec5d-a3b7-448e-9cf1-805c2a3734a1	nickname	claim.name
5ae8ec5d-a3b7-448e-9cf1-805c2a3734a1	String	jsonType.label
4c385d1f-6909-4d12-bbaf-c5e9774f7500	true	userinfo.token.claim
4c385d1f-6909-4d12-bbaf-c5e9774f7500	username	user.attribute
4c385d1f-6909-4d12-bbaf-c5e9774f7500	true	id.token.claim
4c385d1f-6909-4d12-bbaf-c5e9774f7500	true	access.token.claim
4c385d1f-6909-4d12-bbaf-c5e9774f7500	preferred_username	claim.name
4c385d1f-6909-4d12-bbaf-c5e9774f7500	String	jsonType.label
809aa4ab-bcc5-4090-9eb7-f2e320308580	true	userinfo.token.claim
809aa4ab-bcc5-4090-9eb7-f2e320308580	profile	user.attribute
809aa4ab-bcc5-4090-9eb7-f2e320308580	true	id.token.claim
809aa4ab-bcc5-4090-9eb7-f2e320308580	true	access.token.claim
809aa4ab-bcc5-4090-9eb7-f2e320308580	profile	claim.name
809aa4ab-bcc5-4090-9eb7-f2e320308580	String	jsonType.label
31b5851c-b735-41f8-af7b-522ce7d2f1b0	true	userinfo.token.claim
31b5851c-b735-41f8-af7b-522ce7d2f1b0	picture	user.attribute
31b5851c-b735-41f8-af7b-522ce7d2f1b0	true	id.token.claim
31b5851c-b735-41f8-af7b-522ce7d2f1b0	true	access.token.claim
31b5851c-b735-41f8-af7b-522ce7d2f1b0	picture	claim.name
31b5851c-b735-41f8-af7b-522ce7d2f1b0	String	jsonType.label
4dc694a5-b886-4fb3-b9d3-4e2a2900481c	true	userinfo.token.claim
4dc694a5-b886-4fb3-b9d3-4e2a2900481c	website	user.attribute
4dc694a5-b886-4fb3-b9d3-4e2a2900481c	true	id.token.claim
4dc694a5-b886-4fb3-b9d3-4e2a2900481c	true	access.token.claim
4dc694a5-b886-4fb3-b9d3-4e2a2900481c	website	claim.name
4dc694a5-b886-4fb3-b9d3-4e2a2900481c	String	jsonType.label
9aaeb6d0-6273-466b-b597-f01ae2c5ca69	true	userinfo.token.claim
9aaeb6d0-6273-466b-b597-f01ae2c5ca69	gender	user.attribute
9aaeb6d0-6273-466b-b597-f01ae2c5ca69	true	id.token.claim
9aaeb6d0-6273-466b-b597-f01ae2c5ca69	true	access.token.claim
9aaeb6d0-6273-466b-b597-f01ae2c5ca69	gender	claim.name
9aaeb6d0-6273-466b-b597-f01ae2c5ca69	String	jsonType.label
8ac78a42-5430-4fb9-b3dc-654e26b02c32	true	userinfo.token.claim
8ac78a42-5430-4fb9-b3dc-654e26b02c32	birthdate	user.attribute
8ac78a42-5430-4fb9-b3dc-654e26b02c32	true	id.token.claim
8ac78a42-5430-4fb9-b3dc-654e26b02c32	true	access.token.claim
8ac78a42-5430-4fb9-b3dc-654e26b02c32	birthdate	claim.name
8ac78a42-5430-4fb9-b3dc-654e26b02c32	String	jsonType.label
0f44ad82-8153-4452-9845-b4862964e759	true	userinfo.token.claim
0f44ad82-8153-4452-9845-b4862964e759	zoneinfo	user.attribute
0f44ad82-8153-4452-9845-b4862964e759	true	id.token.claim
0f44ad82-8153-4452-9845-b4862964e759	true	access.token.claim
0f44ad82-8153-4452-9845-b4862964e759	zoneinfo	claim.name
0f44ad82-8153-4452-9845-b4862964e759	String	jsonType.label
844d4855-2661-47b3-9d34-d7b04e92d95d	true	userinfo.token.claim
844d4855-2661-47b3-9d34-d7b04e92d95d	locale	user.attribute
844d4855-2661-47b3-9d34-d7b04e92d95d	true	id.token.claim
844d4855-2661-47b3-9d34-d7b04e92d95d	true	access.token.claim
844d4855-2661-47b3-9d34-d7b04e92d95d	locale	claim.name
844d4855-2661-47b3-9d34-d7b04e92d95d	String	jsonType.label
5cf88100-1fb7-42ad-93af-b8d66ac0a07b	true	userinfo.token.claim
5cf88100-1fb7-42ad-93af-b8d66ac0a07b	updatedAt	user.attribute
5cf88100-1fb7-42ad-93af-b8d66ac0a07b	true	id.token.claim
5cf88100-1fb7-42ad-93af-b8d66ac0a07b	true	access.token.claim
5cf88100-1fb7-42ad-93af-b8d66ac0a07b	updated_at	claim.name
5cf88100-1fb7-42ad-93af-b8d66ac0a07b	long	jsonType.label
df73e90f-c35d-4216-b1b4-7ca668cab48e	true	userinfo.token.claim
df73e90f-c35d-4216-b1b4-7ca668cab48e	email	user.attribute
df73e90f-c35d-4216-b1b4-7ca668cab48e	true	id.token.claim
df73e90f-c35d-4216-b1b4-7ca668cab48e	true	access.token.claim
df73e90f-c35d-4216-b1b4-7ca668cab48e	email	claim.name
df73e90f-c35d-4216-b1b4-7ca668cab48e	String	jsonType.label
e2156c9e-ab6a-4f30-a424-4aceba8ba5b1	true	userinfo.token.claim
e2156c9e-ab6a-4f30-a424-4aceba8ba5b1	emailVerified	user.attribute
e2156c9e-ab6a-4f30-a424-4aceba8ba5b1	true	id.token.claim
e2156c9e-ab6a-4f30-a424-4aceba8ba5b1	true	access.token.claim
e2156c9e-ab6a-4f30-a424-4aceba8ba5b1	email_verified	claim.name
e2156c9e-ab6a-4f30-a424-4aceba8ba5b1	boolean	jsonType.label
a1b233ab-2d60-4cda-9c8f-894d6895aa32	formatted	user.attribute.formatted
a1b233ab-2d60-4cda-9c8f-894d6895aa32	country	user.attribute.country
a1b233ab-2d60-4cda-9c8f-894d6895aa32	postal_code	user.attribute.postal_code
a1b233ab-2d60-4cda-9c8f-894d6895aa32	true	userinfo.token.claim
a1b233ab-2d60-4cda-9c8f-894d6895aa32	street	user.attribute.street
a1b233ab-2d60-4cda-9c8f-894d6895aa32	true	id.token.claim
a1b233ab-2d60-4cda-9c8f-894d6895aa32	region	user.attribute.region
a1b233ab-2d60-4cda-9c8f-894d6895aa32	true	access.token.claim
a1b233ab-2d60-4cda-9c8f-894d6895aa32	locality	user.attribute.locality
66ccb0ac-ff17-4d63-bd65-935d0fac2384	true	userinfo.token.claim
66ccb0ac-ff17-4d63-bd65-935d0fac2384	phoneNumber	user.attribute
66ccb0ac-ff17-4d63-bd65-935d0fac2384	true	id.token.claim
66ccb0ac-ff17-4d63-bd65-935d0fac2384	true	access.token.claim
66ccb0ac-ff17-4d63-bd65-935d0fac2384	phone_number	claim.name
66ccb0ac-ff17-4d63-bd65-935d0fac2384	String	jsonType.label
f5dbc53a-d093-4845-9637-794c39600842	true	userinfo.token.claim
f5dbc53a-d093-4845-9637-794c39600842	phoneNumberVerified	user.attribute
f5dbc53a-d093-4845-9637-794c39600842	true	id.token.claim
f5dbc53a-d093-4845-9637-794c39600842	true	access.token.claim
f5dbc53a-d093-4845-9637-794c39600842	phone_number_verified	claim.name
f5dbc53a-d093-4845-9637-794c39600842	boolean	jsonType.label
737045d1-deed-42ef-b87a-e3668781fca5	true	multivalued
737045d1-deed-42ef-b87a-e3668781fca5	foo	user.attribute
737045d1-deed-42ef-b87a-e3668781fca5	true	access.token.claim
737045d1-deed-42ef-b87a-e3668781fca5	realm_access.roles	claim.name
737045d1-deed-42ef-b87a-e3668781fca5	String	jsonType.label
38295737-a880-402a-8d2b-d5f5f498c700	true	multivalued
38295737-a880-402a-8d2b-d5f5f498c700	foo	user.attribute
38295737-a880-402a-8d2b-d5f5f498c700	true	access.token.claim
38295737-a880-402a-8d2b-d5f5f498c700	resource_access.${client_id}.roles	claim.name
38295737-a880-402a-8d2b-d5f5f498c700	String	jsonType.label
7099d05b-3a43-4f20-8580-f129f49abcd2	true	userinfo.token.claim
7099d05b-3a43-4f20-8580-f129f49abcd2	username	user.attribute
7099d05b-3a43-4f20-8580-f129f49abcd2	true	id.token.claim
7099d05b-3a43-4f20-8580-f129f49abcd2	true	access.token.claim
7099d05b-3a43-4f20-8580-f129f49abcd2	upn	claim.name
7099d05b-3a43-4f20-8580-f129f49abcd2	String	jsonType.label
3196de17-d57c-48fb-a360-0e295dc9de5f	true	multivalued
3196de17-d57c-48fb-a360-0e295dc9de5f	foo	user.attribute
3196de17-d57c-48fb-a360-0e295dc9de5f	true	id.token.claim
3196de17-d57c-48fb-a360-0e295dc9de5f	true	access.token.claim
3196de17-d57c-48fb-a360-0e295dc9de5f	groups	claim.name
3196de17-d57c-48fb-a360-0e295dc9de5f	String	jsonType.label
d3befa2f-e745-450f-86d7-2f4a98497517	true	id.token.claim
d3befa2f-e745-450f-86d7-2f4a98497517	true	access.token.claim
ef9ac321-7b48-4c64-9883-be6723a2e5e3	false	single
ef9ac321-7b48-4c64-9883-be6723a2e5e3	Basic	attribute.nameformat
ef9ac321-7b48-4c64-9883-be6723a2e5e3	Role	attribute.name
7617fb7e-aa63-4575-b5b1-5dcff16d16c7	true	userinfo.token.claim
7617fb7e-aa63-4575-b5b1-5dcff16d16c7	true	id.token.claim
7617fb7e-aa63-4575-b5b1-5dcff16d16c7	true	access.token.claim
e6bdfa33-bb4d-4e86-8ab1-c61a22d9585a	true	userinfo.token.claim
e6bdfa33-bb4d-4e86-8ab1-c61a22d9585a	lastName	user.attribute
e6bdfa33-bb4d-4e86-8ab1-c61a22d9585a	true	id.token.claim
e6bdfa33-bb4d-4e86-8ab1-c61a22d9585a	true	access.token.claim
e6bdfa33-bb4d-4e86-8ab1-c61a22d9585a	family_name	claim.name
e6bdfa33-bb4d-4e86-8ab1-c61a22d9585a	String	jsonType.label
eeada319-a4d8-4452-868d-c5baea677903	true	userinfo.token.claim
eeada319-a4d8-4452-868d-c5baea677903	firstName	user.attribute
eeada319-a4d8-4452-868d-c5baea677903	true	id.token.claim
eeada319-a4d8-4452-868d-c5baea677903	true	access.token.claim
eeada319-a4d8-4452-868d-c5baea677903	given_name	claim.name
eeada319-a4d8-4452-868d-c5baea677903	String	jsonType.label
954fec6e-bcfe-4bee-837d-f7c368a32e0a	true	userinfo.token.claim
954fec6e-bcfe-4bee-837d-f7c368a32e0a	middleName	user.attribute
954fec6e-bcfe-4bee-837d-f7c368a32e0a	true	id.token.claim
954fec6e-bcfe-4bee-837d-f7c368a32e0a	true	access.token.claim
954fec6e-bcfe-4bee-837d-f7c368a32e0a	middle_name	claim.name
954fec6e-bcfe-4bee-837d-f7c368a32e0a	String	jsonType.label
a7a7b5b0-97df-465d-a923-93861ca31477	true	userinfo.token.claim
a7a7b5b0-97df-465d-a923-93861ca31477	nickname	user.attribute
a7a7b5b0-97df-465d-a923-93861ca31477	true	id.token.claim
a7a7b5b0-97df-465d-a923-93861ca31477	true	access.token.claim
a7a7b5b0-97df-465d-a923-93861ca31477	nickname	claim.name
a7a7b5b0-97df-465d-a923-93861ca31477	String	jsonType.label
707e1e6a-73a0-4dcc-8f16-49973a35af82	true	userinfo.token.claim
707e1e6a-73a0-4dcc-8f16-49973a35af82	username	user.attribute
707e1e6a-73a0-4dcc-8f16-49973a35af82	true	id.token.claim
707e1e6a-73a0-4dcc-8f16-49973a35af82	true	access.token.claim
707e1e6a-73a0-4dcc-8f16-49973a35af82	preferred_username	claim.name
707e1e6a-73a0-4dcc-8f16-49973a35af82	String	jsonType.label
4f9062d2-3d85-407d-8712-52844f7f0fa4	true	userinfo.token.claim
4f9062d2-3d85-407d-8712-52844f7f0fa4	profile	user.attribute
4f9062d2-3d85-407d-8712-52844f7f0fa4	true	id.token.claim
4f9062d2-3d85-407d-8712-52844f7f0fa4	true	access.token.claim
4f9062d2-3d85-407d-8712-52844f7f0fa4	profile	claim.name
4f9062d2-3d85-407d-8712-52844f7f0fa4	String	jsonType.label
ad0798d0-06d6-4d54-b38c-fa52d700a6c0	true	userinfo.token.claim
ad0798d0-06d6-4d54-b38c-fa52d700a6c0	picture	user.attribute
ad0798d0-06d6-4d54-b38c-fa52d700a6c0	true	id.token.claim
ad0798d0-06d6-4d54-b38c-fa52d700a6c0	true	access.token.claim
ad0798d0-06d6-4d54-b38c-fa52d700a6c0	picture	claim.name
ad0798d0-06d6-4d54-b38c-fa52d700a6c0	String	jsonType.label
858c3498-0514-4392-a4f9-ded712a17234	true	userinfo.token.claim
858c3498-0514-4392-a4f9-ded712a17234	website	user.attribute
858c3498-0514-4392-a4f9-ded712a17234	true	id.token.claim
858c3498-0514-4392-a4f9-ded712a17234	true	access.token.claim
858c3498-0514-4392-a4f9-ded712a17234	website	claim.name
858c3498-0514-4392-a4f9-ded712a17234	String	jsonType.label
c2f8e414-ce2f-480a-a306-4c292a56b9ad	true	userinfo.token.claim
c2f8e414-ce2f-480a-a306-4c292a56b9ad	gender	user.attribute
c2f8e414-ce2f-480a-a306-4c292a56b9ad	true	id.token.claim
c2f8e414-ce2f-480a-a306-4c292a56b9ad	true	access.token.claim
c2f8e414-ce2f-480a-a306-4c292a56b9ad	gender	claim.name
c2f8e414-ce2f-480a-a306-4c292a56b9ad	String	jsonType.label
4a37996d-3642-4ca6-873c-77343dee5015	true	userinfo.token.claim
4a37996d-3642-4ca6-873c-77343dee5015	birthdate	user.attribute
4a37996d-3642-4ca6-873c-77343dee5015	true	id.token.claim
4a37996d-3642-4ca6-873c-77343dee5015	true	access.token.claim
4a37996d-3642-4ca6-873c-77343dee5015	birthdate	claim.name
4a37996d-3642-4ca6-873c-77343dee5015	String	jsonType.label
b3b1aa37-9507-4016-bd78-3b878ddc851f	true	userinfo.token.claim
b3b1aa37-9507-4016-bd78-3b878ddc851f	zoneinfo	user.attribute
b3b1aa37-9507-4016-bd78-3b878ddc851f	true	id.token.claim
b3b1aa37-9507-4016-bd78-3b878ddc851f	true	access.token.claim
b3b1aa37-9507-4016-bd78-3b878ddc851f	zoneinfo	claim.name
b3b1aa37-9507-4016-bd78-3b878ddc851f	String	jsonType.label
6b35194f-2bde-4c7c-b194-ebacca439259	true	userinfo.token.claim
6b35194f-2bde-4c7c-b194-ebacca439259	locale	user.attribute
6b35194f-2bde-4c7c-b194-ebacca439259	true	id.token.claim
6b35194f-2bde-4c7c-b194-ebacca439259	true	access.token.claim
6b35194f-2bde-4c7c-b194-ebacca439259	locale	claim.name
6b35194f-2bde-4c7c-b194-ebacca439259	String	jsonType.label
6ce045a7-8ca5-40f2-9acc-dd398a36c603	true	userinfo.token.claim
6ce045a7-8ca5-40f2-9acc-dd398a36c603	updatedAt	user.attribute
6ce045a7-8ca5-40f2-9acc-dd398a36c603	true	id.token.claim
6ce045a7-8ca5-40f2-9acc-dd398a36c603	true	access.token.claim
6ce045a7-8ca5-40f2-9acc-dd398a36c603	updated_at	claim.name
6ce045a7-8ca5-40f2-9acc-dd398a36c603	long	jsonType.label
9b0d775a-086c-41a2-b485-911b2f7d1740	true	userinfo.token.claim
9b0d775a-086c-41a2-b485-911b2f7d1740	email	user.attribute
9b0d775a-086c-41a2-b485-911b2f7d1740	true	id.token.claim
9b0d775a-086c-41a2-b485-911b2f7d1740	true	access.token.claim
9b0d775a-086c-41a2-b485-911b2f7d1740	email	claim.name
9b0d775a-086c-41a2-b485-911b2f7d1740	String	jsonType.label
c74159f5-6634-47d1-bd11-b1ecb54d6660	true	userinfo.token.claim
c74159f5-6634-47d1-bd11-b1ecb54d6660	emailVerified	user.attribute
c74159f5-6634-47d1-bd11-b1ecb54d6660	true	id.token.claim
c74159f5-6634-47d1-bd11-b1ecb54d6660	true	access.token.claim
c74159f5-6634-47d1-bd11-b1ecb54d6660	email_verified	claim.name
c74159f5-6634-47d1-bd11-b1ecb54d6660	boolean	jsonType.label
88e3b23c-08bb-4da1-80e0-ba7774801395	formatted	user.attribute.formatted
88e3b23c-08bb-4da1-80e0-ba7774801395	country	user.attribute.country
88e3b23c-08bb-4da1-80e0-ba7774801395	postal_code	user.attribute.postal_code
88e3b23c-08bb-4da1-80e0-ba7774801395	true	userinfo.token.claim
88e3b23c-08bb-4da1-80e0-ba7774801395	street	user.attribute.street
88e3b23c-08bb-4da1-80e0-ba7774801395	true	id.token.claim
88e3b23c-08bb-4da1-80e0-ba7774801395	region	user.attribute.region
88e3b23c-08bb-4da1-80e0-ba7774801395	true	access.token.claim
88e3b23c-08bb-4da1-80e0-ba7774801395	locality	user.attribute.locality
b2e4e08d-2e15-4d41-9e05-fead6b8798e2	true	userinfo.token.claim
b2e4e08d-2e15-4d41-9e05-fead6b8798e2	phoneNumber	user.attribute
b2e4e08d-2e15-4d41-9e05-fead6b8798e2	true	id.token.claim
b2e4e08d-2e15-4d41-9e05-fead6b8798e2	true	access.token.claim
b2e4e08d-2e15-4d41-9e05-fead6b8798e2	phone_number	claim.name
b2e4e08d-2e15-4d41-9e05-fead6b8798e2	String	jsonType.label
482d8bfd-0099-42d2-9e20-ea90000eb3e9	true	userinfo.token.claim
482d8bfd-0099-42d2-9e20-ea90000eb3e9	phoneNumberVerified	user.attribute
482d8bfd-0099-42d2-9e20-ea90000eb3e9	true	id.token.claim
482d8bfd-0099-42d2-9e20-ea90000eb3e9	true	access.token.claim
482d8bfd-0099-42d2-9e20-ea90000eb3e9	phone_number_verified	claim.name
482d8bfd-0099-42d2-9e20-ea90000eb3e9	boolean	jsonType.label
00044747-4355-4388-a68c-ccd32b4de2b8	true	multivalued
00044747-4355-4388-a68c-ccd32b4de2b8	foo	user.attribute
00044747-4355-4388-a68c-ccd32b4de2b8	true	access.token.claim
00044747-4355-4388-a68c-ccd32b4de2b8	realm_access.roles	claim.name
00044747-4355-4388-a68c-ccd32b4de2b8	String	jsonType.label
49b0527d-ed9d-4724-b0b0-0a8bc670eb30	true	multivalued
49b0527d-ed9d-4724-b0b0-0a8bc670eb30	foo	user.attribute
49b0527d-ed9d-4724-b0b0-0a8bc670eb30	true	access.token.claim
49b0527d-ed9d-4724-b0b0-0a8bc670eb30	resource_access.${client_id}.roles	claim.name
49b0527d-ed9d-4724-b0b0-0a8bc670eb30	String	jsonType.label
d8d1d136-f560-4aa7-b9fe-84e447e687af	true	userinfo.token.claim
d8d1d136-f560-4aa7-b9fe-84e447e687af	username	user.attribute
d8d1d136-f560-4aa7-b9fe-84e447e687af	true	id.token.claim
d8d1d136-f560-4aa7-b9fe-84e447e687af	true	access.token.claim
d8d1d136-f560-4aa7-b9fe-84e447e687af	upn	claim.name
d8d1d136-f560-4aa7-b9fe-84e447e687af	String	jsonType.label
afa2d9c2-6407-41de-8a1c-3a43d51dc2d4	true	multivalued
afa2d9c2-6407-41de-8a1c-3a43d51dc2d4	foo	user.attribute
afa2d9c2-6407-41de-8a1c-3a43d51dc2d4	true	id.token.claim
afa2d9c2-6407-41de-8a1c-3a43d51dc2d4	true	access.token.claim
afa2d9c2-6407-41de-8a1c-3a43d51dc2d4	groups	claim.name
afa2d9c2-6407-41de-8a1c-3a43d51dc2d4	String	jsonType.label
3c39982a-16bf-4f11-a817-ca2673dc7772	true	id.token.claim
3c39982a-16bf-4f11-a817-ca2673dc7772	true	access.token.claim
66e4663d-4acd-4ada-8acd-2c034e359248	true	userinfo.token.claim
66e4663d-4acd-4ada-8acd-2c034e359248	locale	user.attribute
66e4663d-4acd-4ada-8acd-2c034e359248	true	id.token.claim
66e4663d-4acd-4ada-8acd-2c034e359248	true	access.token.claim
66e4663d-4acd-4ada-8acd-2c034e359248	locale	claim.name
66e4663d-4acd-4ada-8acd-2c034e359248	String	jsonType.label
a4a0ebfd-e90b-42e3-aa92-5c8b51bf3729	clientId	user.session.note
a4a0ebfd-e90b-42e3-aa92-5c8b51bf3729	true	id.token.claim
a4a0ebfd-e90b-42e3-aa92-5c8b51bf3729	true	access.token.claim
a4a0ebfd-e90b-42e3-aa92-5c8b51bf3729	clientId	claim.name
a4a0ebfd-e90b-42e3-aa92-5c8b51bf3729	String	jsonType.label
47840704-7f8a-4d51-9bc5-d1f1fe8447bb	clientHost	user.session.note
47840704-7f8a-4d51-9bc5-d1f1fe8447bb	true	id.token.claim
47840704-7f8a-4d51-9bc5-d1f1fe8447bb	true	access.token.claim
47840704-7f8a-4d51-9bc5-d1f1fe8447bb	clientHost	claim.name
47840704-7f8a-4d51-9bc5-d1f1fe8447bb	String	jsonType.label
0cba7e63-8ca2-46e4-b59f-990b4f1d721d	clientAddress	user.session.note
0cba7e63-8ca2-46e4-b59f-990b4f1d721d	true	id.token.claim
0cba7e63-8ca2-46e4-b59f-990b4f1d721d	true	access.token.claim
0cba7e63-8ca2-46e4-b59f-990b4f1d721d	clientAddress	claim.name
0cba7e63-8ca2-46e4-b59f-990b4f1d721d	String	jsonType.label
\.


--
-- Data for Name: realm; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.realm (id, access_code_lifespan, user_action_lifespan, access_token_lifespan, account_theme, admin_theme, email_theme, enabled, events_enabled, events_expiration, login_theme, name, not_before, password_policy, registration_allowed, remember_me, reset_password_allowed, social, ssl_required, sso_idle_timeout, sso_max_lifespan, update_profile_on_soc_login, verify_email, master_admin_client, login_lifespan, internationalization_enabled, default_locale, reg_email_as_username, admin_events_enabled, admin_events_details_enabled, edit_username_allowed, otp_policy_counter, otp_policy_window, otp_policy_period, otp_policy_digits, otp_policy_alg, otp_policy_type, browser_flow, registration_flow, direct_grant_flow, reset_credentials_flow, client_auth_flow, offline_session_idle_timeout, revoke_refresh_token, access_token_life_implicit, login_with_email_allowed, duplicate_emails_allowed, docker_auth_flow, refresh_token_max_reuse, allow_user_managed_access, sso_max_lifespan_remember_me, sso_idle_timeout_remember_me, default_role) FROM stdin;
eaaeb62f-362b-40bb-b7f1-d927afd6a6e9	60	300	300	\N	\N	\N	t	f	0	\N	hmmyzon	0	\N	t	f	f	f	EXTERNAL	1800	36000	f	f	c29e055b-142f-4d40-a1f4-1d8807cf1b45	1800	f	\N	f	f	f	f	0	1	30	6	HmacSHA1	totp	99ca6a0c-b872-497e-a20e-585721e1a088	e03d2ae8-906d-44d1-8f8c-dbe6680728cf	64ede502-69e4-417a-83cb-6af916e6ab0c	059a3942-f75a-47e3-866e-3c59b3fe38c3	fae8dfd7-507f-452a-a8bf-a8475a1d66c0	2592000	f	900	t	f	8280e70f-386b-4bdb-b727-5c90846759ba	0	f	0	0	a7e79e49-a86a-45e0-8aa3-3cd3ec4d7c1f
04fb5b65-a9ea-4a2d-8f5e-0b7fad82a2da	60	300	60	\N	\N	\N	t	f	0	\N	master	0	\N	f	f	f	f	EXTERNAL	1800	36000	f	f	83325b84-08c9-4828-b471-d93aaa781ce0	1800	f	\N	f	f	f	f	0	1	30	6	HmacSHA1	totp	e26c7ee6-1a37-4690-b45d-ac4c6ac2ae6c	bbcfeb4f-e805-442e-82ae-202e873a93ac	6577f7ef-83dd-48ed-815b-699b935c231b	b869f12a-3997-4340-8057-08d824aef866	706e42a6-f901-4eaa-b6c2-1dc038efd80b	2592000	f	900	t	f	10b9d5cb-43e6-493a-b0a1-34f1e2bc1998	0	f	0	0	d3f8884c-19d7-47d1-a3d9-ffa85bb27479
\.


--
-- Data for Name: realm_attribute; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.realm_attribute (name, realm_id, value) FROM stdin;
_browser_header.contentSecurityPolicyReportOnly	04fb5b65-a9ea-4a2d-8f5e-0b7fad82a2da	
_browser_header.xContentTypeOptions	04fb5b65-a9ea-4a2d-8f5e-0b7fad82a2da	nosniff
_browser_header.xRobotsTag	04fb5b65-a9ea-4a2d-8f5e-0b7fad82a2da	none
_browser_header.xFrameOptions	04fb5b65-a9ea-4a2d-8f5e-0b7fad82a2da	SAMEORIGIN
_browser_header.contentSecurityPolicy	04fb5b65-a9ea-4a2d-8f5e-0b7fad82a2da	frame-src 'self'; frame-ancestors 'self'; object-src 'none';
_browser_header.xXSSProtection	04fb5b65-a9ea-4a2d-8f5e-0b7fad82a2da	1; mode=block
_browser_header.strictTransportSecurity	04fb5b65-a9ea-4a2d-8f5e-0b7fad82a2da	max-age=31536000; includeSubDomains
bruteForceProtected	04fb5b65-a9ea-4a2d-8f5e-0b7fad82a2da	false
permanentLockout	04fb5b65-a9ea-4a2d-8f5e-0b7fad82a2da	false
maxFailureWaitSeconds	04fb5b65-a9ea-4a2d-8f5e-0b7fad82a2da	900
minimumQuickLoginWaitSeconds	04fb5b65-a9ea-4a2d-8f5e-0b7fad82a2da	60
waitIncrementSeconds	04fb5b65-a9ea-4a2d-8f5e-0b7fad82a2da	60
quickLoginCheckMilliSeconds	04fb5b65-a9ea-4a2d-8f5e-0b7fad82a2da	1000
maxDeltaTimeSeconds	04fb5b65-a9ea-4a2d-8f5e-0b7fad82a2da	43200
failureFactor	04fb5b65-a9ea-4a2d-8f5e-0b7fad82a2da	30
displayName	04fb5b65-a9ea-4a2d-8f5e-0b7fad82a2da	Keycloak
displayNameHtml	04fb5b65-a9ea-4a2d-8f5e-0b7fad82a2da	<div class="kc-logo-text"><span>Keycloak</span></div>
defaultSignatureAlgorithm	04fb5b65-a9ea-4a2d-8f5e-0b7fad82a2da	RS256
offlineSessionMaxLifespanEnabled	04fb5b65-a9ea-4a2d-8f5e-0b7fad82a2da	false
offlineSessionMaxLifespan	04fb5b65-a9ea-4a2d-8f5e-0b7fad82a2da	5184000
oauth2DeviceCodeLifespan	eaaeb62f-362b-40bb-b7f1-d927afd6a6e9	600
oauth2DevicePollingInterval	eaaeb62f-362b-40bb-b7f1-d927afd6a6e9	5
cibaBackchannelTokenDeliveryMode	eaaeb62f-362b-40bb-b7f1-d927afd6a6e9	poll
cibaExpiresIn	eaaeb62f-362b-40bb-b7f1-d927afd6a6e9	120
cibaInterval	eaaeb62f-362b-40bb-b7f1-d927afd6a6e9	5
cibaAuthRequestedUserHint	eaaeb62f-362b-40bb-b7f1-d927afd6a6e9	login_hint
parRequestUriLifespan	eaaeb62f-362b-40bb-b7f1-d927afd6a6e9	60
bruteForceProtected	eaaeb62f-362b-40bb-b7f1-d927afd6a6e9	false
permanentLockout	eaaeb62f-362b-40bb-b7f1-d927afd6a6e9	false
maxFailureWaitSeconds	eaaeb62f-362b-40bb-b7f1-d927afd6a6e9	900
minimumQuickLoginWaitSeconds	eaaeb62f-362b-40bb-b7f1-d927afd6a6e9	60
waitIncrementSeconds	eaaeb62f-362b-40bb-b7f1-d927afd6a6e9	60
quickLoginCheckMilliSeconds	eaaeb62f-362b-40bb-b7f1-d927afd6a6e9	1000
maxDeltaTimeSeconds	eaaeb62f-362b-40bb-b7f1-d927afd6a6e9	43200
failureFactor	eaaeb62f-362b-40bb-b7f1-d927afd6a6e9	30
actionTokenGeneratedByAdminLifespan	eaaeb62f-362b-40bb-b7f1-d927afd6a6e9	43200
actionTokenGeneratedByUserLifespan	eaaeb62f-362b-40bb-b7f1-d927afd6a6e9	300
defaultSignatureAlgorithm	eaaeb62f-362b-40bb-b7f1-d927afd6a6e9	RS256
offlineSessionMaxLifespanEnabled	eaaeb62f-362b-40bb-b7f1-d927afd6a6e9	false
offlineSessionMaxLifespan	eaaeb62f-362b-40bb-b7f1-d927afd6a6e9	5184000
clientSessionIdleTimeout	eaaeb62f-362b-40bb-b7f1-d927afd6a6e9	0
clientSessionMaxLifespan	eaaeb62f-362b-40bb-b7f1-d927afd6a6e9	0
clientOfflineSessionIdleTimeout	eaaeb62f-362b-40bb-b7f1-d927afd6a6e9	0
clientOfflineSessionMaxLifespan	eaaeb62f-362b-40bb-b7f1-d927afd6a6e9	0
webAuthnPolicyRpEntityName	eaaeb62f-362b-40bb-b7f1-d927afd6a6e9	keycloak
webAuthnPolicySignatureAlgorithms	eaaeb62f-362b-40bb-b7f1-d927afd6a6e9	ES256
webAuthnPolicyRpId	eaaeb62f-362b-40bb-b7f1-d927afd6a6e9	
webAuthnPolicyAttestationConveyancePreference	eaaeb62f-362b-40bb-b7f1-d927afd6a6e9	not specified
webAuthnPolicyAuthenticatorAttachment	eaaeb62f-362b-40bb-b7f1-d927afd6a6e9	not specified
webAuthnPolicyRequireResidentKey	eaaeb62f-362b-40bb-b7f1-d927afd6a6e9	not specified
webAuthnPolicyUserVerificationRequirement	eaaeb62f-362b-40bb-b7f1-d927afd6a6e9	not specified
webAuthnPolicyCreateTimeout	eaaeb62f-362b-40bb-b7f1-d927afd6a6e9	0
webAuthnPolicyAvoidSameAuthenticatorRegister	eaaeb62f-362b-40bb-b7f1-d927afd6a6e9	false
webAuthnPolicyRpEntityNamePasswordless	eaaeb62f-362b-40bb-b7f1-d927afd6a6e9	keycloak
webAuthnPolicySignatureAlgorithmsPasswordless	eaaeb62f-362b-40bb-b7f1-d927afd6a6e9	ES256
webAuthnPolicyRpIdPasswordless	eaaeb62f-362b-40bb-b7f1-d927afd6a6e9	
webAuthnPolicyAttestationConveyancePreferencePasswordless	eaaeb62f-362b-40bb-b7f1-d927afd6a6e9	not specified
webAuthnPolicyAuthenticatorAttachmentPasswordless	eaaeb62f-362b-40bb-b7f1-d927afd6a6e9	not specified
webAuthnPolicyRequireResidentKeyPasswordless	eaaeb62f-362b-40bb-b7f1-d927afd6a6e9	not specified
webAuthnPolicyUserVerificationRequirementPasswordless	eaaeb62f-362b-40bb-b7f1-d927afd6a6e9	not specified
webAuthnPolicyCreateTimeoutPasswordless	eaaeb62f-362b-40bb-b7f1-d927afd6a6e9	0
webAuthnPolicyAvoidSameAuthenticatorRegisterPasswordless	eaaeb62f-362b-40bb-b7f1-d927afd6a6e9	false
client-policies.profiles	eaaeb62f-362b-40bb-b7f1-d927afd6a6e9	{"profiles":[]}
client-policies.policies	eaaeb62f-362b-40bb-b7f1-d927afd6a6e9	{"policies":[]}
_browser_header.contentSecurityPolicyReportOnly	eaaeb62f-362b-40bb-b7f1-d927afd6a6e9	
_browser_header.xContentTypeOptions	eaaeb62f-362b-40bb-b7f1-d927afd6a6e9	nosniff
_browser_header.xRobotsTag	eaaeb62f-362b-40bb-b7f1-d927afd6a6e9	none
_browser_header.xFrameOptions	eaaeb62f-362b-40bb-b7f1-d927afd6a6e9	SAMEORIGIN
_browser_header.contentSecurityPolicy	eaaeb62f-362b-40bb-b7f1-d927afd6a6e9	frame-src 'self'; frame-ancestors 'self'; object-src 'none';
_browser_header.xXSSProtection	eaaeb62f-362b-40bb-b7f1-d927afd6a6e9	1; mode=block
_browser_header.strictTransportSecurity	eaaeb62f-362b-40bb-b7f1-d927afd6a6e9	max-age=31536000; includeSubDomains
\.


--
-- Data for Name: realm_default_groups; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.realm_default_groups (realm_id, group_id) FROM stdin;
\.


--
-- Data for Name: realm_enabled_event_types; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.realm_enabled_event_types (realm_id, value) FROM stdin;
\.


--
-- Data for Name: realm_events_listeners; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.realm_events_listeners (realm_id, value) FROM stdin;
04fb5b65-a9ea-4a2d-8f5e-0b7fad82a2da	jboss-logging
eaaeb62f-362b-40bb-b7f1-d927afd6a6e9	jboss-logging
\.


--
-- Data for Name: realm_localizations; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.realm_localizations (realm_id, locale, texts) FROM stdin;
\.


--
-- Data for Name: realm_required_credential; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.realm_required_credential (type, form_label, input, secret, realm_id) FROM stdin;
password	password	t	t	04fb5b65-a9ea-4a2d-8f5e-0b7fad82a2da
password	password	t	t	eaaeb62f-362b-40bb-b7f1-d927afd6a6e9
\.


--
-- Data for Name: realm_smtp_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.realm_smtp_config (realm_id, value, name) FROM stdin;
\.


--
-- Data for Name: realm_supported_locales; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.realm_supported_locales (realm_id, value) FROM stdin;
\.


--
-- Data for Name: redirect_uris; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.redirect_uris (client_id, value) FROM stdin;
928ae892-62d7-4e34-bd4c-5f8f3f9a8994	/realms/master/account/*
f740cab7-40a8-4ae7-8347-36f262b2336a	/realms/master/account/*
6af6154c-9581-4825-ae34-fe235c49a845	/admin/master/console/*
9fd40948-70b2-47ea-98c4-f94d80a06ddb	/realms/hmmyzon/account/*
9e4684e7-1f36-4bbf-a0d1-f9c156a8a2e2	/realms/hmmyzon/account/*
327efb3f-a5b2-4cf8-9b6d-95ac614dfab1	/admin/hmmyzon/console/*
51435200-25cc-473c-8d97-03217017a185	http://localhost:5101/*
\.


--
-- Data for Name: required_action_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.required_action_config (required_action_id, value, name) FROM stdin;
\.


--
-- Data for Name: required_action_provider; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.required_action_provider (id, alias, name, realm_id, enabled, default_action, provider_id, priority) FROM stdin;
fa553e44-16e6-43d7-96d5-b06610cfaa01	VERIFY_EMAIL	Verify Email	04fb5b65-a9ea-4a2d-8f5e-0b7fad82a2da	t	f	VERIFY_EMAIL	50
930d8926-3399-47a1-a952-2a54f7588880	UPDATE_PROFILE	Update Profile	04fb5b65-a9ea-4a2d-8f5e-0b7fad82a2da	t	f	UPDATE_PROFILE	40
ae2f0920-42ad-4714-a626-194ebad30882	CONFIGURE_TOTP	Configure OTP	04fb5b65-a9ea-4a2d-8f5e-0b7fad82a2da	t	f	CONFIGURE_TOTP	10
4ed5d398-f73e-416c-bf05-aa93d556f508	UPDATE_PASSWORD	Update Password	04fb5b65-a9ea-4a2d-8f5e-0b7fad82a2da	t	f	UPDATE_PASSWORD	30
792d1911-bb41-4a09-a41d-994db3c15b7f	terms_and_conditions	Terms and Conditions	04fb5b65-a9ea-4a2d-8f5e-0b7fad82a2da	f	f	terms_and_conditions	20
9724a1b2-5256-4ccc-85b4-fedc582c5f62	update_user_locale	Update User Locale	04fb5b65-a9ea-4a2d-8f5e-0b7fad82a2da	t	f	update_user_locale	1000
f1a870e5-c761-4db3-ab58-7b2f76ef265a	delete_account	Delete Account	04fb5b65-a9ea-4a2d-8f5e-0b7fad82a2da	f	f	delete_account	60
4838f01c-5d45-4264-9d60-a63892c9443f	webauthn-register	Webauthn Register	04fb5b65-a9ea-4a2d-8f5e-0b7fad82a2da	t	f	webauthn-register	70
2b850f39-80b9-4768-b14b-158c652752f7	webauthn-register-passwordless	Webauthn Register Passwordless	04fb5b65-a9ea-4a2d-8f5e-0b7fad82a2da	t	f	webauthn-register-passwordless	80
0006c579-7e50-490d-bba0-a5f31dd1b338	VERIFY_EMAIL	Verify Email	eaaeb62f-362b-40bb-b7f1-d927afd6a6e9	t	f	VERIFY_EMAIL	50
ee610425-42dd-4a62-90cb-7af816eb9b21	UPDATE_PROFILE	Update Profile	eaaeb62f-362b-40bb-b7f1-d927afd6a6e9	t	f	UPDATE_PROFILE	40
c8e807c3-23ac-473b-a957-c31fdf07ec0d	CONFIGURE_TOTP	Configure OTP	eaaeb62f-362b-40bb-b7f1-d927afd6a6e9	t	f	CONFIGURE_TOTP	10
36251ad1-f3c7-4be9-a02b-afb9b2e69e69	UPDATE_PASSWORD	Update Password	eaaeb62f-362b-40bb-b7f1-d927afd6a6e9	t	f	UPDATE_PASSWORD	30
a2d8fd2a-3f8f-4e3f-97f9-e86af17d68af	terms_and_conditions	Terms and Conditions	eaaeb62f-362b-40bb-b7f1-d927afd6a6e9	f	f	terms_and_conditions	20
a22cd74f-e30b-420e-a580-3e7dad972ea2	update_user_locale	Update User Locale	eaaeb62f-362b-40bb-b7f1-d927afd6a6e9	t	f	update_user_locale	1000
7d09c404-a6f1-4186-af26-4059c0741ea2	delete_account	Delete Account	eaaeb62f-362b-40bb-b7f1-d927afd6a6e9	f	f	delete_account	60
e2542f56-2a2e-4871-8f37-55e06452cc85	webauthn-register	Webauthn Register	eaaeb62f-362b-40bb-b7f1-d927afd6a6e9	t	f	webauthn-register	70
9946e120-f102-48e7-b123-6cfbd5573ca5	webauthn-register-passwordless	Webauthn Register Passwordless	eaaeb62f-362b-40bb-b7f1-d927afd6a6e9	t	f	webauthn-register-passwordless	80
\.


--
-- Data for Name: resource_attribute; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.resource_attribute (id, name, value, resource_id) FROM stdin;
\.


--
-- Data for Name: resource_policy; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.resource_policy (resource_id, policy_id) FROM stdin;
\.


--
-- Data for Name: resource_scope; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.resource_scope (resource_id, scope_id) FROM stdin;
\.


--
-- Data for Name: resource_server; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.resource_server (id, allow_rs_remote_mgmt, policy_enforce_mode, decision_strategy) FROM stdin;
\.


--
-- Data for Name: resource_server_perm_ticket; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.resource_server_perm_ticket (id, owner, requester, created_timestamp, granted_timestamp, resource_id, scope_id, resource_server_id, policy_id) FROM stdin;
\.


--
-- Data for Name: resource_server_policy; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.resource_server_policy (id, name, description, type, decision_strategy, logic, resource_server_id, owner) FROM stdin;
\.


--
-- Data for Name: resource_server_resource; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.resource_server_resource (id, name, type, icon_uri, owner, resource_server_id, owner_managed_access, display_name) FROM stdin;
\.


--
-- Data for Name: resource_server_scope; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.resource_server_scope (id, name, icon_uri, resource_server_id, display_name) FROM stdin;
\.


--
-- Data for Name: resource_uris; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.resource_uris (resource_id, value) FROM stdin;
\.


--
-- Data for Name: role_attribute; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.role_attribute (id, role_id, name, value) FROM stdin;
\.


--
-- Data for Name: scope_mapping; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.scope_mapping (client_id, role_id) FROM stdin;
f740cab7-40a8-4ae7-8347-36f262b2336a	2a20a74d-5aa9-4399-8c3b-0dc29da48000
9e4684e7-1f36-4bbf-a0d1-f9c156a8a2e2	38a3e485-ddf6-4ab4-94fe-d42f1f5855b0
\.


--
-- Data for Name: scope_policy; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.scope_policy (scope_id, policy_id) FROM stdin;
\.


--
-- Data for Name: user_attribute; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_attribute (name, value, user_id, id) FROM stdin;
client_id	client-front	3831468b-5f32-4f14-98c6-dace721f46fd	bdb9469d-0dbf-4205-8e0b-3bb7f39c1d8e
client_id	client-front	59c357ec-085c-4df1-a578-16ab398a1e2e	688c0280-ce0b-4b09-a5cb-7832f9c8725e
client_id	client-front	bc26c93f-3892-4582-a4cc-ef739142b3c2	5a7864b9-76de-4d50-9973-b19a3336d9a3
client_id	client-front	75979798-99e2-4758-8ee1-c4168c50a8f9	e050680e-4e3a-4582-8240-614af572673a
\.


--
-- Data for Name: user_consent; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_consent (id, client_id, user_id, created_date, last_updated_date, client_storage_provider, external_client_id) FROM stdin;
\.


--
-- Data for Name: user_consent_client_scope; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_consent_client_scope (user_consent_id, scope_id) FROM stdin;
\.


--
-- Data for Name: user_entity; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_entity (id, email, email_constraint, email_verified, enabled, federation_link, first_name, last_name, realm_id, username, created_timestamp, service_account_client_link, not_before) FROM stdin;
ced0ad4b-46de-4b77-b381-c20bafa2a763	\N	bb97143f-086c-476b-b7d9-289549f336f1	f	t	\N	\N	\N	04fb5b65-a9ea-4a2d-8f5e-0b7fad82a2da	admin	1703277713557	\N	0
da2756e0-9b99-45a4-ad55-754ba23444ef	\N	8c7d43d8-302a-403f-8379-af15ecc20843	f	t	\N	\N	\N	04fb5b65-a9ea-4a2d-8f5e-0b7fad82a2da	service-account-admin-cli	1703291446983	d18341ec-c15a-47f7-bc4e-58023ff7acb8	0
3831468b-5f32-4f14-98c6-dace721f46fd	c	c	f	t	\N	\N	\N	eaaeb62f-362b-40bb-b7f1-d927afd6a6e9	c	1703292267560	\N	0
59c357ec-085c-4df1-a578-16ab398a1e2e	cc	cc	f	t	\N	\N	\N	eaaeb62f-362b-40bb-b7f1-d927afd6a6e9	cc	1703292400057	\N	0
bc26c93f-3892-4582-a4cc-ef739142b3c2	s	s	f	t	\N	\N	\N	eaaeb62f-362b-40bb-b7f1-d927afd6a6e9	s	1703292943674	\N	0
75979798-99e2-4758-8ee1-c4168c50a8f9	seller	seller	f	t	\N	\N	\N	eaaeb62f-362b-40bb-b7f1-d927afd6a6e9	seller	1703293270506	\N	0
\.


--
-- Data for Name: user_federation_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_federation_config (user_federation_provider_id, value, name) FROM stdin;
\.


--
-- Data for Name: user_federation_mapper; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_federation_mapper (id, name, federation_provider_id, federation_mapper_type, realm_id) FROM stdin;
\.


--
-- Data for Name: user_federation_mapper_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_federation_mapper_config (user_federation_mapper_id, value, name) FROM stdin;
\.


--
-- Data for Name: user_federation_provider; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_federation_provider (id, changed_sync_period, display_name, full_sync_period, last_sync, priority, provider_name, realm_id) FROM stdin;
\.


--
-- Data for Name: user_group_membership; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_group_membership (group_id, user_id) FROM stdin;
44c63a06-e216-4e4b-8dbf-c5bbc6dcd1aa	3831468b-5f32-4f14-98c6-dace721f46fd
44c63a06-e216-4e4b-8dbf-c5bbc6dcd1aa	59c357ec-085c-4df1-a578-16ab398a1e2e
a410c078-fb2e-4dae-8d49-7727ef71c488	bc26c93f-3892-4582-a4cc-ef739142b3c2
a410c078-fb2e-4dae-8d49-7727ef71c488	75979798-99e2-4758-8ee1-c4168c50a8f9
\.


--
-- Data for Name: user_required_action; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_required_action (user_id, required_action) FROM stdin;
\.


--
-- Data for Name: user_role_mapping; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_role_mapping (role_id, user_id) FROM stdin;
d3f8884c-19d7-47d1-a3d9-ffa85bb27479	ced0ad4b-46de-4b77-b381-c20bafa2a763
b4122d25-9a3f-4dc5-a3f8-68ea17c4bcaa	ced0ad4b-46de-4b77-b381-c20bafa2a763
33c6f1ba-367c-4d9b-a527-bddd530bb591	ced0ad4b-46de-4b77-b381-c20bafa2a763
b40bd39a-981a-4b26-84f4-624a443c67ed	ced0ad4b-46de-4b77-b381-c20bafa2a763
f6135e69-bbff-46f7-ae0e-213ad922fbd3	ced0ad4b-46de-4b77-b381-c20bafa2a763
ce84955c-80d1-4819-b8ec-7e54d6152094	ced0ad4b-46de-4b77-b381-c20bafa2a763
abcd05eb-2f8c-431b-90d1-d89f2d648eb3	ced0ad4b-46de-4b77-b381-c20bafa2a763
3352ac0e-ff9d-4a40-ad49-3e3da15baeb5	ced0ad4b-46de-4b77-b381-c20bafa2a763
db24d0fc-4e73-4f71-84f4-1f4befc4e2e1	ced0ad4b-46de-4b77-b381-c20bafa2a763
77b07242-62fa-4d18-b83a-3f0ddb7c9c1d	ced0ad4b-46de-4b77-b381-c20bafa2a763
e6098035-831e-4668-8ebb-d99d1f1b15d6	ced0ad4b-46de-4b77-b381-c20bafa2a763
475a7e23-8fca-4d52-8ab0-c657b81b7419	ced0ad4b-46de-4b77-b381-c20bafa2a763
3d2b0e71-1b37-4bd3-aae2-f960d582bb4d	ced0ad4b-46de-4b77-b381-c20bafa2a763
00dec864-c1ef-4a5b-b0f0-aadf1d02f04c	ced0ad4b-46de-4b77-b381-c20bafa2a763
daae66bc-a19c-45d2-a340-c35e498caba9	ced0ad4b-46de-4b77-b381-c20bafa2a763
b007b78e-670a-4499-959c-498aa2dc6c28	ced0ad4b-46de-4b77-b381-c20bafa2a763
5ceb1fc2-e023-4202-8954-ef76c3522dbb	ced0ad4b-46de-4b77-b381-c20bafa2a763
ed5561a6-e43b-4f70-a186-a34f121b408f	ced0ad4b-46de-4b77-b381-c20bafa2a763
4a809901-0b51-442d-b6f0-236f31998ba1	ced0ad4b-46de-4b77-b381-c20bafa2a763
d3f8884c-19d7-47d1-a3d9-ffa85bb27479	da2756e0-9b99-45a4-ad55-754ba23444ef
b4122d25-9a3f-4dc5-a3f8-68ea17c4bcaa	da2756e0-9b99-45a4-ad55-754ba23444ef
0282cdc5-1f82-4b83-9e2a-dd3655b20b07	da2756e0-9b99-45a4-ad55-754ba23444ef
752f795e-0401-4652-b071-9e8ff939eddc	da2756e0-9b99-45a4-ad55-754ba23444ef
a7e79e49-a86a-45e0-8aa3-3cd3ec4d7c1f	3831468b-5f32-4f14-98c6-dace721f46fd
a7e79e49-a86a-45e0-8aa3-3cd3ec4d7c1f	59c357ec-085c-4df1-a578-16ab398a1e2e
a7e79e49-a86a-45e0-8aa3-3cd3ec4d7c1f	bc26c93f-3892-4582-a4cc-ef739142b3c2
a7e79e49-a86a-45e0-8aa3-3cd3ec4d7c1f	75979798-99e2-4758-8ee1-c4168c50a8f9
\.


--
-- Data for Name: user_session; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_session (id, auth_method, ip_address, last_session_refresh, login_username, realm_id, remember_me, started, user_id, user_session_state, broker_session_id, broker_user_id) FROM stdin;
\.


--
-- Data for Name: user_session_note; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_session_note (user_session, name, value) FROM stdin;
\.


--
-- Data for Name: username_login_failure; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.username_login_failure (realm_id, username, failed_login_not_before, last_failure, last_ip_failure, num_failures) FROM stdin;
\.


--
-- Data for Name: web_origins; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.web_origins (client_id, value) FROM stdin;
6af6154c-9581-4825-ae34-fe235c49a845	+
327efb3f-a5b2-4cf8-9b6d-95ac614dfab1	+
51435200-25cc-473c-8d97-03217017a185	*
d18341ec-c15a-47f7-bc4e-58023ff7acb8	*
\.


--
-- Name: username_login_failure CONSTRAINT_17-2; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.username_login_failure
    ADD CONSTRAINT "CONSTRAINT_17-2" PRIMARY KEY (realm_id, username);


--
-- Name: keycloak_role UK_J3RWUVD56ONTGSUHOGM184WW2-2; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.keycloak_role
    ADD CONSTRAINT "UK_J3RWUVD56ONTGSUHOGM184WW2-2" UNIQUE (name, client_realm_constraint);


--
-- Name: client_auth_flow_bindings c_cli_flow_bind; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_auth_flow_bindings
    ADD CONSTRAINT c_cli_flow_bind PRIMARY KEY (client_id, binding_name);


--
-- Name: client_scope_client c_cli_scope_bind; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_scope_client
    ADD CONSTRAINT c_cli_scope_bind PRIMARY KEY (client_id, scope_id);


--
-- Name: client_initial_access cnstr_client_init_acc_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_initial_access
    ADD CONSTRAINT cnstr_client_init_acc_pk PRIMARY KEY (id);


--
-- Name: realm_default_groups con_group_id_def_groups; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_default_groups
    ADD CONSTRAINT con_group_id_def_groups UNIQUE (group_id);


--
-- Name: broker_link constr_broker_link_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.broker_link
    ADD CONSTRAINT constr_broker_link_pk PRIMARY KEY (identity_provider, user_id);


--
-- Name: client_user_session_note constr_cl_usr_ses_note; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_user_session_note
    ADD CONSTRAINT constr_cl_usr_ses_note PRIMARY KEY (client_session, name);


--
-- Name: component_config constr_component_config_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.component_config
    ADD CONSTRAINT constr_component_config_pk PRIMARY KEY (id);


--
-- Name: component constr_component_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.component
    ADD CONSTRAINT constr_component_pk PRIMARY KEY (id);


--
-- Name: fed_user_required_action constr_fed_required_action; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.fed_user_required_action
    ADD CONSTRAINT constr_fed_required_action PRIMARY KEY (required_action, user_id);


--
-- Name: fed_user_attribute constr_fed_user_attr_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.fed_user_attribute
    ADD CONSTRAINT constr_fed_user_attr_pk PRIMARY KEY (id);


--
-- Name: fed_user_consent constr_fed_user_consent_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.fed_user_consent
    ADD CONSTRAINT constr_fed_user_consent_pk PRIMARY KEY (id);


--
-- Name: fed_user_credential constr_fed_user_cred_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.fed_user_credential
    ADD CONSTRAINT constr_fed_user_cred_pk PRIMARY KEY (id);


--
-- Name: fed_user_group_membership constr_fed_user_group; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.fed_user_group_membership
    ADD CONSTRAINT constr_fed_user_group PRIMARY KEY (group_id, user_id);


--
-- Name: fed_user_role_mapping constr_fed_user_role; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.fed_user_role_mapping
    ADD CONSTRAINT constr_fed_user_role PRIMARY KEY (role_id, user_id);


--
-- Name: federated_user constr_federated_user; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.federated_user
    ADD CONSTRAINT constr_federated_user PRIMARY KEY (id);


--
-- Name: realm_default_groups constr_realm_default_groups; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_default_groups
    ADD CONSTRAINT constr_realm_default_groups PRIMARY KEY (realm_id, group_id);


--
-- Name: realm_enabled_event_types constr_realm_enabl_event_types; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_enabled_event_types
    ADD CONSTRAINT constr_realm_enabl_event_types PRIMARY KEY (realm_id, value);


--
-- Name: realm_events_listeners constr_realm_events_listeners; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_events_listeners
    ADD CONSTRAINT constr_realm_events_listeners PRIMARY KEY (realm_id, value);


--
-- Name: realm_supported_locales constr_realm_supported_locales; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_supported_locales
    ADD CONSTRAINT constr_realm_supported_locales PRIMARY KEY (realm_id, value);


--
-- Name: identity_provider constraint_2b; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.identity_provider
    ADD CONSTRAINT constraint_2b PRIMARY KEY (internal_id);


--
-- Name: client_attributes constraint_3c; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_attributes
    ADD CONSTRAINT constraint_3c PRIMARY KEY (client_id, name);


--
-- Name: event_entity constraint_4; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.event_entity
    ADD CONSTRAINT constraint_4 PRIMARY KEY (id);


--
-- Name: federated_identity constraint_40; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.federated_identity
    ADD CONSTRAINT constraint_40 PRIMARY KEY (identity_provider, user_id);


--
-- Name: realm constraint_4a; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm
    ADD CONSTRAINT constraint_4a PRIMARY KEY (id);


--
-- Name: client_session_role constraint_5; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_session_role
    ADD CONSTRAINT constraint_5 PRIMARY KEY (client_session, role_id);


--
-- Name: user_session constraint_57; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_session
    ADD CONSTRAINT constraint_57 PRIMARY KEY (id);


--
-- Name: user_federation_provider constraint_5c; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_federation_provider
    ADD CONSTRAINT constraint_5c PRIMARY KEY (id);


--
-- Name: client_session_note constraint_5e; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_session_note
    ADD CONSTRAINT constraint_5e PRIMARY KEY (client_session, name);


--
-- Name: client constraint_7; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client
    ADD CONSTRAINT constraint_7 PRIMARY KEY (id);


--
-- Name: client_session constraint_8; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_session
    ADD CONSTRAINT constraint_8 PRIMARY KEY (id);


--
-- Name: scope_mapping constraint_81; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.scope_mapping
    ADD CONSTRAINT constraint_81 PRIMARY KEY (client_id, role_id);


--
-- Name: client_node_registrations constraint_84; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_node_registrations
    ADD CONSTRAINT constraint_84 PRIMARY KEY (client_id, name);


--
-- Name: realm_attribute constraint_9; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_attribute
    ADD CONSTRAINT constraint_9 PRIMARY KEY (name, realm_id);


--
-- Name: realm_required_credential constraint_92; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_required_credential
    ADD CONSTRAINT constraint_92 PRIMARY KEY (realm_id, type);


--
-- Name: keycloak_role constraint_a; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.keycloak_role
    ADD CONSTRAINT constraint_a PRIMARY KEY (id);


--
-- Name: admin_event_entity constraint_admin_event_entity; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.admin_event_entity
    ADD CONSTRAINT constraint_admin_event_entity PRIMARY KEY (id);


--
-- Name: authenticator_config_entry constraint_auth_cfg_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.authenticator_config_entry
    ADD CONSTRAINT constraint_auth_cfg_pk PRIMARY KEY (authenticator_id, name);


--
-- Name: authentication_execution constraint_auth_exec_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.authentication_execution
    ADD CONSTRAINT constraint_auth_exec_pk PRIMARY KEY (id);


--
-- Name: authentication_flow constraint_auth_flow_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.authentication_flow
    ADD CONSTRAINT constraint_auth_flow_pk PRIMARY KEY (id);


--
-- Name: authenticator_config constraint_auth_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.authenticator_config
    ADD CONSTRAINT constraint_auth_pk PRIMARY KEY (id);


--
-- Name: client_session_auth_status constraint_auth_status_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_session_auth_status
    ADD CONSTRAINT constraint_auth_status_pk PRIMARY KEY (client_session, authenticator);


--
-- Name: user_role_mapping constraint_c; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_role_mapping
    ADD CONSTRAINT constraint_c PRIMARY KEY (role_id, user_id);


--
-- Name: composite_role constraint_composite_role; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.composite_role
    ADD CONSTRAINT constraint_composite_role PRIMARY KEY (composite, child_role);


--
-- Name: client_session_prot_mapper constraint_cs_pmp_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_session_prot_mapper
    ADD CONSTRAINT constraint_cs_pmp_pk PRIMARY KEY (client_session, protocol_mapper_id);


--
-- Name: identity_provider_config constraint_d; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.identity_provider_config
    ADD CONSTRAINT constraint_d PRIMARY KEY (identity_provider_id, name);


--
-- Name: policy_config constraint_dpc; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.policy_config
    ADD CONSTRAINT constraint_dpc PRIMARY KEY (policy_id, name);


--
-- Name: realm_smtp_config constraint_e; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_smtp_config
    ADD CONSTRAINT constraint_e PRIMARY KEY (realm_id, name);


--
-- Name: credential constraint_f; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.credential
    ADD CONSTRAINT constraint_f PRIMARY KEY (id);


--
-- Name: user_federation_config constraint_f9; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_federation_config
    ADD CONSTRAINT constraint_f9 PRIMARY KEY (user_federation_provider_id, name);


--
-- Name: resource_server_perm_ticket constraint_fapmt; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT constraint_fapmt PRIMARY KEY (id);


--
-- Name: resource_server_resource constraint_farsr; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_resource
    ADD CONSTRAINT constraint_farsr PRIMARY KEY (id);


--
-- Name: resource_server_policy constraint_farsrp; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_policy
    ADD CONSTRAINT constraint_farsrp PRIMARY KEY (id);


--
-- Name: associated_policy constraint_farsrpap; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.associated_policy
    ADD CONSTRAINT constraint_farsrpap PRIMARY KEY (policy_id, associated_policy_id);


--
-- Name: resource_policy constraint_farsrpp; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_policy
    ADD CONSTRAINT constraint_farsrpp PRIMARY KEY (resource_id, policy_id);


--
-- Name: resource_server_scope constraint_farsrs; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_scope
    ADD CONSTRAINT constraint_farsrs PRIMARY KEY (id);


--
-- Name: resource_scope constraint_farsrsp; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_scope
    ADD CONSTRAINT constraint_farsrsp PRIMARY KEY (resource_id, scope_id);


--
-- Name: scope_policy constraint_farsrsps; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.scope_policy
    ADD CONSTRAINT constraint_farsrsps PRIMARY KEY (scope_id, policy_id);


--
-- Name: user_entity constraint_fb; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_entity
    ADD CONSTRAINT constraint_fb PRIMARY KEY (id);


--
-- Name: user_federation_mapper_config constraint_fedmapper_cfg_pm; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_federation_mapper_config
    ADD CONSTRAINT constraint_fedmapper_cfg_pm PRIMARY KEY (user_federation_mapper_id, name);


--
-- Name: user_federation_mapper constraint_fedmapperpm; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_federation_mapper
    ADD CONSTRAINT constraint_fedmapperpm PRIMARY KEY (id);


--
-- Name: fed_user_consent_cl_scope constraint_fgrntcsnt_clsc_pm; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.fed_user_consent_cl_scope
    ADD CONSTRAINT constraint_fgrntcsnt_clsc_pm PRIMARY KEY (user_consent_id, scope_id);


--
-- Name: user_consent_client_scope constraint_grntcsnt_clsc_pm; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_consent_client_scope
    ADD CONSTRAINT constraint_grntcsnt_clsc_pm PRIMARY KEY (user_consent_id, scope_id);


--
-- Name: user_consent constraint_grntcsnt_pm; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_consent
    ADD CONSTRAINT constraint_grntcsnt_pm PRIMARY KEY (id);


--
-- Name: keycloak_group constraint_group; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.keycloak_group
    ADD CONSTRAINT constraint_group PRIMARY KEY (id);


--
-- Name: group_attribute constraint_group_attribute_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.group_attribute
    ADD CONSTRAINT constraint_group_attribute_pk PRIMARY KEY (id);


--
-- Name: group_role_mapping constraint_group_role; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.group_role_mapping
    ADD CONSTRAINT constraint_group_role PRIMARY KEY (role_id, group_id);


--
-- Name: identity_provider_mapper constraint_idpm; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.identity_provider_mapper
    ADD CONSTRAINT constraint_idpm PRIMARY KEY (id);


--
-- Name: idp_mapper_config constraint_idpmconfig; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.idp_mapper_config
    ADD CONSTRAINT constraint_idpmconfig PRIMARY KEY (idp_mapper_id, name);


--
-- Name: migration_model constraint_migmod; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.migration_model
    ADD CONSTRAINT constraint_migmod PRIMARY KEY (id);


--
-- Name: offline_client_session constraint_offl_cl_ses_pk3; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.offline_client_session
    ADD CONSTRAINT constraint_offl_cl_ses_pk3 PRIMARY KEY (user_session_id, client_id, client_storage_provider, external_client_id, offline_flag);


--
-- Name: offline_user_session constraint_offl_us_ses_pk2; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.offline_user_session
    ADD CONSTRAINT constraint_offl_us_ses_pk2 PRIMARY KEY (user_session_id, offline_flag);


--
-- Name: protocol_mapper constraint_pcm; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.protocol_mapper
    ADD CONSTRAINT constraint_pcm PRIMARY KEY (id);


--
-- Name: protocol_mapper_config constraint_pmconfig; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.protocol_mapper_config
    ADD CONSTRAINT constraint_pmconfig PRIMARY KEY (protocol_mapper_id, name);


--
-- Name: redirect_uris constraint_redirect_uris; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.redirect_uris
    ADD CONSTRAINT constraint_redirect_uris PRIMARY KEY (client_id, value);


--
-- Name: required_action_config constraint_req_act_cfg_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.required_action_config
    ADD CONSTRAINT constraint_req_act_cfg_pk PRIMARY KEY (required_action_id, name);


--
-- Name: required_action_provider constraint_req_act_prv_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.required_action_provider
    ADD CONSTRAINT constraint_req_act_prv_pk PRIMARY KEY (id);


--
-- Name: user_required_action constraint_required_action; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_required_action
    ADD CONSTRAINT constraint_required_action PRIMARY KEY (required_action, user_id);


--
-- Name: resource_uris constraint_resour_uris_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_uris
    ADD CONSTRAINT constraint_resour_uris_pk PRIMARY KEY (resource_id, value);


--
-- Name: role_attribute constraint_role_attribute_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.role_attribute
    ADD CONSTRAINT constraint_role_attribute_pk PRIMARY KEY (id);


--
-- Name: user_attribute constraint_user_attribute_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_attribute
    ADD CONSTRAINT constraint_user_attribute_pk PRIMARY KEY (id);


--
-- Name: user_group_membership constraint_user_group; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_group_membership
    ADD CONSTRAINT constraint_user_group PRIMARY KEY (group_id, user_id);


--
-- Name: user_session_note constraint_usn_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_session_note
    ADD CONSTRAINT constraint_usn_pk PRIMARY KEY (user_session, name);


--
-- Name: web_origins constraint_web_origins; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.web_origins
    ADD CONSTRAINT constraint_web_origins PRIMARY KEY (client_id, value);


--
-- Name: databasechangeloglock databasechangeloglock_pkey; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.databasechangeloglock
    ADD CONSTRAINT databasechangeloglock_pkey PRIMARY KEY (id);


--
-- Name: client_scope_attributes pk_cl_tmpl_attr; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_scope_attributes
    ADD CONSTRAINT pk_cl_tmpl_attr PRIMARY KEY (scope_id, name);


--
-- Name: client_scope pk_cli_template; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_scope
    ADD CONSTRAINT pk_cli_template PRIMARY KEY (id);


--
-- Name: resource_server pk_resource_server; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server
    ADD CONSTRAINT pk_resource_server PRIMARY KEY (id);


--
-- Name: client_scope_role_mapping pk_template_scope; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_scope_role_mapping
    ADD CONSTRAINT pk_template_scope PRIMARY KEY (scope_id, role_id);


--
-- Name: default_client_scope r_def_cli_scope_bind; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.default_client_scope
    ADD CONSTRAINT r_def_cli_scope_bind PRIMARY KEY (realm_id, scope_id);


--
-- Name: realm_localizations realm_localizations_pkey; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_localizations
    ADD CONSTRAINT realm_localizations_pkey PRIMARY KEY (realm_id, locale);


--
-- Name: resource_attribute res_attr_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_attribute
    ADD CONSTRAINT res_attr_pk PRIMARY KEY (id);


--
-- Name: keycloak_group sibling_names; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.keycloak_group
    ADD CONSTRAINT sibling_names UNIQUE (realm_id, parent_group, name);


--
-- Name: identity_provider uk_2daelwnibji49avxsrtuf6xj33; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.identity_provider
    ADD CONSTRAINT uk_2daelwnibji49avxsrtuf6xj33 UNIQUE (provider_alias, realm_id);


--
-- Name: client uk_b71cjlbenv945rb6gcon438at; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client
    ADD CONSTRAINT uk_b71cjlbenv945rb6gcon438at UNIQUE (realm_id, client_id);


--
-- Name: client_scope uk_cli_scope; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_scope
    ADD CONSTRAINT uk_cli_scope UNIQUE (realm_id, name);


--
-- Name: user_entity uk_dykn684sl8up1crfei6eckhd7; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_entity
    ADD CONSTRAINT uk_dykn684sl8up1crfei6eckhd7 UNIQUE (realm_id, email_constraint);


--
-- Name: resource_server_resource uk_frsr6t700s9v50bu18ws5ha6; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_resource
    ADD CONSTRAINT uk_frsr6t700s9v50bu18ws5ha6 UNIQUE (name, owner, resource_server_id);


--
-- Name: resource_server_perm_ticket uk_frsr6t700s9v50bu18ws5pmt; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT uk_frsr6t700s9v50bu18ws5pmt UNIQUE (owner, requester, resource_server_id, resource_id, scope_id);


--
-- Name: resource_server_policy uk_frsrpt700s9v50bu18ws5ha6; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_policy
    ADD CONSTRAINT uk_frsrpt700s9v50bu18ws5ha6 UNIQUE (name, resource_server_id);


--
-- Name: resource_server_scope uk_frsrst700s9v50bu18ws5ha6; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_scope
    ADD CONSTRAINT uk_frsrst700s9v50bu18ws5ha6 UNIQUE (name, resource_server_id);


--
-- Name: user_consent uk_jkuwuvd56ontgsuhogm8uewrt; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_consent
    ADD CONSTRAINT uk_jkuwuvd56ontgsuhogm8uewrt UNIQUE (client_id, client_storage_provider, external_client_id, user_id);


--
-- Name: realm uk_orvsdmla56612eaefiq6wl5oi; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm
    ADD CONSTRAINT uk_orvsdmla56612eaefiq6wl5oi UNIQUE (name);


--
-- Name: user_entity uk_ru8tt6t700s9v50bu18ws5ha6; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_entity
    ADD CONSTRAINT uk_ru8tt6t700s9v50bu18ws5ha6 UNIQUE (realm_id, username);


--
-- Name: idx_admin_event_time; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_admin_event_time ON public.admin_event_entity USING btree (realm_id, admin_event_time);


--
-- Name: idx_assoc_pol_assoc_pol_id; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_assoc_pol_assoc_pol_id ON public.associated_policy USING btree (associated_policy_id);


--
-- Name: idx_auth_config_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_auth_config_realm ON public.authenticator_config USING btree (realm_id);


--
-- Name: idx_auth_exec_flow; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_auth_exec_flow ON public.authentication_execution USING btree (flow_id);


--
-- Name: idx_auth_exec_realm_flow; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_auth_exec_realm_flow ON public.authentication_execution USING btree (realm_id, flow_id);


--
-- Name: idx_auth_flow_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_auth_flow_realm ON public.authentication_flow USING btree (realm_id);


--
-- Name: idx_cl_clscope; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_cl_clscope ON public.client_scope_client USING btree (scope_id);


--
-- Name: idx_client_att_by_name_value; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_client_att_by_name_value ON public.client_attributes USING btree (name, ((value)::character varying(250)));


--
-- Name: idx_client_id; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_client_id ON public.client USING btree (client_id);


--
-- Name: idx_client_init_acc_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_client_init_acc_realm ON public.client_initial_access USING btree (realm_id);


--
-- Name: idx_client_session_session; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_client_session_session ON public.client_session USING btree (session_id);


--
-- Name: idx_clscope_attrs; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_clscope_attrs ON public.client_scope_attributes USING btree (scope_id);


--
-- Name: idx_clscope_cl; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_clscope_cl ON public.client_scope_client USING btree (client_id);


--
-- Name: idx_clscope_protmap; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_clscope_protmap ON public.protocol_mapper USING btree (client_scope_id);


--
-- Name: idx_clscope_role; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_clscope_role ON public.client_scope_role_mapping USING btree (scope_id);


--
-- Name: idx_compo_config_compo; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_compo_config_compo ON public.component_config USING btree (component_id);


--
-- Name: idx_component_provider_type; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_component_provider_type ON public.component USING btree (provider_type);


--
-- Name: idx_component_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_component_realm ON public.component USING btree (realm_id);


--
-- Name: idx_composite; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_composite ON public.composite_role USING btree (composite);


--
-- Name: idx_composite_child; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_composite_child ON public.composite_role USING btree (child_role);


--
-- Name: idx_defcls_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_defcls_realm ON public.default_client_scope USING btree (realm_id);


--
-- Name: idx_defcls_scope; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_defcls_scope ON public.default_client_scope USING btree (scope_id);


--
-- Name: idx_event_time; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_event_time ON public.event_entity USING btree (realm_id, event_time);


--
-- Name: idx_fedidentity_feduser; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fedidentity_feduser ON public.federated_identity USING btree (federated_user_id);


--
-- Name: idx_fedidentity_user; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fedidentity_user ON public.federated_identity USING btree (user_id);


--
-- Name: idx_fu_attribute; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_attribute ON public.fed_user_attribute USING btree (user_id, realm_id, name);


--
-- Name: idx_fu_cnsnt_ext; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_cnsnt_ext ON public.fed_user_consent USING btree (user_id, client_storage_provider, external_client_id);


--
-- Name: idx_fu_consent; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_consent ON public.fed_user_consent USING btree (user_id, client_id);


--
-- Name: idx_fu_consent_ru; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_consent_ru ON public.fed_user_consent USING btree (realm_id, user_id);


--
-- Name: idx_fu_credential; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_credential ON public.fed_user_credential USING btree (user_id, type);


--
-- Name: idx_fu_credential_ru; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_credential_ru ON public.fed_user_credential USING btree (realm_id, user_id);


--
-- Name: idx_fu_group_membership; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_group_membership ON public.fed_user_group_membership USING btree (user_id, group_id);


--
-- Name: idx_fu_group_membership_ru; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_group_membership_ru ON public.fed_user_group_membership USING btree (realm_id, user_id);


--
-- Name: idx_fu_required_action; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_required_action ON public.fed_user_required_action USING btree (user_id, required_action);


--
-- Name: idx_fu_required_action_ru; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_required_action_ru ON public.fed_user_required_action USING btree (realm_id, user_id);


--
-- Name: idx_fu_role_mapping; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_role_mapping ON public.fed_user_role_mapping USING btree (user_id, role_id);


--
-- Name: idx_fu_role_mapping_ru; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_role_mapping_ru ON public.fed_user_role_mapping USING btree (realm_id, user_id);


--
-- Name: idx_group_attr_group; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_group_attr_group ON public.group_attribute USING btree (group_id);


--
-- Name: idx_group_role_mapp_group; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_group_role_mapp_group ON public.group_role_mapping USING btree (group_id);


--
-- Name: idx_id_prov_mapp_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_id_prov_mapp_realm ON public.identity_provider_mapper USING btree (realm_id);


--
-- Name: idx_ident_prov_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_ident_prov_realm ON public.identity_provider USING btree (realm_id);


--
-- Name: idx_keycloak_role_client; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_keycloak_role_client ON public.keycloak_role USING btree (client);


--
-- Name: idx_keycloak_role_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_keycloak_role_realm ON public.keycloak_role USING btree (realm);


--
-- Name: idx_offline_css_preload; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_offline_css_preload ON public.offline_client_session USING btree (client_id, offline_flag);


--
-- Name: idx_offline_uss_by_user; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_offline_uss_by_user ON public.offline_user_session USING btree (user_id, realm_id, offline_flag);


--
-- Name: idx_offline_uss_by_usersess; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_offline_uss_by_usersess ON public.offline_user_session USING btree (realm_id, offline_flag, user_session_id);


--
-- Name: idx_offline_uss_createdon; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_offline_uss_createdon ON public.offline_user_session USING btree (created_on);


--
-- Name: idx_offline_uss_preload; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_offline_uss_preload ON public.offline_user_session USING btree (offline_flag, created_on, user_session_id);


--
-- Name: idx_protocol_mapper_client; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_protocol_mapper_client ON public.protocol_mapper USING btree (client_id);


--
-- Name: idx_realm_attr_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_realm_attr_realm ON public.realm_attribute USING btree (realm_id);


--
-- Name: idx_realm_clscope; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_realm_clscope ON public.client_scope USING btree (realm_id);


--
-- Name: idx_realm_def_grp_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_realm_def_grp_realm ON public.realm_default_groups USING btree (realm_id);


--
-- Name: idx_realm_evt_list_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_realm_evt_list_realm ON public.realm_events_listeners USING btree (realm_id);


--
-- Name: idx_realm_evt_types_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_realm_evt_types_realm ON public.realm_enabled_event_types USING btree (realm_id);


--
-- Name: idx_realm_master_adm_cli; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_realm_master_adm_cli ON public.realm USING btree (master_admin_client);


--
-- Name: idx_realm_supp_local_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_realm_supp_local_realm ON public.realm_supported_locales USING btree (realm_id);


--
-- Name: idx_redir_uri_client; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_redir_uri_client ON public.redirect_uris USING btree (client_id);


--
-- Name: idx_req_act_prov_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_req_act_prov_realm ON public.required_action_provider USING btree (realm_id);


--
-- Name: idx_res_policy_policy; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_res_policy_policy ON public.resource_policy USING btree (policy_id);


--
-- Name: idx_res_scope_scope; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_res_scope_scope ON public.resource_scope USING btree (scope_id);


--
-- Name: idx_res_serv_pol_res_serv; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_res_serv_pol_res_serv ON public.resource_server_policy USING btree (resource_server_id);


--
-- Name: idx_res_srv_res_res_srv; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_res_srv_res_res_srv ON public.resource_server_resource USING btree (resource_server_id);


--
-- Name: idx_res_srv_scope_res_srv; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_res_srv_scope_res_srv ON public.resource_server_scope USING btree (resource_server_id);


--
-- Name: idx_role_attribute; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_role_attribute ON public.role_attribute USING btree (role_id);


--
-- Name: idx_role_clscope; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_role_clscope ON public.client_scope_role_mapping USING btree (role_id);


--
-- Name: idx_scope_mapping_role; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_scope_mapping_role ON public.scope_mapping USING btree (role_id);


--
-- Name: idx_scope_policy_policy; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_scope_policy_policy ON public.scope_policy USING btree (policy_id);


--
-- Name: idx_update_time; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_update_time ON public.migration_model USING btree (update_time);


--
-- Name: idx_us_sess_id_on_cl_sess; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_us_sess_id_on_cl_sess ON public.offline_client_session USING btree (user_session_id);


--
-- Name: idx_usconsent_clscope; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_usconsent_clscope ON public.user_consent_client_scope USING btree (user_consent_id);


--
-- Name: idx_user_attribute; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_user_attribute ON public.user_attribute USING btree (user_id);


--
-- Name: idx_user_attribute_name; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_user_attribute_name ON public.user_attribute USING btree (name, value);


--
-- Name: idx_user_consent; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_user_consent ON public.user_consent USING btree (user_id);


--
-- Name: idx_user_credential; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_user_credential ON public.credential USING btree (user_id);


--
-- Name: idx_user_email; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_user_email ON public.user_entity USING btree (email);


--
-- Name: idx_user_group_mapping; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_user_group_mapping ON public.user_group_membership USING btree (user_id);


--
-- Name: idx_user_reqactions; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_user_reqactions ON public.user_required_action USING btree (user_id);


--
-- Name: idx_user_role_mapping; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_user_role_mapping ON public.user_role_mapping USING btree (user_id);


--
-- Name: idx_user_service_account; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_user_service_account ON public.user_entity USING btree (realm_id, service_account_client_link);


--
-- Name: idx_usr_fed_map_fed_prv; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_usr_fed_map_fed_prv ON public.user_federation_mapper USING btree (federation_provider_id);


--
-- Name: idx_usr_fed_map_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_usr_fed_map_realm ON public.user_federation_mapper USING btree (realm_id);


--
-- Name: idx_usr_fed_prv_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_usr_fed_prv_realm ON public.user_federation_provider USING btree (realm_id);


--
-- Name: idx_web_orig_client; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_web_orig_client ON public.web_origins USING btree (client_id);


--
-- Name: client_session_auth_status auth_status_constraint; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_session_auth_status
    ADD CONSTRAINT auth_status_constraint FOREIGN KEY (client_session) REFERENCES public.client_session(id);


--
-- Name: identity_provider fk2b4ebc52ae5c3b34; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.identity_provider
    ADD CONSTRAINT fk2b4ebc52ae5c3b34 FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: client_attributes fk3c47c64beacca966; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_attributes
    ADD CONSTRAINT fk3c47c64beacca966 FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: federated_identity fk404288b92ef007a6; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.federated_identity
    ADD CONSTRAINT fk404288b92ef007a6 FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: client_node_registrations fk4129723ba992f594; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_node_registrations
    ADD CONSTRAINT fk4129723ba992f594 FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: client_session_note fk5edfb00ff51c2736; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_session_note
    ADD CONSTRAINT fk5edfb00ff51c2736 FOREIGN KEY (client_session) REFERENCES public.client_session(id);


--
-- Name: user_session_note fk5edfb00ff51d3472; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_session_note
    ADD CONSTRAINT fk5edfb00ff51d3472 FOREIGN KEY (user_session) REFERENCES public.user_session(id);


--
-- Name: client_session_role fk_11b7sgqw18i532811v7o2dv76; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_session_role
    ADD CONSTRAINT fk_11b7sgqw18i532811v7o2dv76 FOREIGN KEY (client_session) REFERENCES public.client_session(id);


--
-- Name: redirect_uris fk_1burs8pb4ouj97h5wuppahv9f; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.redirect_uris
    ADD CONSTRAINT fk_1burs8pb4ouj97h5wuppahv9f FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: user_federation_provider fk_1fj32f6ptolw2qy60cd8n01e8; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_federation_provider
    ADD CONSTRAINT fk_1fj32f6ptolw2qy60cd8n01e8 FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: client_session_prot_mapper fk_33a8sgqw18i532811v7o2dk89; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_session_prot_mapper
    ADD CONSTRAINT fk_33a8sgqw18i532811v7o2dk89 FOREIGN KEY (client_session) REFERENCES public.client_session(id);


--
-- Name: realm_required_credential fk_5hg65lybevavkqfki3kponh9v; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_required_credential
    ADD CONSTRAINT fk_5hg65lybevavkqfki3kponh9v FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: resource_attribute fk_5hrm2vlf9ql5fu022kqepovbr; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_attribute
    ADD CONSTRAINT fk_5hrm2vlf9ql5fu022kqepovbr FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- Name: user_attribute fk_5hrm2vlf9ql5fu043kqepovbr; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_attribute
    ADD CONSTRAINT fk_5hrm2vlf9ql5fu043kqepovbr FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: user_required_action fk_6qj3w1jw9cvafhe19bwsiuvmd; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_required_action
    ADD CONSTRAINT fk_6qj3w1jw9cvafhe19bwsiuvmd FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: keycloak_role fk_6vyqfe4cn4wlq8r6kt5vdsj5c; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.keycloak_role
    ADD CONSTRAINT fk_6vyqfe4cn4wlq8r6kt5vdsj5c FOREIGN KEY (realm) REFERENCES public.realm(id);


--
-- Name: realm_smtp_config fk_70ej8xdxgxd0b9hh6180irr0o; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_smtp_config
    ADD CONSTRAINT fk_70ej8xdxgxd0b9hh6180irr0o FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: realm_attribute fk_8shxd6l3e9atqukacxgpffptw; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_attribute
    ADD CONSTRAINT fk_8shxd6l3e9atqukacxgpffptw FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: composite_role fk_a63wvekftu8jo1pnj81e7mce2; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.composite_role
    ADD CONSTRAINT fk_a63wvekftu8jo1pnj81e7mce2 FOREIGN KEY (composite) REFERENCES public.keycloak_role(id);


--
-- Name: authentication_execution fk_auth_exec_flow; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.authentication_execution
    ADD CONSTRAINT fk_auth_exec_flow FOREIGN KEY (flow_id) REFERENCES public.authentication_flow(id);


--
-- Name: authentication_execution fk_auth_exec_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.authentication_execution
    ADD CONSTRAINT fk_auth_exec_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: authentication_flow fk_auth_flow_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.authentication_flow
    ADD CONSTRAINT fk_auth_flow_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: authenticator_config fk_auth_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.authenticator_config
    ADD CONSTRAINT fk_auth_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: client_session fk_b4ao2vcvat6ukau74wbwtfqo1; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_session
    ADD CONSTRAINT fk_b4ao2vcvat6ukau74wbwtfqo1 FOREIGN KEY (session_id) REFERENCES public.user_session(id);


--
-- Name: user_role_mapping fk_c4fqv34p1mbylloxang7b1q3l; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_role_mapping
    ADD CONSTRAINT fk_c4fqv34p1mbylloxang7b1q3l FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: client_scope_attributes fk_cl_scope_attr_scope; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_scope_attributes
    ADD CONSTRAINT fk_cl_scope_attr_scope FOREIGN KEY (scope_id) REFERENCES public.client_scope(id);


--
-- Name: client_scope_role_mapping fk_cl_scope_rm_scope; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_scope_role_mapping
    ADD CONSTRAINT fk_cl_scope_rm_scope FOREIGN KEY (scope_id) REFERENCES public.client_scope(id);


--
-- Name: client_user_session_note fk_cl_usr_ses_note; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_user_session_note
    ADD CONSTRAINT fk_cl_usr_ses_note FOREIGN KEY (client_session) REFERENCES public.client_session(id);


--
-- Name: protocol_mapper fk_cli_scope_mapper; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.protocol_mapper
    ADD CONSTRAINT fk_cli_scope_mapper FOREIGN KEY (client_scope_id) REFERENCES public.client_scope(id);


--
-- Name: client_initial_access fk_client_init_acc_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_initial_access
    ADD CONSTRAINT fk_client_init_acc_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: component_config fk_component_config; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.component_config
    ADD CONSTRAINT fk_component_config FOREIGN KEY (component_id) REFERENCES public.component(id);


--
-- Name: component fk_component_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.component
    ADD CONSTRAINT fk_component_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: realm_default_groups fk_def_groups_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_default_groups
    ADD CONSTRAINT fk_def_groups_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: user_federation_mapper_config fk_fedmapper_cfg; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_federation_mapper_config
    ADD CONSTRAINT fk_fedmapper_cfg FOREIGN KEY (user_federation_mapper_id) REFERENCES public.user_federation_mapper(id);


--
-- Name: user_federation_mapper fk_fedmapperpm_fedprv; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_federation_mapper
    ADD CONSTRAINT fk_fedmapperpm_fedprv FOREIGN KEY (federation_provider_id) REFERENCES public.user_federation_provider(id);


--
-- Name: user_federation_mapper fk_fedmapperpm_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_federation_mapper
    ADD CONSTRAINT fk_fedmapperpm_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: associated_policy fk_frsr5s213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.associated_policy
    ADD CONSTRAINT fk_frsr5s213xcx4wnkog82ssrfy FOREIGN KEY (associated_policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: scope_policy fk_frsrasp13xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.scope_policy
    ADD CONSTRAINT fk_frsrasp13xcx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: resource_server_perm_ticket fk_frsrho213xcx4wnkog82sspmt; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrho213xcx4wnkog82sspmt FOREIGN KEY (resource_server_id) REFERENCES public.resource_server(id);


--
-- Name: resource_server_resource fk_frsrho213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_resource
    ADD CONSTRAINT fk_frsrho213xcx4wnkog82ssrfy FOREIGN KEY (resource_server_id) REFERENCES public.resource_server(id);


--
-- Name: resource_server_perm_ticket fk_frsrho213xcx4wnkog83sspmt; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrho213xcx4wnkog83sspmt FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- Name: resource_server_perm_ticket fk_frsrho213xcx4wnkog84sspmt; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrho213xcx4wnkog84sspmt FOREIGN KEY (scope_id) REFERENCES public.resource_server_scope(id);


--
-- Name: associated_policy fk_frsrpas14xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.associated_policy
    ADD CONSTRAINT fk_frsrpas14xcx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: scope_policy fk_frsrpass3xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.scope_policy
    ADD CONSTRAINT fk_frsrpass3xcx4wnkog82ssrfy FOREIGN KEY (scope_id) REFERENCES public.resource_server_scope(id);


--
-- Name: resource_server_perm_ticket fk_frsrpo2128cx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrpo2128cx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: resource_server_policy fk_frsrpo213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_policy
    ADD CONSTRAINT fk_frsrpo213xcx4wnkog82ssrfy FOREIGN KEY (resource_server_id) REFERENCES public.resource_server(id);


--
-- Name: resource_scope fk_frsrpos13xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_scope
    ADD CONSTRAINT fk_frsrpos13xcx4wnkog82ssrfy FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- Name: resource_policy fk_frsrpos53xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_policy
    ADD CONSTRAINT fk_frsrpos53xcx4wnkog82ssrfy FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- Name: resource_policy fk_frsrpp213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_policy
    ADD CONSTRAINT fk_frsrpp213xcx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: resource_scope fk_frsrps213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_scope
    ADD CONSTRAINT fk_frsrps213xcx4wnkog82ssrfy FOREIGN KEY (scope_id) REFERENCES public.resource_server_scope(id);


--
-- Name: resource_server_scope fk_frsrso213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_scope
    ADD CONSTRAINT fk_frsrso213xcx4wnkog82ssrfy FOREIGN KEY (resource_server_id) REFERENCES public.resource_server(id);


--
-- Name: composite_role fk_gr7thllb9lu8q4vqa4524jjy8; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.composite_role
    ADD CONSTRAINT fk_gr7thllb9lu8q4vqa4524jjy8 FOREIGN KEY (child_role) REFERENCES public.keycloak_role(id);


--
-- Name: user_consent_client_scope fk_grntcsnt_clsc_usc; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_consent_client_scope
    ADD CONSTRAINT fk_grntcsnt_clsc_usc FOREIGN KEY (user_consent_id) REFERENCES public.user_consent(id);


--
-- Name: user_consent fk_grntcsnt_user; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_consent
    ADD CONSTRAINT fk_grntcsnt_user FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: group_attribute fk_group_attribute_group; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.group_attribute
    ADD CONSTRAINT fk_group_attribute_group FOREIGN KEY (group_id) REFERENCES public.keycloak_group(id);


--
-- Name: group_role_mapping fk_group_role_group; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.group_role_mapping
    ADD CONSTRAINT fk_group_role_group FOREIGN KEY (group_id) REFERENCES public.keycloak_group(id);


--
-- Name: realm_enabled_event_types fk_h846o4h0w8epx5nwedrf5y69j; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_enabled_event_types
    ADD CONSTRAINT fk_h846o4h0w8epx5nwedrf5y69j FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: realm_events_listeners fk_h846o4h0w8epx5nxev9f5y69j; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_events_listeners
    ADD CONSTRAINT fk_h846o4h0w8epx5nxev9f5y69j FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: identity_provider_mapper fk_idpm_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.identity_provider_mapper
    ADD CONSTRAINT fk_idpm_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: idp_mapper_config fk_idpmconfig; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.idp_mapper_config
    ADD CONSTRAINT fk_idpmconfig FOREIGN KEY (idp_mapper_id) REFERENCES public.identity_provider_mapper(id);


--
-- Name: web_origins fk_lojpho213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.web_origins
    ADD CONSTRAINT fk_lojpho213xcx4wnkog82ssrfy FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: scope_mapping fk_ouse064plmlr732lxjcn1q5f1; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.scope_mapping
    ADD CONSTRAINT fk_ouse064plmlr732lxjcn1q5f1 FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: protocol_mapper fk_pcm_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.protocol_mapper
    ADD CONSTRAINT fk_pcm_realm FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: credential fk_pfyr0glasqyl0dei3kl69r6v0; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.credential
    ADD CONSTRAINT fk_pfyr0glasqyl0dei3kl69r6v0 FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: protocol_mapper_config fk_pmconfig; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.protocol_mapper_config
    ADD CONSTRAINT fk_pmconfig FOREIGN KEY (protocol_mapper_id) REFERENCES public.protocol_mapper(id);


--
-- Name: default_client_scope fk_r_def_cli_scope_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.default_client_scope
    ADD CONSTRAINT fk_r_def_cli_scope_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: required_action_provider fk_req_act_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.required_action_provider
    ADD CONSTRAINT fk_req_act_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: resource_uris fk_resource_server_uris; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_uris
    ADD CONSTRAINT fk_resource_server_uris FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- Name: role_attribute fk_role_attribute_id; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.role_attribute
    ADD CONSTRAINT fk_role_attribute_id FOREIGN KEY (role_id) REFERENCES public.keycloak_role(id);


--
-- Name: realm_supported_locales fk_supported_locales_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_supported_locales
    ADD CONSTRAINT fk_supported_locales_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: user_federation_config fk_t13hpu1j94r2ebpekr39x5eu5; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_federation_config
    ADD CONSTRAINT fk_t13hpu1j94r2ebpekr39x5eu5 FOREIGN KEY (user_federation_provider_id) REFERENCES public.user_federation_provider(id);


--
-- Name: user_group_membership fk_user_group_user; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_group_membership
    ADD CONSTRAINT fk_user_group_user FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: policy_config fkdc34197cf864c4e43; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.policy_config
    ADD CONSTRAINT fkdc34197cf864c4e43 FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: identity_provider_config fkdc4897cf864c4e43; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.identity_provider_config
    ADD CONSTRAINT fkdc4897cf864c4e43 FOREIGN KEY (identity_provider_id) REFERENCES public.identity_provider(internal_id);


--
-- PostgreSQL database dump complete
--

--
-- Database "postgres" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 16.1 (Debian 16.1-1.pgdg120+1)
-- Dumped by pg_dump version 16.1 (Debian 16.1-1.pgdg120+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE postgres;
--
-- Name: postgres; Type: DATABASE; Schema: -; Owner: keycloak
--

CREATE DATABASE postgres WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';


ALTER DATABASE postgres OWNER TO keycloak;

\connect postgres

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: DATABASE postgres; Type: COMMENT; Schema: -; Owner: keycloak
--

COMMENT ON DATABASE postgres IS 'default administrative connection database';


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database cluster dump complete
--

