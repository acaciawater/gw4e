PGDMP         7        
        x           gw4e %   10.12 (Ubuntu 10.12-0ubuntu0.18.04.1) %   10.12 (Ubuntu 10.12-0ubuntu0.18.04.1)    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                       false            �           1262    517726    gw4e    DATABASE     v   CREATE DATABASE gw4e WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.UTF-8' LC_CTYPE = 'en_US.UTF-8';
    DROP DATABASE gw4e;
             theo    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
             postgres    false            �           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                  postgres    false    3                        3079    13041    plpgsql 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;
    DROP EXTENSION plpgsql;
                  false            �           0    0    EXTENSION plpgsql    COMMENT     @   COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';
                       false    1            �            1259    517727 
   auth_group    TABLE     f   CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);
    DROP TABLE public.auth_group;
       public         theo    false    3            �            1259    517730    auth_group_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.auth_group_id_seq;
       public       theo    false    3    196            �           0    0    auth_group_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;
            public       theo    false    197            �            1259    517732    auth_group_permissions    TABLE     �   CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);
 *   DROP TABLE public.auth_group_permissions;
       public         theo    false    3            �            1259    517735    auth_group_permissions_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.auth_group_permissions_id_seq;
       public       theo    false    3    198            �           0    0    auth_group_permissions_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;
            public       theo    false    199            �            1259    517737    auth_permission    TABLE     �   CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);
 #   DROP TABLE public.auth_permission;
       public         theo    false    3            �            1259    517740    auth_permission_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.auth_permission_id_seq;
       public       theo    false    200    3            �           0    0    auth_permission_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;
            public       theo    false    201            �            1259    517742 	   auth_user    TABLE     �  CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);
    DROP TABLE public.auth_user;
       public         theo    false    3            �            1259    517748    auth_user_groups    TABLE        CREATE TABLE public.auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);
 $   DROP TABLE public.auth_user_groups;
       public         theo    false    3            �            1259    517751    auth_user_groups_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.auth_user_groups_id_seq;
       public       theo    false    3    203            �           0    0    auth_user_groups_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;
            public       theo    false    204            �            1259    517753    auth_user_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.auth_user_id_seq;
       public       theo    false    3    202            �           0    0    auth_user_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;
            public       theo    false    205            �            1259    517755    auth_user_user_permissions    TABLE     �   CREATE TABLE public.auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);
 .   DROP TABLE public.auth_user_user_permissions;
       public         theo    false    3            �            1259    517758 !   auth_user_user_permissions_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public.auth_user_user_permissions_id_seq;
       public       theo    false    206    3            �           0    0 !   auth_user_user_permissions_id_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;
            public       theo    false    207            �            1259    517760    django_admin_log    TABLE     �  CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);
 $   DROP TABLE public.django_admin_log;
       public         theo    false    3            �            1259    517767    django_admin_log_id_seq    SEQUENCE     �   CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.django_admin_log_id_seq;
       public       theo    false    208    3            �           0    0    django_admin_log_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;
            public       theo    false    209            �            1259    517769    django_content_type    TABLE     �   CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);
 '   DROP TABLE public.django_content_type;
       public         theo    false    3            �            1259    517772    django_content_type_id_seq    SEQUENCE     �   CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.django_content_type_id_seq;
       public       theo    false    210    3            �           0    0    django_content_type_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;
            public       theo    false    211            �            1259    517774    django_migrations    TABLE     �   CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);
 %   DROP TABLE public.django_migrations;
       public         theo    false    3            �            1259    517780    django_migrations_id_seq    SEQUENCE     �   CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.django_migrations_id_seq;
       public       theo    false    3    212            �           0    0    django_migrations_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;
            public       theo    false    213            �            1259    517782    django_session    TABLE     �   CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);
 "   DROP TABLE public.django_session;
       public         theo    false    3            �            1259    517788    django_site    TABLE     �   CREATE TABLE public.django_site (
    id integer NOT NULL,
    domain character varying(100) NOT NULL,
    name character varying(50) NOT NULL
);
    DROP TABLE public.django_site;
       public         theo    false    3            �            1259    517791    django_site_id_seq    SEQUENCE     �   CREATE SEQUENCE public.django_site_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.django_site_id_seq;
       public       theo    false    3    215            �           0    0    django_site_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.django_site_id_seq OWNED BY public.django_site.id;
            public       theo    false    216            �            1259    517793    maps_document    TABLE     
  CREATE TABLE public.maps_document (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    description text,
    url character varying(200) NOT NULL,
    group_id integer NOT NULL,
    cluster character varying(30),
    doc character varying(100)
);
 !   DROP TABLE public.maps_document;
       public         theo    false    3            �            1259    517799    maps_document_id_seq    SEQUENCE     �   CREATE SEQUENCE public.maps_document_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.maps_document_id_seq;
       public       theo    false    217    3            �           0    0    maps_document_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.maps_document_id_seq OWNED BY public.maps_document.id;
            public       theo    false    218            �            1259    517801    maps_documentgroup    TABLE     �   CREATE TABLE public.maps_documentgroup (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    parent_id integer
);
 &   DROP TABLE public.maps_documentgroup;
       public         theo    false    3            �            1259    517804    maps_documentgroup_id_seq    SEQUENCE     �   CREATE SEQUENCE public.maps_documentgroup_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.maps_documentgroup_id_seq;
       public       theo    false    3    219            �           0    0    maps_documentgroup_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.maps_documentgroup_id_seq OWNED BY public.maps_documentgroup.id;
            public       theo    false    220            �            1259    517806 
   maps_group    TABLE     �   CREATE TABLE public.maps_group (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    map_id integer NOT NULL
);
    DROP TABLE public.maps_group;
       public         theo    false    3            �            1259    517809    maps_group_id_seq    SEQUENCE     �   CREATE SEQUENCE public.maps_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.maps_group_id_seq;
       public       theo    false    221    3            �           0    0    maps_group_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.maps_group_id_seq OWNED BY public.maps_group.id;
            public       theo    false    222            �            1259    517811 
   maps_layer    TABLE     ;  CREATE TABLE public.maps_layer (
    id integer NOT NULL,
    "order" smallint NOT NULL,
    visible boolean NOT NULL,
    format character varying(50) NOT NULL,
    minzoom smallint,
    maxzoom smallint,
    transparent boolean NOT NULL,
    opacity numeric(4,1) NOT NULL,
    layer_id integer,
    map_id integer NOT NULL,
    use_extent boolean NOT NULL,
    clickable boolean NOT NULL,
    properties character varying(200),
    allow_download boolean NOT NULL,
    download_url character varying(200),
    stylesheet character varying(200),
    group_id integer
);
    DROP TABLE public.maps_layer;
       public         theo    false    3            �            1259    517817    maps_layer_id_seq    SEQUENCE     �   CREATE SEQUENCE public.maps_layer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.maps_layer_id_seq;
       public       theo    false    223    3            �           0    0    maps_layer_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.maps_layer_id_seq OWNED BY public.maps_layer.id;
            public       theo    false    224            �            1259    517819    maps_map    TABLE     �   CREATE TABLE public.maps_map (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    bbox character varying(100),
    slug character varying(50)
);
    DROP TABLE public.maps_map;
       public         theo    false    3            �            1259    517822    maps_map_id_seq    SEQUENCE     �   CREATE SEQUENCE public.maps_map_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.maps_map_id_seq;
       public       theo    false    225    3            �           0    0    maps_map_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.maps_map_id_seq OWNED BY public.maps_map.id;
            public       theo    false    226            �            1259    517824    maps_mirror    TABLE     e   CREATE TABLE public.maps_mirror (
    map_ptr_id integer NOT NULL,
    server_id integer NOT NULL
);
    DROP TABLE public.maps_mirror;
       public         theo    false    3            �            1259    517827    maps_project    TABLE       CREATE TABLE public.maps_project (
    id integer NOT NULL,
    slug character varying(50) NOT NULL,
    name character varying(100) NOT NULL,
    map_id integer,
    timeseries_id integer,
    logo character varying(100),
    title character varying(100) NOT NULL
);
     DROP TABLE public.maps_project;
       public         theo    false    3            �            1259    517830    maps_project_id_seq    SEQUENCE     �   CREATE SEQUENCE public.maps_project_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.maps_project_id_seq;
       public       theo    false    3    228            �           0    0    maps_project_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.maps_project_id_seq OWNED BY public.maps_project.id;
            public       theo    false    229            �            1259    517832    maps_timeseries    TABLE       CREATE TABLE public.maps_timeseries (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    server character varying(200) NOT NULL,
    locations character varying(100) NOT NULL,
    popup character varying(100) NOT NULL,
    chart character varying(100) NOT NULL
);
 #   DROP TABLE public.maps_timeseries;
       public         theo    false    3            �            1259    517838    maps_timeseries_id_seq    SEQUENCE     �   CREATE SEQUENCE public.maps_timeseries_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.maps_timeseries_id_seq;
       public       theo    false    3    230            �           0    0    maps_timeseries_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.maps_timeseries_id_seq OWNED BY public.maps_timeseries.id;
            public       theo    false    231            �            1259    517840    maps_userconfig    TABLE     �   CREATE TABLE public.maps_userconfig (
    id integer NOT NULL,
    "order" smallint NOT NULL,
    visible boolean NOT NULL,
    layer_id integer NOT NULL,
    user_id integer NOT NULL
);
 #   DROP TABLE public.maps_userconfig;
       public         theo    false    3            �            1259    517843    maps_userconfig_id_seq    SEQUENCE     �   CREATE SEQUENCE public.maps_userconfig_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.maps_userconfig_id_seq;
       public       theo    false    3    232            �           0    0    maps_userconfig_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.maps_userconfig_id_seq OWNED BY public.maps_userconfig.id;
            public       theo    false    233            �            1259    518171 	   ogc_layer    TABLE     �   CREATE TABLE public.ogc_layer (
    id integer NOT NULL,
    layername character varying(100) NOT NULL,
    title character varying(100) NOT NULL,
    bbox character varying(100),
    attribution character varying(200),
    server_id integer NOT NULL
);
    DROP TABLE public.ogc_layer;
       public         theo    false    3            �            1259    518169    ogc_layer_id_seq    SEQUENCE     �   CREATE SEQUENCE public.ogc_layer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.ogc_layer_id_seq;
       public       theo    false    3    246            �           0    0    ogc_layer_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.ogc_layer_id_seq OWNED BY public.ogc_layer.id;
            public       theo    false    245            �            1259    518161 
   ogc_server    TABLE     �   CREATE TABLE public.ogc_server (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    url character varying(255) NOT NULL,
    service_type character varying(4) NOT NULL,
    version character varying(10) NOT NULL
);
    DROP TABLE public.ogc_server;
       public         theo    false    3            �            1259    518159    ogc_server_id_seq    SEQUENCE     �   CREATE SEQUENCE public.ogc_server_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.ogc_server_id_seq;
       public       theo    false    3    244            �           0    0    ogc_server_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.ogc_server_id_seq OWNED BY public.ogc_server.id;
            public       theo    false    243            �            1259    517845    thumbnail_kvstore    TABLE     l   CREATE TABLE public.thumbnail_kvstore (
    key character varying(200) NOT NULL,
    value text NOT NULL
);
 %   DROP TABLE public.thumbnail_kvstore;
       public         theo    false    3            �            1259    517851 	   wfs_layer    TABLE     �   CREATE TABLE public.wfs_layer (
    id integer NOT NULL,
    layername character varying(100) NOT NULL,
    title character varying(100) NOT NULL,
    server_id integer NOT NULL,
    bbox character varying(100)
);
    DROP TABLE public.wfs_layer;
       public         theo    false    3            �            1259    517854    wfs_layer_id_seq    SEQUENCE     �   CREATE SEQUENCE public.wfs_layer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.wfs_layer_id_seq;
       public       theo    false    3    235            �           0    0    wfs_layer_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.wfs_layer_id_seq OWNED BY public.wfs_layer.id;
            public       theo    false    236            �            1259    517856 
   wfs_server    TABLE     �   CREATE TABLE public.wfs_server (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    url character varying(255) NOT NULL,
    version character varying(10) NOT NULL
);
    DROP TABLE public.wfs_server;
       public         theo    false    3            �            1259    517859    wfs_server_id_seq    SEQUENCE     �   CREATE SEQUENCE public.wfs_server_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.wfs_server_id_seq;
       public       theo    false    3    237            �           0    0    wfs_server_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.wfs_server_id_seq OWNED BY public.wfs_server.id;
            public       theo    false    238            �            1259    517861 	   wms_layer    TABLE     =  CREATE TABLE public.wms_layer (
    id integer NOT NULL,
    layername character varying(100) NOT NULL,
    title character varying(100) NOT NULL,
    tiled boolean NOT NULL,
    attribution character varying(200),
    server_id integer NOT NULL,
    bbox character varying(100),
    legend character varying(200)
);
    DROP TABLE public.wms_layer;
       public         theo    false    3            �            1259    517867    wms_layer_id_seq    SEQUENCE     �   CREATE SEQUENCE public.wms_layer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.wms_layer_id_seq;
       public       theo    false    3    239            �           0    0    wms_layer_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.wms_layer_id_seq OWNED BY public.wms_layer.id;
            public       theo    false    240            �            1259    517869 
   wms_server    TABLE     �   CREATE TABLE public.wms_server (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    url character varying(255) NOT NULL,
    version character varying(10) NOT NULL
);
    DROP TABLE public.wms_server;
       public         theo    false    3            �            1259    517872    wms_server_id_seq    SEQUENCE     �   CREATE SEQUENCE public.wms_server_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.wms_server_id_seq;
       public       theo    false    241    3            �           0    0    wms_server_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.wms_server_id_seq OWNED BY public.wms_server.id;
            public       theo    false    242            �           2604    517874    auth_group id    DEFAULT     n   ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);
 <   ALTER TABLE public.auth_group ALTER COLUMN id DROP DEFAULT;
       public       theo    false    197    196            �           2604    517875    auth_group_permissions id    DEFAULT     �   ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);
 H   ALTER TABLE public.auth_group_permissions ALTER COLUMN id DROP DEFAULT;
       public       theo    false    199    198            �           2604    517876    auth_permission id    DEFAULT     x   ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);
 A   ALTER TABLE public.auth_permission ALTER COLUMN id DROP DEFAULT;
       public       theo    false    201    200            �           2604    517877    auth_user id    DEFAULT     l   ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);
 ;   ALTER TABLE public.auth_user ALTER COLUMN id DROP DEFAULT;
       public       theo    false    205    202            �           2604    517878    auth_user_groups id    DEFAULT     z   ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);
 B   ALTER TABLE public.auth_user_groups ALTER COLUMN id DROP DEFAULT;
       public       theo    false    204    203            �           2604    517879    auth_user_user_permissions id    DEFAULT     �   ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);
 L   ALTER TABLE public.auth_user_user_permissions ALTER COLUMN id DROP DEFAULT;
       public       theo    false    207    206            �           2604    517880    django_admin_log id    DEFAULT     z   ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);
 B   ALTER TABLE public.django_admin_log ALTER COLUMN id DROP DEFAULT;
       public       theo    false    209    208            �           2604    517881    django_content_type id    DEFAULT     �   ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);
 E   ALTER TABLE public.django_content_type ALTER COLUMN id DROP DEFAULT;
       public       theo    false    211    210            �           2604    517882    django_migrations id    DEFAULT     |   ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);
 C   ALTER TABLE public.django_migrations ALTER COLUMN id DROP DEFAULT;
       public       theo    false    213    212            �           2604    517883    django_site id    DEFAULT     p   ALTER TABLE ONLY public.django_site ALTER COLUMN id SET DEFAULT nextval('public.django_site_id_seq'::regclass);
 =   ALTER TABLE public.django_site ALTER COLUMN id DROP DEFAULT;
       public       theo    false    216    215            �           2604    517884    maps_document id    DEFAULT     t   ALTER TABLE ONLY public.maps_document ALTER COLUMN id SET DEFAULT nextval('public.maps_document_id_seq'::regclass);
 ?   ALTER TABLE public.maps_document ALTER COLUMN id DROP DEFAULT;
       public       theo    false    218    217            �           2604    517885    maps_documentgroup id    DEFAULT     ~   ALTER TABLE ONLY public.maps_documentgroup ALTER COLUMN id SET DEFAULT nextval('public.maps_documentgroup_id_seq'::regclass);
 D   ALTER TABLE public.maps_documentgroup ALTER COLUMN id DROP DEFAULT;
       public       theo    false    220    219            �           2604    517886    maps_group id    DEFAULT     n   ALTER TABLE ONLY public.maps_group ALTER COLUMN id SET DEFAULT nextval('public.maps_group_id_seq'::regclass);
 <   ALTER TABLE public.maps_group ALTER COLUMN id DROP DEFAULT;
       public       theo    false    222    221            �           2604    517887    maps_layer id    DEFAULT     n   ALTER TABLE ONLY public.maps_layer ALTER COLUMN id SET DEFAULT nextval('public.maps_layer_id_seq'::regclass);
 <   ALTER TABLE public.maps_layer ALTER COLUMN id DROP DEFAULT;
       public       theo    false    224    223            �           2604    517888    maps_map id    DEFAULT     j   ALTER TABLE ONLY public.maps_map ALTER COLUMN id SET DEFAULT nextval('public.maps_map_id_seq'::regclass);
 :   ALTER TABLE public.maps_map ALTER COLUMN id DROP DEFAULT;
       public       theo    false    226    225            �           2604    517889    maps_project id    DEFAULT     r   ALTER TABLE ONLY public.maps_project ALTER COLUMN id SET DEFAULT nextval('public.maps_project_id_seq'::regclass);
 >   ALTER TABLE public.maps_project ALTER COLUMN id DROP DEFAULT;
       public       theo    false    229    228            �           2604    517890    maps_timeseries id    DEFAULT     x   ALTER TABLE ONLY public.maps_timeseries ALTER COLUMN id SET DEFAULT nextval('public.maps_timeseries_id_seq'::regclass);
 A   ALTER TABLE public.maps_timeseries ALTER COLUMN id DROP DEFAULT;
       public       theo    false    231    230            �           2604    517891    maps_userconfig id    DEFAULT     x   ALTER TABLE ONLY public.maps_userconfig ALTER COLUMN id SET DEFAULT nextval('public.maps_userconfig_id_seq'::regclass);
 A   ALTER TABLE public.maps_userconfig ALTER COLUMN id DROP DEFAULT;
       public       theo    false    233    232            �           2604    518174    ogc_layer id    DEFAULT     l   ALTER TABLE ONLY public.ogc_layer ALTER COLUMN id SET DEFAULT nextval('public.ogc_layer_id_seq'::regclass);
 ;   ALTER TABLE public.ogc_layer ALTER COLUMN id DROP DEFAULT;
       public       theo    false    246    245    246            �           2604    518164    ogc_server id    DEFAULT     n   ALTER TABLE ONLY public.ogc_server ALTER COLUMN id SET DEFAULT nextval('public.ogc_server_id_seq'::regclass);
 <   ALTER TABLE public.ogc_server ALTER COLUMN id DROP DEFAULT;
       public       theo    false    244    243    244            �           2604    517892    wfs_layer id    DEFAULT     l   ALTER TABLE ONLY public.wfs_layer ALTER COLUMN id SET DEFAULT nextval('public.wfs_layer_id_seq'::regclass);
 ;   ALTER TABLE public.wfs_layer ALTER COLUMN id DROP DEFAULT;
       public       theo    false    236    235            �           2604    517893    wfs_server id    DEFAULT     n   ALTER TABLE ONLY public.wfs_server ALTER COLUMN id SET DEFAULT nextval('public.wfs_server_id_seq'::regclass);
 <   ALTER TABLE public.wfs_server ALTER COLUMN id DROP DEFAULT;
       public       theo    false    238    237            �           2604    517894    wms_layer id    DEFAULT     l   ALTER TABLE ONLY public.wms_layer ALTER COLUMN id SET DEFAULT nextval('public.wms_layer_id_seq'::regclass);
 ;   ALTER TABLE public.wms_layer ALTER COLUMN id DROP DEFAULT;
       public       theo    false    240    239            �           2604    517895    wms_server id    DEFAULT     n   ALTER TABLE ONLY public.wms_server ALTER COLUMN id SET DEFAULT nextval('public.wms_server_id_seq'::regclass);
 <   ALTER TABLE public.wms_server ALTER COLUMN id DROP DEFAULT;
       public       theo    false    242    241            �          0    517727 
   auth_group 
   TABLE DATA               .   COPY public.auth_group (id, name) FROM stdin;
    public       theo    false    196   !E      �          0    517732    auth_group_permissions 
   TABLE DATA               M   COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
    public       theo    false    198   >E      �          0    517737    auth_permission 
   TABLE DATA               N   COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
    public       theo    false    200   [E      �          0    517742 	   auth_user 
   TABLE DATA               �   COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
    public       theo    false    202   �H      �          0    517748    auth_user_groups 
   TABLE DATA               A   COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
    public       theo    false    203   dJ      �          0    517755    auth_user_user_permissions 
   TABLE DATA               P   COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
    public       theo    false    206   �J      �          0    517760    django_admin_log 
   TABLE DATA               �   COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
    public       theo    false    208   �J      �          0    517769    django_content_type 
   TABLE DATA               C   COPY public.django_content_type (id, app_label, model) FROM stdin;
    public       theo    false    210   �|      �          0    517774    django_migrations 
   TABLE DATA               C   COPY public.django_migrations (id, app, name, applied) FROM stdin;
    public       theo    false    212   �}      �          0    517782    django_session 
   TABLE DATA               P   COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
    public       theo    false    214   �      �          0    517788    django_site 
   TABLE DATA               7   COPY public.django_site (id, domain, name) FROM stdin;
    public       theo    false    215   �      �          0    517793    maps_document 
   TABLE DATA               [   COPY public.maps_document (id, name, description, url, group_id, cluster, doc) FROM stdin;
    public       theo    false    217   9�      �          0    517801    maps_documentgroup 
   TABLE DATA               A   COPY public.maps_documentgroup (id, name, parent_id) FROM stdin;
    public       theo    false    219   ��      �          0    517806 
   maps_group 
   TABLE DATA               6   COPY public.maps_group (id, name, map_id) FROM stdin;
    public       theo    false    221   Ԓ      �          0    517811 
   maps_layer 
   TABLE DATA               �   COPY public.maps_layer (id, "order", visible, format, minzoom, maxzoom, transparent, opacity, layer_id, map_id, use_extent, clickable, properties, allow_download, download_url, stylesheet, group_id) FROM stdin;
    public       theo    false    223   �      �          0    517819    maps_map 
   TABLE DATA               8   COPY public.maps_map (id, name, bbox, slug) FROM stdin;
    public       theo    false    225   ��      �          0    517824    maps_mirror 
   TABLE DATA               <   COPY public.maps_mirror (map_ptr_id, server_id) FROM stdin;
    public       theo    false    227   ��      �          0    517827    maps_project 
   TABLE DATA               Z   COPY public.maps_project (id, slug, name, map_id, timeseries_id, logo, title) FROM stdin;
    public       theo    false    228   �      �          0    517832    maps_timeseries 
   TABLE DATA               T   COPY public.maps_timeseries (id, name, server, locations, popup, chart) FROM stdin;
    public       theo    false    230   ��      �          0    517840    maps_userconfig 
   TABLE DATA               R   COPY public.maps_userconfig (id, "order", visible, layer_id, user_id) FROM stdin;
    public       theo    false    232   �      �          0    518171 	   ogc_layer 
   TABLE DATA               W   COPY public.ogc_layer (id, layername, title, bbox, attribution, server_id) FROM stdin;
    public       theo    false    246   ڙ      �          0    518161 
   ogc_server 
   TABLE DATA               J   COPY public.ogc_server (id, name, url, service_type, version) FROM stdin;
    public       theo    false    244   ��      �          0    517845    thumbnail_kvstore 
   TABLE DATA               7   COPY public.thumbnail_kvstore (key, value) FROM stdin;
    public       theo    false    234   �      �          0    517851 	   wfs_layer 
   TABLE DATA               J   COPY public.wfs_layer (id, layername, title, server_id, bbox) FROM stdin;
    public       theo    false    235   �      �          0    517856 
   wfs_server 
   TABLE DATA               <   COPY public.wfs_server (id, name, url, version) FROM stdin;
    public       theo    false    237   n�      �          0    517861 	   wms_layer 
   TABLE DATA               f   COPY public.wms_layer (id, layername, title, tiled, attribution, server_id, bbox, legend) FROM stdin;
    public       theo    false    239   ȸ      �          0    517869 
   wms_server 
   TABLE DATA               <   COPY public.wms_server (id, name, url, version) FROM stdin;
    public       theo    false    241   ��      �           0    0    auth_group_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);
            public       theo    false    197            �           0    0    auth_group_permissions_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);
            public       theo    false    199            �           0    0    auth_permission_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.auth_permission_id_seq', 92, true);
            public       theo    false    201            �           0    0    auth_user_groups_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);
            public       theo    false    204            �           0    0    auth_user_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.auth_user_id_seq', 4, true);
            public       theo    false    205            �           0    0 !   auth_user_user_permissions_id_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);
            public       theo    false    207                        0    0    django_admin_log_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.django_admin_log_id_seq', 646, true);
            public       theo    false    209                       0    0    django_content_type_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.django_content_type_id_seq', 23, true);
            public       theo    false    211                       0    0    django_migrations_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.django_migrations_id_seq', 59, true);
            public       theo    false    213                       0    0    django_site_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.django_site_id_seq', 2, true);
            public       theo    false    216                       0    0    maps_document_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.maps_document_id_seq', 81, true);
            public       theo    false    218                       0    0    maps_documentgroup_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.maps_documentgroup_id_seq', 27, true);
            public       theo    false    220                       0    0    maps_group_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.maps_group_id_seq', 9, true);
            public       theo    false    222                       0    0    maps_layer_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.maps_layer_id_seq', 367, true);
            public       theo    false    224                       0    0    maps_map_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.maps_map_id_seq', 18, true);
            public       theo    false    226            	           0    0    maps_project_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.maps_project_id_seq', 5, true);
            public       theo    false    229            
           0    0    maps_timeseries_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.maps_timeseries_id_seq', 1, true);
            public       theo    false    231                       0    0    maps_userconfig_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.maps_userconfig_id_seq', 104, true);
            public       theo    false    233                       0    0    ogc_layer_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.ogc_layer_id_seq', 1, false);
            public       theo    false    245                       0    0    ogc_server_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.ogc_server_id_seq', 1, false);
            public       theo    false    243                       0    0    wfs_layer_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.wfs_layer_id_seq', 4, true);
            public       theo    false    236                       0    0    wfs_server_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.wfs_server_id_seq', 1, true);
            public       theo    false    238                       0    0    wms_layer_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.wms_layer_id_seq', 410, true);
            public       theo    false    240                       0    0    wms_server_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.wms_server_id_seq', 8, true);
            public       theo    false    242            �           2606    517897    auth_group auth_group_name_key 
   CONSTRAINT     Y   ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);
 H   ALTER TABLE ONLY public.auth_group DROP CONSTRAINT auth_group_name_key;
       public         theo    false    196            �           2606    517899 R   auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);
 |   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq;
       public         theo    false    198    198            �           2606    517901 2   auth_group_permissions auth_group_permissions_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_pkey;
       public         theo    false    198            �           2606    517903    auth_group auth_group_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.auth_group DROP CONSTRAINT auth_group_pkey;
       public         theo    false    196            �           2606    517905 F   auth_permission auth_permission_content_type_id_codename_01ab375a_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);
 p   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq;
       public         theo    false    200    200            �           2606    517907 $   auth_permission auth_permission_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_pkey;
       public         theo    false    200            �           2606    517909 &   auth_user_groups auth_user_groups_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_pkey;
       public         theo    false    203            �           2606    517911 @   auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);
 j   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq;
       public         theo    false    203    203            �           2606    517913    auth_user auth_user_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.auth_user DROP CONSTRAINT auth_user_pkey;
       public         theo    false    202            �           2606    517915 :   auth_user_user_permissions auth_user_user_permissions_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);
 d   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_pkey;
       public         theo    false    206            �           2606    517917 Y   auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);
 �   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq;
       public         theo    false    206    206            �           2606    517919     auth_user auth_user_username_key 
   CONSTRAINT     _   ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);
 J   ALTER TABLE ONLY public.auth_user DROP CONSTRAINT auth_user_username_key;
       public         theo    false    202            �           2606    517921 &   django_admin_log django_admin_log_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_pkey;
       public         theo    false    208            �           2606    517923 E   django_content_type django_content_type_app_label_model_76bd3d3b_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);
 o   ALTER TABLE ONLY public.django_content_type DROP CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq;
       public         theo    false    210    210            �           2606    517925 ,   django_content_type django_content_type_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.django_content_type DROP CONSTRAINT django_content_type_pkey;
       public         theo    false    210            �           2606    517927 (   django_migrations django_migrations_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.django_migrations DROP CONSTRAINT django_migrations_pkey;
       public         theo    false    212            �           2606    517929 "   django_session django_session_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);
 L   ALTER TABLE ONLY public.django_session DROP CONSTRAINT django_session_pkey;
       public         theo    false    214            �           2606    517931 ,   django_site django_site_domain_a2e37b91_uniq 
   CONSTRAINT     i   ALTER TABLE ONLY public.django_site
    ADD CONSTRAINT django_site_domain_a2e37b91_uniq UNIQUE (domain);
 V   ALTER TABLE ONLY public.django_site DROP CONSTRAINT django_site_domain_a2e37b91_uniq;
       public         theo    false    215            �           2606    517933    django_site django_site_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.django_site
    ADD CONSTRAINT django_site_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.django_site DROP CONSTRAINT django_site_pkey;
       public         theo    false    215            �           2606    517935     maps_document maps_document_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.maps_document
    ADD CONSTRAINT maps_document_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.maps_document DROP CONSTRAINT maps_document_pkey;
       public         theo    false    217            �           2606    517937 *   maps_documentgroup maps_documentgroup_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.maps_documentgroup
    ADD CONSTRAINT maps_documentgroup_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY public.maps_documentgroup DROP CONSTRAINT maps_documentgroup_pkey;
       public         theo    false    219            �           2606    517939 /   maps_group maps_group_name_map_id_ed0f8b18_uniq 
   CONSTRAINT     r   ALTER TABLE ONLY public.maps_group
    ADD CONSTRAINT maps_group_name_map_id_ed0f8b18_uniq UNIQUE (name, map_id);
 Y   ALTER TABLE ONLY public.maps_group DROP CONSTRAINT maps_group_name_map_id_ed0f8b18_uniq;
       public         theo    false    221    221            �           2606    517941    maps_group maps_group_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.maps_group
    ADD CONSTRAINT maps_group_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.maps_group DROP CONSTRAINT maps_group_pkey;
       public         theo    false    221            �           2606    517943    maps_layer maps_layer_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.maps_layer
    ADD CONSTRAINT maps_layer_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.maps_layer DROP CONSTRAINT maps_layer_pkey;
       public         theo    false    223            �           2606    517945    maps_map maps_map_name_key 
   CONSTRAINT     U   ALTER TABLE ONLY public.maps_map
    ADD CONSTRAINT maps_map_name_key UNIQUE (name);
 D   ALTER TABLE ONLY public.maps_map DROP CONSTRAINT maps_map_name_key;
       public         theo    false    225            �           2606    517947    maps_map maps_map_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.maps_map
    ADD CONSTRAINT maps_map_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.maps_map DROP CONSTRAINT maps_map_pkey;
       public         theo    false    225            �           2606    517949    maps_mirror maps_mirror_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.maps_mirror
    ADD CONSTRAINT maps_mirror_pkey PRIMARY KEY (map_ptr_id);
 F   ALTER TABLE ONLY public.maps_mirror DROP CONSTRAINT maps_mirror_pkey;
       public         theo    false    227            �           2606    517951 "   maps_project maps_project_name_key 
   CONSTRAINT     ]   ALTER TABLE ONLY public.maps_project
    ADD CONSTRAINT maps_project_name_key UNIQUE (name);
 L   ALTER TABLE ONLY public.maps_project DROP CONSTRAINT maps_project_name_key;
       public         theo    false    228            �           2606    517953    maps_project maps_project_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.maps_project
    ADD CONSTRAINT maps_project_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.maps_project DROP CONSTRAINT maps_project_pkey;
       public         theo    false    228            �           2606    517955 (   maps_timeseries maps_timeseries_name_key 
   CONSTRAINT     c   ALTER TABLE ONLY public.maps_timeseries
    ADD CONSTRAINT maps_timeseries_name_key UNIQUE (name);
 R   ALTER TABLE ONLY public.maps_timeseries DROP CONSTRAINT maps_timeseries_name_key;
       public         theo    false    230            �           2606    517957 $   maps_timeseries maps_timeseries_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.maps_timeseries
    ADD CONSTRAINT maps_timeseries_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.maps_timeseries DROP CONSTRAINT maps_timeseries_pkey;
       public         theo    false    230            �           2606    517959 $   maps_userconfig maps_userconfig_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.maps_userconfig
    ADD CONSTRAINT maps_userconfig_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.maps_userconfig DROP CONSTRAINT maps_userconfig_pkey;
       public         theo    false    232                       2606    518179    ogc_layer ogc_layer_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.ogc_layer
    ADD CONSTRAINT ogc_layer_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.ogc_layer DROP CONSTRAINT ogc_layer_pkey;
       public         theo    false    246                       2606    518168    ogc_server ogc_server_name_key 
   CONSTRAINT     Y   ALTER TABLE ONLY public.ogc_server
    ADD CONSTRAINT ogc_server_name_key UNIQUE (name);
 H   ALTER TABLE ONLY public.ogc_server DROP CONSTRAINT ogc_server_name_key;
       public         theo    false    244                       2606    518166    ogc_server ogc_server_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.ogc_server
    ADD CONSTRAINT ogc_server_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.ogc_server DROP CONSTRAINT ogc_server_pkey;
       public         theo    false    244            �           2606    517961 (   thumbnail_kvstore thumbnail_kvstore_pkey 
   CONSTRAINT     g   ALTER TABLE ONLY public.thumbnail_kvstore
    ADD CONSTRAINT thumbnail_kvstore_pkey PRIMARY KEY (key);
 R   ALTER TABLE ONLY public.thumbnail_kvstore DROP CONSTRAINT thumbnail_kvstore_pkey;
       public         theo    false    234            �           2606    517963    wfs_layer wfs_layer_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.wfs_layer
    ADD CONSTRAINT wfs_layer_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.wfs_layer DROP CONSTRAINT wfs_layer_pkey;
       public         theo    false    235                       2606    517965    wfs_server wfs_server_name_key 
   CONSTRAINT     Y   ALTER TABLE ONLY public.wfs_server
    ADD CONSTRAINT wfs_server_name_key UNIQUE (name);
 H   ALTER TABLE ONLY public.wfs_server DROP CONSTRAINT wfs_server_name_key;
       public         theo    false    237                       2606    517967    wfs_server wfs_server_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.wfs_server
    ADD CONSTRAINT wfs_server_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.wfs_server DROP CONSTRAINT wfs_server_pkey;
       public         theo    false    237                       2606    517969    wms_layer wms_layer_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.wms_layer
    ADD CONSTRAINT wms_layer_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.wms_layer DROP CONSTRAINT wms_layer_pkey;
       public         theo    false    239                       2606    517971    wms_server wms_server_name_key 
   CONSTRAINT     Y   ALTER TABLE ONLY public.wms_server
    ADD CONSTRAINT wms_server_name_key UNIQUE (name);
 H   ALTER TABLE ONLY public.wms_server DROP CONSTRAINT wms_server_name_key;
       public         theo    false    241                       2606    517973    wms_server wms_server_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.wms_server
    ADD CONSTRAINT wms_server_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.wms_server DROP CONSTRAINT wms_server_pkey;
       public         theo    false    241            �           1259    517974    auth_group_name_a6ea08ec_like    INDEX     h   CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);
 1   DROP INDEX public.auth_group_name_a6ea08ec_like;
       public         theo    false    196            �           1259    517975 (   auth_group_permissions_group_id_b120cbf9    INDEX     o   CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);
 <   DROP INDEX public.auth_group_permissions_group_id_b120cbf9;
       public         theo    false    198            �           1259    517976 -   auth_group_permissions_permission_id_84c5c92e    INDEX     y   CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);
 A   DROP INDEX public.auth_group_permissions_permission_id_84c5c92e;
       public         theo    false    198            �           1259    517977 (   auth_permission_content_type_id_2f476e4b    INDEX     o   CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);
 <   DROP INDEX public.auth_permission_content_type_id_2f476e4b;
       public         theo    false    200            �           1259    517978 "   auth_user_groups_group_id_97559544    INDEX     c   CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);
 6   DROP INDEX public.auth_user_groups_group_id_97559544;
       public         theo    false    203            �           1259    517979 !   auth_user_groups_user_id_6a12ed8b    INDEX     a   CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);
 5   DROP INDEX public.auth_user_groups_user_id_6a12ed8b;
       public         theo    false    203            �           1259    517980 1   auth_user_user_permissions_permission_id_1fbb5f2c    INDEX     �   CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);
 E   DROP INDEX public.auth_user_user_permissions_permission_id_1fbb5f2c;
       public         theo    false    206            �           1259    517981 +   auth_user_user_permissions_user_id_a95ead1b    INDEX     u   CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);
 ?   DROP INDEX public.auth_user_user_permissions_user_id_a95ead1b;
       public         theo    false    206            �           1259    517982     auth_user_username_6821ab7c_like    INDEX     n   CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);
 4   DROP INDEX public.auth_user_username_6821ab7c_like;
       public         theo    false    202            �           1259    517983 )   django_admin_log_content_type_id_c4bce8eb    INDEX     q   CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);
 =   DROP INDEX public.django_admin_log_content_type_id_c4bce8eb;
       public         theo    false    208            �           1259    517984 !   django_admin_log_user_id_c564eba6    INDEX     a   CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);
 5   DROP INDEX public.django_admin_log_user_id_c564eba6;
       public         theo    false    208            �           1259    517985 #   django_session_expire_date_a5c62663    INDEX     e   CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);
 7   DROP INDEX public.django_session_expire_date_a5c62663;
       public         theo    false    214            �           1259    517986 (   django_session_session_key_c0390e0f_like    INDEX     ~   CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);
 <   DROP INDEX public.django_session_session_key_c0390e0f_like;
       public         theo    false    214            �           1259    517987     django_site_domain_a2e37b91_like    INDEX     n   CREATE INDEX django_site_domain_a2e37b91_like ON public.django_site USING btree (domain varchar_pattern_ops);
 4   DROP INDEX public.django_site_domain_a2e37b91_like;
       public         theo    false    215            �           1259    517988    maps_document_group_id_28f82613    INDEX     ]   CREATE INDEX maps_document_group_id_28f82613 ON public.maps_document USING btree (group_id);
 3   DROP INDEX public.maps_document_group_id_28f82613;
       public         theo    false    217            �           1259    517989 %   maps_documentgroup_parent_id_9f227d61    INDEX     i   CREATE INDEX maps_documentgroup_parent_id_9f227d61 ON public.maps_documentgroup USING btree (parent_id);
 9   DROP INDEX public.maps_documentgroup_parent_id_9f227d61;
       public         theo    false    219            �           1259    517990    maps_group_map_id_b89c091c    INDEX     S   CREATE INDEX maps_group_map_id_b89c091c ON public.maps_group USING btree (map_id);
 .   DROP INDEX public.maps_group_map_id_b89c091c;
       public         theo    false    221            �           1259    517991    maps_layer_group_id_1c9fee7b    INDEX     W   CREATE INDEX maps_layer_group_id_1c9fee7b ON public.maps_layer USING btree (group_id);
 0   DROP INDEX public.maps_layer_group_id_1c9fee7b;
       public         theo    false    223            �           1259    517992    maps_layer_layer_id_80931e5c    INDEX     W   CREATE INDEX maps_layer_layer_id_80931e5c ON public.maps_layer USING btree (layer_id);
 0   DROP INDEX public.maps_layer_layer_id_80931e5c;
       public         theo    false    223            �           1259    517993    maps_layer_map_id_9c271693    INDEX     S   CREATE INDEX maps_layer_map_id_9c271693 ON public.maps_layer USING btree (map_id);
 .   DROP INDEX public.maps_layer_map_id_9c271693;
       public         theo    false    223            �           1259    517994    maps_map_name_19e32e9f_like    INDEX     d   CREATE INDEX maps_map_name_19e32e9f_like ON public.maps_map USING btree (name varchar_pattern_ops);
 /   DROP INDEX public.maps_map_name_19e32e9f_like;
       public         theo    false    225            �           1259    517995    maps_map_slug_4b83c401    INDEX     K   CREATE INDEX maps_map_slug_4b83c401 ON public.maps_map USING btree (slug);
 *   DROP INDEX public.maps_map_slug_4b83c401;
       public         theo    false    225            �           1259    517996    maps_map_slug_4b83c401_like    INDEX     d   CREATE INDEX maps_map_slug_4b83c401_like ON public.maps_map USING btree (slug varchar_pattern_ops);
 /   DROP INDEX public.maps_map_slug_4b83c401_like;
       public         theo    false    225            �           1259    517997    maps_mirror_server_id_a39bd227    INDEX     [   CREATE INDEX maps_mirror_server_id_a39bd227 ON public.maps_mirror USING btree (server_id);
 2   DROP INDEX public.maps_mirror_server_id_a39bd227;
       public         theo    false    227            �           1259    517998    maps_project_map_id_59b8e313    INDEX     W   CREATE INDEX maps_project_map_id_59b8e313 ON public.maps_project USING btree (map_id);
 0   DROP INDEX public.maps_project_map_id_59b8e313;
       public         theo    false    228            �           1259    517999    maps_project_name_9d345dd5_like    INDEX     l   CREATE INDEX maps_project_name_9d345dd5_like ON public.maps_project USING btree (name varchar_pattern_ops);
 3   DROP INDEX public.maps_project_name_9d345dd5_like;
       public         theo    false    228            �           1259    518000    maps_project_slug_28c78aab    INDEX     S   CREATE INDEX maps_project_slug_28c78aab ON public.maps_project USING btree (slug);
 .   DROP INDEX public.maps_project_slug_28c78aab;
       public         theo    false    228            �           1259    518001    maps_project_slug_28c78aab_like    INDEX     l   CREATE INDEX maps_project_slug_28c78aab_like ON public.maps_project USING btree (slug varchar_pattern_ops);
 3   DROP INDEX public.maps_project_slug_28c78aab_like;
       public         theo    false    228            �           1259    518002 #   maps_project_timeseries_id_86782f44    INDEX     e   CREATE INDEX maps_project_timeseries_id_86782f44 ON public.maps_project USING btree (timeseries_id);
 7   DROP INDEX public.maps_project_timeseries_id_86782f44;
       public         theo    false    228            �           1259    518003 "   maps_timeseries_name_5fe1ba39_like    INDEX     r   CREATE INDEX maps_timeseries_name_5fe1ba39_like ON public.maps_timeseries USING btree (name varchar_pattern_ops);
 6   DROP INDEX public.maps_timeseries_name_5fe1ba39_like;
       public         theo    false    230            �           1259    518004 !   maps_userconfig_layer_id_4ee5ffcb    INDEX     a   CREATE INDEX maps_userconfig_layer_id_4ee5ffcb ON public.maps_userconfig USING btree (layer_id);
 5   DROP INDEX public.maps_userconfig_layer_id_4ee5ffcb;
       public         theo    false    232            �           1259    518005     maps_userconfig_user_id_9f8ac09d    INDEX     _   CREATE INDEX maps_userconfig_user_id_9f8ac09d ON public.maps_userconfig USING btree (user_id);
 4   DROP INDEX public.maps_userconfig_user_id_9f8ac09d;
       public         theo    false    232                       1259    518186    ogc_layer_server_id_2e8bae12    INDEX     W   CREATE INDEX ogc_layer_server_id_2e8bae12 ON public.ogc_layer USING btree (server_id);
 0   DROP INDEX public.ogc_layer_server_id_2e8bae12;
       public         theo    false    246                       1259    518180    ogc_server_name_9f2cda47_like    INDEX     h   CREATE INDEX ogc_server_name_9f2cda47_like ON public.ogc_server USING btree (name varchar_pattern_ops);
 1   DROP INDEX public.ogc_server_name_9f2cda47_like;
       public         theo    false    244            �           1259    518006 #   thumbnail_kvstore_key_3f850178_like    INDEX     t   CREATE INDEX thumbnail_kvstore_key_3f850178_like ON public.thumbnail_kvstore USING btree (key varchar_pattern_ops);
 7   DROP INDEX public.thumbnail_kvstore_key_3f850178_like;
       public         theo    false    234                        1259    518007    wfs_layer_server_id_d0062c2b    INDEX     W   CREATE INDEX wfs_layer_server_id_d0062c2b ON public.wfs_layer USING btree (server_id);
 0   DROP INDEX public.wfs_layer_server_id_d0062c2b;
       public         theo    false    235                       1259    518008    wfs_server_name_c18435cb_like    INDEX     h   CREATE INDEX wfs_server_name_c18435cb_like ON public.wfs_server USING btree (name varchar_pattern_ops);
 1   DROP INDEX public.wfs_server_name_c18435cb_like;
       public         theo    false    237                       1259    518009    wms_layer_server_id_0476e74a    INDEX     W   CREATE INDEX wms_layer_server_id_0476e74a ON public.wms_layer USING btree (server_id);
 0   DROP INDEX public.wms_layer_server_id_0476e74a;
       public         theo    false    239            	           1259    518010    wms_server_name_798851e6_like    INDEX     h   CREATE INDEX wms_server_name_798851e6_like ON public.wms_server USING btree (name varchar_pattern_ops);
 1   DROP INDEX public.wms_server_name_798851e6_like;
       public         theo    false    241                       2606    518011 O   auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;
 y   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm;
       public       theo    false    2986    198    200                       2606    518016 P   auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;
 z   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id;
       public       theo    false    198    2975    196                       2606    518021 E   auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;
 o   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co;
       public       theo    false    210    3011    200                       2606    518026 D   auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;
 n   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id;
       public       theo    false    203    2975    196                       2606    518031 B   auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 l   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id;
       public       theo    false    202    203    2988                       2606    518036 S   auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;
 }   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm;
       public       theo    false    200    2986    206                       2606    518041 V   auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id;
       public       theo    false    202    2988    206                       2606    518046 G   django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co    FK CONSTRAINT     �   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;
 q   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co;
       public       theo    false    210    3011    208                       2606    518051 B   django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 l   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id;
       public       theo    false    2988    208    202                       2606    518056 F   maps_document maps_document_group_id_28f82613_fk_maps_documentgroup_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.maps_document
    ADD CONSTRAINT maps_document_group_id_28f82613_fk_maps_documentgroup_id FOREIGN KEY (group_id) REFERENCES public.maps_documentgroup(id) DEFERRABLE INITIALLY DEFERRED;
 p   ALTER TABLE ONLY public.maps_document DROP CONSTRAINT maps_document_group_id_28f82613_fk_maps_documentgroup_id;
       public       theo    false    219    3028    217                        2606    518061 Q   maps_documentgroup maps_documentgroup_parent_id_9f227d61_fk_maps_documentgroup_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.maps_documentgroup
    ADD CONSTRAINT maps_documentgroup_parent_id_9f227d61_fk_maps_documentgroup_id FOREIGN KEY (parent_id) REFERENCES public.maps_documentgroup(id) DEFERRABLE INITIALLY DEFERRED;
 {   ALTER TABLE ONLY public.maps_documentgroup DROP CONSTRAINT maps_documentgroup_parent_id_9f227d61_fk_maps_documentgroup_id;
       public       theo    false    219    219    3028            !           2606    518066 4   maps_group maps_group_map_id_b89c091c_fk_maps_map_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.maps_group
    ADD CONSTRAINT maps_group_map_id_b89c091c_fk_maps_map_id FOREIGN KEY (map_id) REFERENCES public.maps_map(id) DEFERRABLE INITIALLY DEFERRED;
 ^   ALTER TABLE ONLY public.maps_group DROP CONSTRAINT maps_group_map_id_b89c091c_fk_maps_map_id;
       public       theo    false    225    3043    221            "           2606    518071 8   maps_layer maps_layer_group_id_1c9fee7b_fk_maps_group_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.maps_layer
    ADD CONSTRAINT maps_layer_group_id_1c9fee7b_fk_maps_group_id FOREIGN KEY (group_id) REFERENCES public.maps_group(id) DEFERRABLE INITIALLY DEFERRED;
 b   ALTER TABLE ONLY public.maps_layer DROP CONSTRAINT maps_layer_group_id_1c9fee7b_fk_maps_group_id;
       public       theo    false    221    3033    223            #           2606    518076 7   maps_layer maps_layer_layer_id_80931e5c_fk_wms_layer_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.maps_layer
    ADD CONSTRAINT maps_layer_layer_id_80931e5c_fk_wms_layer_id FOREIGN KEY (layer_id) REFERENCES public.wms_layer(id) DEFERRABLE INITIALLY DEFERRED;
 a   ALTER TABLE ONLY public.maps_layer DROP CONSTRAINT maps_layer_layer_id_80931e5c_fk_wms_layer_id;
       public       theo    false    223    3079    239            $           2606    518081 4   maps_layer maps_layer_map_id_9c271693_fk_maps_map_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.maps_layer
    ADD CONSTRAINT maps_layer_map_id_9c271693_fk_maps_map_id FOREIGN KEY (map_id) REFERENCES public.maps_map(id) DEFERRABLE INITIALLY DEFERRED;
 ^   ALTER TABLE ONLY public.maps_layer DROP CONSTRAINT maps_layer_map_id_9c271693_fk_maps_map_id;
       public       theo    false    3043    223    225            %           2606    518086 :   maps_mirror maps_mirror_map_ptr_id_9e1b690c_fk_maps_map_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.maps_mirror
    ADD CONSTRAINT maps_mirror_map_ptr_id_9e1b690c_fk_maps_map_id FOREIGN KEY (map_ptr_id) REFERENCES public.maps_map(id) DEFERRABLE INITIALLY DEFERRED;
 d   ALTER TABLE ONLY public.maps_mirror DROP CONSTRAINT maps_mirror_map_ptr_id_9e1b690c_fk_maps_map_id;
       public       theo    false    225    227    3043            &           2606    518091 ;   maps_mirror maps_mirror_server_id_a39bd227_fk_wms_server_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.maps_mirror
    ADD CONSTRAINT maps_mirror_server_id_a39bd227_fk_wms_server_id FOREIGN KEY (server_id) REFERENCES public.wms_server(id) DEFERRABLE INITIALLY DEFERRED;
 e   ALTER TABLE ONLY public.maps_mirror DROP CONSTRAINT maps_mirror_server_id_a39bd227_fk_wms_server_id;
       public       theo    false    227    241    3085            '           2606    518096 8   maps_project maps_project_map_id_59b8e313_fk_maps_map_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.maps_project
    ADD CONSTRAINT maps_project_map_id_59b8e313_fk_maps_map_id FOREIGN KEY (map_id) REFERENCES public.maps_map(id) DEFERRABLE INITIALLY DEFERRED;
 b   ALTER TABLE ONLY public.maps_project DROP CONSTRAINT maps_project_map_id_59b8e313_fk_maps_map_id;
       public       theo    false    3043    225    228            (           2606    518101 F   maps_project maps_project_timeseries_id_86782f44_fk_maps_timeseries_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.maps_project
    ADD CONSTRAINT maps_project_timeseries_id_86782f44_fk_maps_timeseries_id FOREIGN KEY (timeseries_id) REFERENCES public.maps_timeseries(id) DEFERRABLE INITIALLY DEFERRED;
 p   ALTER TABLE ONLY public.maps_project DROP CONSTRAINT maps_project_timeseries_id_86782f44_fk_maps_timeseries_id;
       public       theo    false    3062    228    230            )           2606    518106 B   maps_userconfig maps_userconfig_layer_id_4ee5ffcb_fk_maps_layer_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.maps_userconfig
    ADD CONSTRAINT maps_userconfig_layer_id_4ee5ffcb_fk_maps_layer_id FOREIGN KEY (layer_id) REFERENCES public.maps_layer(id) DEFERRABLE INITIALLY DEFERRED;
 l   ALTER TABLE ONLY public.maps_userconfig DROP CONSTRAINT maps_userconfig_layer_id_4ee5ffcb_fk_maps_layer_id;
       public       theo    false    3038    232    223            *           2606    518111 @   maps_userconfig maps_userconfig_user_id_9f8ac09d_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.maps_userconfig
    ADD CONSTRAINT maps_userconfig_user_id_9f8ac09d_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 j   ALTER TABLE ONLY public.maps_userconfig DROP CONSTRAINT maps_userconfig_user_id_9f8ac09d_fk_auth_user_id;
       public       theo    false    202    232    2988            -           2606    518181 7   ogc_layer ogc_layer_server_id_2e8bae12_fk_ogc_server_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.ogc_layer
    ADD CONSTRAINT ogc_layer_server_id_2e8bae12_fk_ogc_server_id FOREIGN KEY (server_id) REFERENCES public.ogc_server(id) DEFERRABLE INITIALLY DEFERRED;
 a   ALTER TABLE ONLY public.ogc_layer DROP CONSTRAINT ogc_layer_server_id_2e8bae12_fk_ogc_server_id;
       public       theo    false    246    244    3090            +           2606    518116 7   wfs_layer wfs_layer_server_id_d0062c2b_fk_wfs_server_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.wfs_layer
    ADD CONSTRAINT wfs_layer_server_id_d0062c2b_fk_wfs_server_id FOREIGN KEY (server_id) REFERENCES public.wfs_server(id) DEFERRABLE INITIALLY DEFERRED;
 a   ALTER TABLE ONLY public.wfs_layer DROP CONSTRAINT wfs_layer_server_id_d0062c2b_fk_wfs_server_id;
       public       theo    false    3077    235    237            ,           2606    518121 7   wms_layer wms_layer_server_id_0476e74a_fk_wms_server_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.wms_layer
    ADD CONSTRAINT wms_layer_server_id_0476e74a_fk_wms_server_id FOREIGN KEY (server_id) REFERENCES public.wms_server(id) DEFERRABLE INITIALLY DEFERRED;
 a   ALTER TABLE ONLY public.wms_layer DROP CONSTRAINT wms_layer_server_id_0476e74a_fk_wms_server_id;
       public       theo    false    239    3085    241            �      x������ � �      �      x������ � �      �   I  x�m��n�0���S�ZX��9@{i�C�(�u�Ė!+.���v������Q3+�iw�����x���<}��,�_˚��$d�gw>z�x+����gy+�5����l�HP�]�t��a<�����jq �:�vZ�"P�.I�4*��*���~1	�k[l��P]�ZS@D� e� R!�**x����$`��E��KU�3���Hs��[�Ԛ�]�����6��ś��ֺc��d��׺2^�i��&�Mr�-���ڒ`Y����1p{�D^Ĕ�D�"��~fo:��\��-� � � A��R��TL�=�.�Q���V�\�I[*�k�,M���EjI���y8��F�����[�s�,�4�(I�`r�e���l�<��ᥭ��

�'p�fŅ�#\�\�(�8�I�}�},�,dX�[�@�����L�����\O��T�j��`��ܫ�����W+�FBM�Z�w��qQ�ӗW�AG$Y(�r����Җ��Z����ϟ��t[ϭ�ٲ�l�F,�&��H�	ä24r2d��r�4�7�{��}��|Ӡo��o�6���K���3j�È���d$�Z�g�����o� �:����_���.{���r��"��,�|��߷���.~�y�v`��U_����3\�\ ��A@S����~�%�<��.Ǹ�P��!ҳ� �7�d7����B�����=�)���s��X&�v�#�+���n{/t�@�u)M���u'oJ���hi�IS".��%���(i��E(%��ק���9w�%�0�҄$�ܩ<!�s�z�B��R9����/�	9�y_�����������І{>      �   �  x�m�[o�0�g�)�����Ti�%)��ҢT�&����>� �I�eY���dcp��4�?�"²�"N���4G]���aOR�/E�����$s�th5T/w�V<%C��?lXQ����Q�f�2�3`��>�v�ڂ�B0D:eK$ӆ���o{���!vM����#E��8Ui?�R�}����랥�A�Hv�
�����*k�y���M�j��L�n�t,g�x�ְ_7q��1���kV��QVJ�(�M6Ð�~����?Z����G�)�IDI�fM��TGp��'M��@�S�%J����Q�Q!!��S��Dd\�tm[*+�y�R�U��ӄ#���w|�$���\rO˻~�������|R;mFc�C�������#��Ow_d����X��"iv�	�����      �      x������ � �      �      x������ � �      �      x��}m����g��\`�����E߼���8��bǹ����@ִ=�5�9�f�����"�-�M��[r�$0��`���.��T�AX_!}����"*Ƅ�����f�Zn���B!e~}����lu�|�T�>[�����u��ݛ�����r�����g���ٟ���?��G9vC�H/�^`YI&��E�^l���z7����M�8|Y��l��mO���ګn�]m��}�V i@�]���p��l?}`xFcl#�0���~}ADD�� �]���������@� č< ĺ@���s�
�43-ˇۧ}8�:�����Qw<��c !Q�cm�w!wۿ��	���`|�Ĝ�V�*�0�f8�|�?=�W���ʡ�{U�i�qz��EE&�
�+��z� $W��&�>�)�ׇu߮����f����r�~�K�:���Z5��k�\��z�y�a�W�:m��h�Ԃ�R�LQ����/��|y�,�v�ܠX��F�)#�==��F�����!h���2��^ݟެ��C�RZ
ΰ��o���������������.h���-�^Pa��6��*-���٫E��[��i>����}�M1`i�`q�`�B\")�pX׿�{��'|s��l�w�ۺWu��˕QM�>�C(�
/��ViE�2��Ul��������~�t���i��tu��=���o���i�����j{����{�dl��?�z�����vo~��������Y���h�؂���R������-��_�_����0��.�����Ԙ�+���E�kk�����8� ���|X�F�B��*j�}�}XՏ���f�v{[o���{�]=���x��o�D��`���eq��M��O������	m���_]���f�]�����@T4Yb��� ��t;q3U��M�~����4�n�5+i���?.w��S���d���p1�f���ލ�\��z��~�*�^���6������a�H�����wOfG�����~��h�r���Si,�3r��y��P���[P���U�t
n���]3n7�f����ױ�\t���!J"b73�����E4E6��$ō��g��_��S���+l�mƜWܚG�o���b��B�^��й����_�W��\N���:���Q8�F�^	��3����������.�v�>}X��ρ:���Bx��XaϨ�d�	+=5�W`�;�&if����p�X���کZ�^�EE�h��J�����Dxy�rF����eT��
��Y�NĬ�>z���n��(9�(E��+��.�@�v?|~��Ht��C�`<fJ��16��|��:D&tA��+%wr���-'"�U�JX�J���+����U��!Gf*)30��	-�s���c i*&�F�*�$��05�lj ���1�\ſ�mo3�Տ��a4c!��-(�Bz[�z'�,�)��^	F(�Ӂ�*��z3�w�6vCWFu�v�q�θz�p;�JP��}��ha肎����,8Z!Ar
��̣0Sy�Y�2�+��4��u�Q9��X�A��pn*.X4VQ��e��z�yzX��n��T^�?��A$�΁�3�������L��L��^A��E	�N��6~W�P�b,���W�Bk�"�J���P�gk'G����P�R
+�yL����l�"cۤsM�y��
N�2�TVcM݌GL�	�����(fbG�צ���LQ@��9O�;q�o��f�N漭���crXҘ3XZ�j�i�3G������Y�9��e"�؞;Q�����Ex������fH`�+�Md����2��qj�x$��$�2��	I"b�yŵ H8��v��^ի���~�������[��O���a53��٨�零Nǰ�S�;���m���.��ƪ�Kh��D����+_L*�%�J��6|��W1ZJ$�IWf�J�Ǝ]��z��ߍV�����������sDFu�a��8/\X��� �8J��ܩ�\X�S����]<��)���F1$��t�H#�E6^-ńa��D�\��@sҰRpBF|4ٳ���Q"� �`���.��;$�G��#3*~��Q�<4��n�F*�`�sI'�<ZS�!q��8b\5D�I	��"}D���!�&5�7ꡏ��P_��(���9E<lK�z�������D�ξ>�NFFr=8�7ۇ	�y����)�"�(�ȇI��/3�x5�OQ8�$�9�L8�QT�	*5�4q��n�pr��Q�O*.��LX��d�pm,�ESY�q�i%2���De(rl�Q����	���3�gq�!"�0���QsJ��bĊY�{L̜�v�V���Ԙ�9�}:�*{A���Q�r
�
mb>F��@��H����F1?��؅��l!n&�,�w���K`�J(���*��X6��.{�~XE֩TT����)	:����Q�
���oϣ�<���Xi�4q.�l�h>)�2UWD�ɴȎџ�'���ZI.ݦGg�l~��!pGjy,�P�5���ʈ� �F�P���I��[*&Q,���(�I*&��x�ɍӥ+cIiN�{X��aV�×5N<�v� L��k$/��s%/'��U�^��w1� ����P�1Kf,��{�1r���񒋎6�)�1��ڸ�I�@���bC�ߕiŘ_��s^��&�́
O�Fs��4)�*L�!44�@1h�F�NS�q��q�hL���0�쫗'��C�ɐ����]�� ���YaN�FLi��9{��`&a4��Sd	����4.2�z"A�R`��X.\��d3K�����*��x�B!EĠ��q�Y�de�:b�U͌ct�v́���ɤG�뤉U0=��c�hԍ�!��(͸��uq.�e�\r��4<?�ֹ�H�E8�NC�R�P$}p\�����8B)4�t5L��\\!{�O&�q��ɲG�L�H�1�']F����o�	w��r���N��R� ��mS�DN"�ёuF�9ޫң�f�H ��1_�H���i\Meeئ�ii�@w�;�8a&�k&�2A��fH�i)j,:~tT3S�0�j��J�.��2��93[�ϧ�y�gM��$�%���S��#1p'�$�1>:�O�S�1��@c�7`�F�2��f	��zn��L�]�V�R��O�f�^���N��TNc��Z*�;�ڸ5�(�U9)/1O9���&�b�:²g&r�ą�|�����Zv!�Ͱ&�v���@���E1ww�&�q�:Bc�~�������ZFac�\�WX���/�3�^�S3��Q���0j\4����%�^��� f�K�kb�dĆ�9�8�����,ED�h��/l,�-�#f�66�q�m0Z��P
���SJ$ѩ$�$���8�搣̱ٳ��%�s:�ךH���z�a,*L��,�j�Uw����mh� �."�A�Q�e�ݥ�MSl`�	_�֛�����,�:�f9f
�Ӯ�S�v㑍��	���˼PpQ�ry��v�Aҹ(�5|�͇�K��=��Н+���_aťKtt"��1��i6���	.�M�8�Ȓ.��mt_����i��I�Mq�tuy^I��;	U����M��-.�Y~Y>��9~)�c����z~��xxK_�?��*�{�T�8�6i��$dc�"��8&�
*���z蚞�0�Ҽ'�QV)���%�I~�.�R�82� �c�ņ�*J(%��sL.
	�K�\��ԣ���bp؅�ȥUr<�N]*-�b�?i&��$c�%�����`�b��'vsFBY�8R`i�1B.�wq�GFs�	����!mJ����t���x6���k�1l�T0<.�M����f�l��
9zvE*�񓑪������L&�
���'w���9>�+n=�J)c�7r�?%xR9�F�6]a�^f#o��Q�a)|��@NH�����K����b)h,�#�4\!��K���v��KFSu�Ȍ!i�	5�ѓ��cՔW�I�#g\Q����G(U�S��� �c`�<G#��4��f�rw��5���7e�\;Rh'���+ul�)\�Z(sՄ
?>��~�m���XU&6��HX    }~X�BZ�[�8\�6wNT��N�O]$�+���`Zn�ė�#�0����]���	$Cpfk���D�Y_���up�r{a�WZH*.[�������J/-2��S&��#-�pդ@�}����BG�n b3����B����`c�.tL l��4v�W�:]��O&�`�s��9��3fF�^g����$&ړ�I�Q_�n#?�ͼ��Xۨ�0:�{��}A$AnR��nr4C�昄Zf�y�$�TCt�P��� �5 r�i����DeVGÿ����I�v-�#�XaD{��Ļ_i$p�H�5��$��Nu��`#v��H����X���{��0��1;fp!�G�嘽73��(�sA;�fkkR�G�:��$�	u�g�$�F�C�����Ԓ�D\�����i�Ø�����D��DsM��i���&`7*/�Mq�7�v���+K\�
KD�݉�g�NCYly`}�q�\ń�=�+������wH�ihMS\w����
'R܎�N|����	&� ;��Y��,_�yJО�k>��Ψđ�TL���ֆ��XZ`S2������@1Ҕ����u*�K�RfO��:�9�Q���ˡ0����4�N���E��P��q�.�c�mo��L�I|�㠒W�@������� 3��F���v���R�N�y�T�5��e"�q�0u���wxV�_|���A���c��p��+^l���u���$�r�e�=:���]c��un��L\�k��Pӆ��xIZ+w.���������E���Cݠ�]�8�6�[�mDz��b!~KLO�(<��N����@z��٤&L��!=�����86�U�wBBǱF>�8'G�ۏi���3� �����.@6�Jj�us�wi.��J�c5Ej�wJ��`�^K}����9:�s�E��En�d`�f.���sQ6`��9lpQ�x�:`�@v,ݲd7y�"|���B;�ܞ<�*�Ќ��n\;@V�w1Bчv����B�Qs��~�IPY��؄*��M���^��0����%�6��O���kz�8�Ի�����q9�)�-�����%3��"ǝ�3�N��/�=�nJ9�+�l�n�C�K[f_�(��IY6A7op�c���+`g�=/>�}���Td�5�MEЖ0����XK"��S2�7���C}�61X�=��6��zN��}���z�?�ؑ�F����fX~������G��Z�@�H[�x�c��K�؃���*.��7�[���JVT��w��:�m���soegw6��=!AicA弬-�q�}m�����0�养�\�F��t;�*ˌFG��iP�A�1�K�'���"mU	��������ؘzE����ş�0i>nr�妄G�ԋ� ��wߞ~a��g+LKF��)8���1��\���M����8�1V�����ss��X�K���{�������i���><ԇ֨c�|(4�+ƺ�� �����~U�/ư��z����?�����O�'@g&��bBt'��6�#c�?A���3��Y�������o��ھ�6jD8�-$*���S� !).$ҥ�t�T�͏�v{6�������t�a6/���ʼ�-�ݦ����yGfz/j�H�1KTc�1��d!�_��g,�^ܒ5�`�"�[��$P�Q��B��}�q�"ܚ.۱���(\gLM��A&�ǔŻ�}��nq�8�誤uiP�N���uq��k�Ax�z[��Θ���D����e�`��ⴭ����ԇ�c21�M��C���8�Ȅ�R�j�(�8l��v�ǻ�j�����kc���F��c����?6J������hb�_�/כa�>e�L�(�?�f8>�	�ict�/������o?f���P,��$I�Y�cb��}�o���f�Y?ڟ��c�#���R\��d��'��}'�?D����ޑ����Q��כ_���Q�����_�#Ua���#�,��N_�ҡ>�ۯ����jq��.����K��=\cu�a�-3���)��g:�'�Ȱq52�ƖQ��F2/����MG!�'� 8�<��#i��4ⱴ��4AJ���R�s�i�Ӷ����K�m��t�N0��`�e0�f'�k`e�`<*���0����B���ve1�
�m�l��W�z�3����]����QEK����˺��Hx��[1�����G�5ԁ��E�BB>{��m�����P8is&�Z��sM�����1���+�p�6� �)�
��Y�۔@�$u�7~i���G�]c8�X{~�q�"Hpű��b��m�2ie,�q�|Q��޷0L���0]��+�+�S�Vo*`�T)vپ<�s�I�#����n�S��w�9T?�v��~2Rrq�,�݅p��7���1��E�s<_-�;�Ԙ�e�Mh�+�[��0��X�Wm�Jh�m7����������!��-� {�؞�ۻ����d���bkf9h���]:,�Q{�n|����*��y(_l��:K9h��L[_w�>�2��0�Y�r4�ӷ F`\����&c�q���>n��h`�K]�՝g�_��~}��ؘ���m���� �}�_OK��h1�Nm0.^��&Q�X��L`�� `����e�P�V�b�(������pz'9���]�|��'u�}'P��m�T"շ]�ń�3�X��k|d#���+{��Ö�Dѿ	�إ<~�*�;y�d�z�>;g��;��a��0���`cߗڊ^o�<�3���0Ί}VUF���xB �{ei�dIK��������0 �pz�H{���{C��秱����E���t.��0�4Ro�=b��gBK�M����<(ra$�{��7��ȥ���z�3����f3����_���wm&r��7�8�����6A��ėR�C�����j��;3�5�3_�7Gad.�@_ +!��Ǒ��q��mG"��.�c�����1��q�ݭo���a�)�&�܂K�^��q!�ׇA1��l����+h��B���o�!��z�y��`MF$�5|��<B�ז@#�؂�9�E넓�fipQ��h�o����$�o�������=��==Χ*(���$���$�O�[>��;k2�I�5P���:V��G��W[c���@i/�R``��ҿΩc��{13�"��P�ծ�0J�Q��_:V�.3��ڨ�*פ��|�v��4��k��y-�.�Q�^��Z�ݩ����{�Cl���:�O�T��3���v��m������/3�/t;�8�t��T��H����9P�#BA]*���4{�|]�@�̪X�jϪ�W�Q
��_㤉(���M}{��KwQ
���?�X_�;�+(�j��ڽ����������.���t�H�:y���/m�e���X3#���$0r%�d����#�!�|}}��Q�
vĶ��7=� #f����2�Jvs�to��Mw�`�?�@�)`���݊��G�e����b�������������������r	2VM������&ȟY�B\�R>��['G(l��J$����?���k%7m�Zp��M����}�:����������������z�:`G \PRW5A��gи����:"�N}�Gؼ���u�J"z�K�k�=rs����ީ`��]p���my�l4�/���������oR8Ys7�c��ޛ��^��������G1�k&��N��鮃i^uI@�>`lT�*3|�W�V(����O����o�
@M	����H��4� �����b�s�C�;�����:$ 8;�L�<FTS������M�;�}fO��3�~��$Kd��Y��e�\.���2O֗"��I�*�{=�A4ݷ9��A����a������d���\�����|��ss80̓}��[6��	��i�����<����a�{����K��NE�8Leo��-{�4�)8�i�!�こ�L�Z���w���ك�<��=�/�D�Ij�����䉿X�	p���bޘ����<i}S�qų�f�$�E��:��c�Qc@�D;K��v
�&��~�ѩ��t�e    ��2+r1��V�7I��d�xAgo|N=�����ʏJ$�Z`�0/(���p@�a^PZ�.9���,L�WU�٠���9;��]�
�]O���J��L���"y]�Ŀ��j��*�z��ɡX�W��I�s��E^e�?�#��C��N���Hbl��1,�Z���p�gw�x튼�b�FX�1N��Ģ����(�YՠuA?���'�ܰ((���EpvRzOݰ,hl�y��9VT�������*N�2����g^��ft˼���d�ˉ�2���ݔ�,��Ll�W^B�p�o�W[OeM8�$˼�RR@cN8�2�ل��X�{OC��� c�]c٬|��kO�h�yƨ@ǩT��
b�Շ�!�q{�b9Χ�Ί�Odެ�y��������ee��d���O���7(Jy��3=�����+�@F�׫�v���y���Q��<b|�98[����~�s������~{ k�|Xn���t+������?kRt�n6�/�k01���}�Gc�/�oL��.�`���(�>����o��������t�ֳaWw�=z�c��\�_�������7XKy9�?��͋_A||9̷?������������_���Ç=�ʾ����0/�A_�l�����Y���9?�Gmg�)}�ˋ��]���s��Ӫ!��Uv�&	��G/*�M�<(�T��D�j���S��TtЌ:
n��´�$�Wbo���qo�t-&R.���N�\?���L=6�W��E충J�rxe��i:�
UU~9tW���ȍ���P����(E�*,�&�;��%�ҡ��q�kOLH�6�ćBtP۞�?��M�����A�PT��"�X��Rw��wk�Y�>/?4��h4͕�aPD�)��k������)�X"���+�b�i^N���o^��כO��u�>�` mn��|�K�R<�Cyz�կx���I��׃vƳ0�X[�[9"S�g���,��e��x�%�}ߍL�aP}˿�}�����cFb�x�k@��A�.f���(���6��Ԁ�����뫟F-�D������ڔ�F4�㛅��]�T�E�2[��E�Q�h��/^�d ��L���6��IC�/�+����u�?����XjdU���\0H8����Yo��6���A�+�G�ź�W`Ѵ��]��	(��@6v���}�PE�j�K�y�/Ln��!���oۨn�+*q�I�$�)*��1oN��G{:���ier8�������wPI�/d�~:�,#���C��8O7���z��f�R��"� �)>P,k��`<��p-�W�:\��B���m��E��e�X�PD���O��*m��r�pk��J�p��:i��Y��yu�Ԝ�nsc.e��s�q������}���h�޸E�|#O��t''�F�i[�UzbH�ǋ�6"�Ԩ�!b��au��D!r({oɲ���j����u������r}d�l'��!�>�|��>	�f�&����bm��#Au
�!�$�El(E]PB+�p��GB�.$5������$]LxK��(���	$��\�/M�(�B���䙾%���ro7�-�|$�,ɡR�z�'�����"�	��2r��eLe�4�c���M�JA��Q��u�K!uK�g���+Ad��h\!�������.��C�U�G�x��M@\S)��AlҼ�urA�x,�#����ZM)h��(<�j@�n^�m㒋1��F���o� _�koFpg��B����N��0{Ʈ6��dA��D���|.1��֦Ml߸}k�TT��M�s���u��h,o
CMӃ]c�'!	�] L*�cH9UT��=���s]����8���m�� w�bB���RL�H�D�S�M:�,3f3
��i
��s���kE�F�B��$a] [0�y� T
��Bٷ�.Z(	_�99,�b�S��r&�l�|��(ʡ�MA�>�E�t�Ŵ��J�A�f%��@vr�9B���̀�Ec_�3��\���)�Ϗ���aWׇ�>���@y �C�z�����޽Jƻ�l�}؞�;�w��`�
qh�<�~�����c�+�b�����h��q����>�CP�X�i/m!�̃x�q�l^!�*@�ok|��V�T�s\�����,h�s2�������]b�3��C���j�#]}��bt�?�ͺ��jI�R�VwW���� y�u�Ю��E"��?�qVQIB���rw�
⿜
���U3v(l��R�)|Z�� C嵔��3iޘ�  ���Y�Ӱ}^99�*�kLC���r�AЮ���4D�+(w���7*,������B��TB���:%e{b4�z�����b�Կ8H�Jj�O�PPSWtԒKq��5�����F�xм���x�w]C���2?�Z�����澨�!JAK�0���!DAI�A%_d?k�PPP�MpWC[5Q
*�������!HAG݂�]�jB�T����AQAI�{�8oKY PPS��*��Ұ}AK����Z��Tz�������%D��>)��誩W�����%D=���e��}v��-u�3��4�(��wQQM\PS�(3ʫ) 
j��Td�4l_PS�B�J���85�~2z|�%���9���ST�%����E�4��+�p,2$��=�ȫ��.�i��WS��|tմY�!H^O��7�-�4� y=�OGv�'A���
'��W� y=�����'���Sp���͌� 5��T���(5��UQMC�����UT�����'�L���Q
��+-��o"��3f��VM^T�Az�+5��=�@AQ�z��9���g�^5q
j��(�^>�P
z�=	����#�(h��Ww����>�K���!JAO�{Pi �a!BAG}Y6�!HAM}YT� ���9uP����0
��\:(B��r tշ�jF����PWi=�b�f�6��%�W��y:����~G5��}��2�>�nFK��OзGh���0B ^1�R �X��5 B�!\Q �OC�<)q�]]@�%�ў���D�t!p���.) �RTԅ�Y�X�,�J�j��/@В������	��2J+�H.9������[��X&�!mNU�y����t�5����^�4�`;lws�@�.I�R�%���=+g�p[��)��=��l�b+������Z�V��=Xb��+D��'{�H��:=�����U2�Z�fߒp������"!v�&5�N�t���ˈә5�{Ő��HE%�b�q��Y;yU�YN�(�OɄ	�	ƿ�AA|u�]��W�j���_��o���7�5�ڀ:D�
*p#F�7���,dam�nWOP ,�V�e�	�8�lb�F�����M��?���$0N��Yh��?����/��Y�B
w\�ڏ�b���O�Ѷ�Pnn�gk{�?��a���_\��4��a;b����n��/ëg����5܍��6l9b�=�"a�)5��4��7������9����ױm�Vw�`����6��>X3���������^����&J�'�z�yzX��nG��n�u��"ѥ}��U�| ǁ=�St���������)�-���B�(W��Իz���D�i\�\��đ���1��������@C1�C��G�,(5���zg�L!�H`A0H1�t�֛�4zc�	8���K-\�N���^��΀?f�d��|�A͠���,ES�  ���w��z��,�dԾPj�E>~����֫��7P;nW�����8��o��ۇz?�ծ���>�o�D*ώ��3���"B�Z�Ɍ�Q�dN/��yO��v^Nd�	,��p�Si�C��P3]�臕:���z�iO� ��p���=�R��Du;a�x{#1y�S���!�>v�l5{G��8o�.7�W3��N��� \4�C�p�'�1�w���zL� 8���|�4Q$R�'�.�����K	l9�znp��⚻-��ݶ�ݖҘ	��5%��r�,0�
(��B5�z�y��^�EO�b���[�K揜��Zl�)   T]�s -Rhح���>Q���w?�r�]y��$��]�nWT������v����c�͑ݨn7��j�\nk��c�/��*}��%X��r&%P�b�'t�S�4�r�P<>�
O2DI�c�Aq�*MȦ�<Pi�],��Z�7�#�v���qY�F7Ia��xP��g�Rm&�d;C�dQ���,�S�Hq�1��G��hwHN1��@������h����o؞z�oj���7�ܼ����/��1c�w�ֻ�`��"��ta���;�R��?/�����}A��ž d��<���\4Zٗ� �eDl-�1[cqA���\�;9sA���\26L'�{Aebz8�d21��Ig��ސ4+���a�i���إ9P`���=η��ơ�7A�h"
��_��D��<;:lAAj|cV1���&���!�b��=���Pӏp%��=v�J�����>���a������9|}�GS�nh���%QT�#=K`��P�s��9�<�e������"�n��z���L���V�}��� �Y�      �   �   x�U�I��0E��a����}�ޘ`�!J��r{���Q�}_R`N���d�ЂL�$K�1�ph�D1'�6�l	w0� eL�d�pl�i~%x vR�j�_�&q��Rqޖ��2�M�ū�j<���*ݨݣ����R���WO����J}n��tX���9�����M��Y�8f_�jnz�V ����nw�H��8�/'=�Ԝ��	�+y�      �   Z  x����N�:���SpD�{��gْ�P"5Mi�}����N���C%T��<^^36lv�ilN��un��|{jǶ>nP�{�E�g��
�������z�'������==�kD-�c�B/_��t������������	�h�E�9_�ƶ?��c}���ݱE-D��i��.�V3�����S�5e)��f�����\���t�0������Ӂ��(��4�*���,5��tu{�U�(A�e�	���<���5�a� �5h�q��18��Ʀc�̹
�.�@V�l���^���v<�AD)�D�x��������c��7�K�]3��sW`$�('��-���JZ�	@e%�ͣ���#�즫�Y�p��c2�i�:ˀ��lQ�ϗ��k����m�10���	kd"�����߅a{A)[�Q��u��>?���$�Y(2�^��p���rElV�L�o4�@;�T<s�L�Zz ��D)���C�i����LsK&�PeZsȾR�|�ک�:+EZ�2kV+k�	���X�1W�3moh�T�nkɈ�ɴ{4 ���H���ҡ52m�g��)�ܤ�<�����X=Ni��+�kØ)�4:%s� o�{-惶�p6�9] ��X�+m����{�9]��&G�M嵁�Iž�j34���i����(i3����f���^�녹���;���~L��q6@�DH�Po�,h�z*yB�G�A��H����>�zxo����i���Z2F��Yy?�$T x|*J������<^_��2��Tq`�%f�nI ��kZV�[�RӒK����L�<Q���l��i��D�k��ݲ:j���V<�ҳS�)6޵��xk�xF�����Ӣ��������"`(�E�QŜ5�g�CG�5�BS	˓O9������ަF��	���慩"�E��T��r2�AvS���4p�ܰ�"W)fIk���By�2	wCsю��h5�9D9 �V4?�����V����Y6�!���>u�'~��7i�nN%�d\o�c�/����g@>�Jɭ֚f��:�T�_�X`֔���.b��H_ay;�א؅\�� �Z	i��n�v�-�ʍΧb�V�4I�l�����z_�      �   �  x���n�F���S�X��E@��Rh��ȢI��Ed����~�49�`2 �%x����_[A>���!)HĢ2�N��Q3W�����:���{'��B]�D�]2۹�l���w�6ss;�o�{�P�E���433h�q*?�Ex/�Ｅ�Ԝ�tL?�FGvfF�:v�9���L�CE�<^s{���;f�~\���|]���)�_���,����O/�no�]�Di��%&�œ8��ʭ��P�y���'d9ϣ�N�v��^��]�������|� 4����[m���'��^�J�W�6%��0m�(h˾�:�;W��\!9	�qĞ��Z;���yγ|���u���g����a/�O�j�[;K�9��[�=��ϊ�s%�'�ޠw~R�����U���g�\������~����G��[���uH̄��0���|�[�]��՟�{���k�qS%�(�ymQp�4k4!�c]�����*���pP��[�o��D_�uy�s��J��5BJw(iK��=��[���D��1T���P��,h�6X�f���z��c����;ؙ+YV��'j�g��/��]�e�Y�u8e���{f��G�����_�W���߂#�㢣��΅{;�"�VN�܇%��MbIx6{ֲ/y�{���
�-A*+8��*q_f�piӅ�
:�'pn�,���c
�`-G뜌�r��r��$d��蜨�{��C��,l�3ŕ�].j[�/hn�f���u���f{j�"��Kf��ڽa�٧�9$V��x0�H�Buu��������W��lT�J��eGY~k_����`�}.U�e�vq�q��a���xH@���qK�"� ��U�@�-�� F�:�+��-p63Vt=������!� �-6�$'���q�p��t�m:a-�����B��G`<B�8}��REk��z�q�1 ���0��H���Q.��N�
I��e�R�-5�Qf�e4�/C�\z2'����������}�vL_���{齋�>���rS��Ϳ�;�W�pi߾��/��5��{���#��u������&��ExI���>w�Mq��RU�T��������uh�6H�ɘάT�&1j���o�� ��(G�n��щ
����u6���xy��q�pj���q�qDn쾰S��d���b���N���⪃LBTS����uL�����G�H�[��3��AR>�l$V�>7�ާ�vbM1Ws^�7v�����Ċ�;6)�ϻ҂wt���'>@��6YY�7v�����|�B$o��(��9��n�A�W�D���8O�`ɍ����rd7@Q�z�	:��*V>�W���ڍ(iC]Ӳb�nA��z��-��
 �s���m�9(26��0�`"� �eq��gv��-��Q4�)+�AME"��@Y�}�!�G���T�I7v+;�|�C���+�:X������? V��      �   '   x�3���ON���/.��0�0@�r��q�b���� ���      �   u	  x�͛[s۶ǟ�O�w����L�.�%Vz��m&3J�,֔(SR��\Hj),@Qu3c;6���� ��/iJ/N������0n�x�ñ:��j?ڬ�A���)��A���������(�L���?��������<\L�g���|u�����_����|�,�؟�g�g���?M�(X�2fװ۫����Ǻ��Ζ�G�Rl��疉2W|��$���ɿ�Q;u�R�S?Q���&\��0
ׯ?��zJ�H�ٙ}�|�������6~㺙^�D��.�v.���z�߀;�7��~�ߙ�
�7�F��(�����mw�?[�Ӗ�峅CV'�hv2;#�!�M�LW�G���e����Q�L�E�B��x�����eU��˔�̘L�d2&G��!�POI�Q����a #2 ���ϵ���E�L�� ���p�G���[��N�D��|YN��wZ�����u�,����ܧ��xb�~2���}]C�l@f��Z霔�1U�̓���M�ٔ�����^s�ǎ�k�ke�V�kQ^'[N%�mUz��G�B�m��VZWy�#��ڲЎz�}����A�N��d����k�����cYp�`�g�J�D�f�nF�Rr��CW�k�/��r�!��$��)k�I'FO�`8x|���k�4��p1�0C�b['��:o´w��n�D8t�����8Y+�F��o�O�D�i��1�PA��]V;�L��~������/:�j��z��Yx���1� �����J?����=�0�����{7��v�uO��u<�q<��{���B/���{miN=5�'�鎭v۽���?"/�O�F_	D�؉<�}q�<��<b��zѾ�����8��8p�r�4�H�<�^D�������C31������v}�a�5�e<b3�xřU�gV�#��~{�O��X �sJe��,�HKpǜņ,Z���ͯz�I�9����t�1�[�����
�ڦRb��@Ջ��C�"!Y�H(DG&*ƨ��.;�s�:�]RR�3��.���F����D����lZ�����w��J)J���i[|�{�$��%�}uߖ�3}�D~��䰸`����2��^����D.����}[HO%o���xg��J\qƃ+1<�ٶ2���:��4$a��Gu��x�n���G��W[GO#}���m��=1M]�ȏ��DA��_1����Y���%�U�������-�Q.�N��!Ҷ�	�]!��R�]꼫\�~�봥qǉU!�Q�ۈ��Q���-��55�85+�]�9-X9�r��B�紩yωك=Gʵ��g�d��{��_��@W>I��oxζ�qb;E���8�r<�sNҶ�	�]!�R�꼩�Ռ�;kj�uj�ХR��}�*���m%�}7'(���,7m�����?Q�թs*�#V��a*ǁ�yZ�t���,�1��4��Q��	���Լ�Q�P<��!��X�жţ�����9u��\�X�	��IV�jFT��T��t�	�6�8���;'rՇw;%ڥ��R��a+;��]�u��-� k�Ϛ�_C�X��[6া]�0�I��n��o���e�R`�s�K� �� n��-�dg���I�,aҧ�kC{�֏�=�>~���w*�������[�6=��ϊ��U�Ҟ��4H�J�ĞG�y���-y;v��
ݠ,�>�cӶƱ��&��=9l�<�m�l�ط��4gt�Q Y#����P�3 *R����I�EQ�*K`0�������ѽ��*�M%�@H�,����,e�� >(:2|jpݮD�]N�FOU��ЉA9t[ϴ��� 
��e�$_ �e�`F�F��~.�rF@V��\�-W d_�Y��w+'���3zI�F>Shc��б�<C������X�I���~XbA���X`o/�j�좢��nm�����e�Χy�p��P�p5e<�]<]o��Ķ�����oo���۫�Ǘg��$�m�2�ι�ȃ`�sS�j1��Q{{���]��)����9���: ���'U{@Ԟ�QrGnFx���d��xdS��55&Q�*
�FEt�(�QK��Y��K�moyګD�w�L[������y��wq���m8�lx8��ry��45I5T^i�B���Pp�L�P��v�G����=�c�>�S*��@�Ⓖ��e�jY�4&�9�wU�R��\�����Yh���+ͶߘJ����h\���'��C��u�U�!�����=`�j�u:�<$��(nk�Xm�X�v�$�8�憙v 퍓3���B�>�&7��^W8�A���B�A�� ��eb\�����,�g��3��dBA9G10����ӽb�8޻0�xT��Qx&{�W,"�|���wa`L�0��Z�������      �     x�m�=o� ���W0�C��?�I+5C�V�%1�9	C��*��q\EU��=�rx�1�8(�w^ۃ`�Ϊ7\@�*h�s�V@��O���w�𝺤��o}�MrL��*�����su	��Q�b��
�>��?kB�k@kѵ��h��db�Q��iL+�:�|�]P�b"��I�D9�1Q�x4.a	eM�%lhw=�F�j��Pѵ�x柝�(w��I1����'�n~�|������SX��)ޞ^��)>��c?�v�      �      x������ � �      �   �  x�}�;r1Dc�aV$@��%t�MxU
�r�����"�K�4z�_�3�}�V˳|�������ߏ�x߿_��kѱ�����=��=�o��A#� ���ss"����C�z-c�~����*N0E�,F���e�?]�z�����.�Ii=�9Y�s2���+{�l��@)b^�Pdu�͂�-��J'���p�D�K�	��[�kވ�d	�͈�eU��,�Dֆ�rk�@%S��N�_5i��ZYs�p�rk�$���z�f��Nĥ�s'Uv&a�D��n����YZ��RR��l�UC��]8�#Ϥ�	�u0E� �:�#lqL &��`YsЦ3�uP�	8��x}�MO˽�^�����``1������L:@�͒�X���\;a�b4���tuԺS��i,2�"r��`#Ha�0G=�b�����K���Q'U���a�9�ah��Yݴ#퀃�s ^WGc�ҁ�9k5�5:T�5��O���6�i>�|H�)�c�q�$�dr9��q�#�6�~U�1�Ʌ^r蜌�`� .9&q�M�D�{r�{r�96X��C�M[d`t	G�آ����k��������Ʋ����;�g�"��~��d��YJl��o@��~�t�^��/shm�����Y��^Ql>��r���bB��0��#�S�#�XJ&t�)6r�q��n���uu      �   3  x�=ѱN�0�9}�>@��ر����喂
W��Jo��q����b�=���q�s�_�K �*f�jB��3b�6Ď����T2�H@&��3$e�4!eW����f8�e���X[�%�
�)�ʆ��yOC ���<�`J�����AE"g�1u�2�����J�jL9R$�C��������N�H���Z���L�DD�t,m[����O���|!�,��6��I����_��V���������ȗG�#�h$����Ul�5ܭ�i��<�WgVc���I��{��v�����]t#      �      x������ � �      �   p   x�3���L��H�K)��V�L�Wp�MJL�(��!Β̒�T.#Μ�̔�<N�"i�Y���Y��^�_��R�X�Z���XP�����QpJ�T�t!�K,�I,FQ����� u�1      �   H   x�3��I�LI���())��ׇ����3SK���s�J���'��WR�_@@E^j�~rFbQ�>W� �Y4d      �   �  x�-T��$1{���2`��e���_�OXH��u��ebK���<�/x^@�Se���:p�< ojM���6@�G $�fh��o(�� ^c�]�}x�j��� ��c�~��\���Tхcn�J�A��P�|'�Q��>
�ǱJ
1�Yg"`�xS�lK��m�������k����9�9o3 }0tv�j�6�؎w�F�-G�9��A�rc��7�q�eͩ��sN�1�m��3ȱ���l�w`��>�6�s��.h;	��4���ll�-G@৩7�kϤN���(��Ϩ�3pl���lX(�>S�%.�q�y�W;k�i���z������6��`NΝ3�s�f�S�Ʃw:G��wQ�8u�R����P����* Oq����>iw���T��"�3(Od2"D����hVq���K6%vg�`���p�����P��C�pN�������ʸ�      �      x������ � �      �      x������ � �      �      x��}ے[Ǒ���+x��{�y�,Z7S���l	3�Ȭ�"�"�4/rH���Ϫ&[�l�0�
�dy_+������;��y&�����}����{/�Q3��R�����,���?���9?����dS��y�Z_Җ����ao2�����<�W�7w�t����m�`���o>�d����K<j|B{���߭�/�n?{����ǻ�O��?{����;�~oۅ>�${��������Q$��)xQ1�!!WJ�W���X��m[��2�XJ%�#����o���v�ɋG7#����O"т��|u�5v��������bN���T��`Z�l�hj�]7K����w�ً2f���'·�as��4Z��z�\=�{f��s�A��e*�P��N�f�b�@�|��5��͙��I���|����a{rUv-Ě���[,��\U�I������k���g��|���E�3�|����}ب"�65���%��_zǗ�d�r:0*�mIKWE,Q��h��Хh�7���Nվ��D��M���&�J01d	���jn�t�d�Gz���ѯ���yR��ǎ��H[�S���{zK����6�,�B9F%%$:=f�� ���ct�r��D����)RuξS���֚J]��S��uc4xc�M�DA���q��k�j��ָ-c�>Ud[�]{m��P�$�fڍ�ѓbt���f&�mZi� �h���kE���[߭Ӆ:.c4ܜ9c1v��Xی�=�kq�%ْk0�I��Sn)[	%��[��bG�"{9�E��V�z�1jO�ѩ�w����'ܣ7b+]m4^S��q�
q��=����t'l�@=bS6�R�ՖZL*�"?����ԥmc��I�;G�(������`��>�bҩ�a҉�GL��{8����LcC���N�I�U��uK�1���2P�aVp��'��|80���v��g ��cJʍ"׀��8Cy�R:U�n3���6팺\sE��1��O���Mߥݕ�IY*"�,��*M�@EQ[�]�f�12ԫ tኯ�G(�]�m��=�*�mf���.���R9�f|�����}�����)����Ã{_}��O}q����.��߁�;�2Z���5i��j�kI+�;Xh����қ�5�iڂ�A��VY]i�x��b`n�֞؂��e���z$��y^��<��b�`�'ͅ�Ե~hs5/�u�8$��dԤ�(<.[-\��R;�!hˌ���<���j#p&)Ⱦ��3�Od��MX�O�,�G_���Eݙ�d�wyye{Z	`�(�2$k�x�`(�ᐲv��c�@  ���A���X�LŸ��=�*�mf�i�l�jK���d�	�ok<*40�=ݥ=ݺ�Z̈��{-U2	HB�j�9�!n+�@R��L��|�|@ǈY֛��'қ��Qg'�~؞V�����AF����'��%{^ɹ7hS�i�^�:�a���&�4�"����k�6g�9�Ā)�8gp�4}��H�v �s��t�u��D��^}�W�Qm���Kۈ¿��я�ުP
�8\��b�R��cA�MriȽff�Q�sE�o��"��j �F*0Kb��]�i��;t�|ձ򺼹K�WΡe�!"�\1O���L�Z�h����@Xi	U��)��Λ�Z�mf�iWZъ�h�N�D���(rpIѾ�+�e�_ٜ &0 �m��6����Ż�t�m��&XT}�Z1����#��YݜS��63Q������wХ�<��T����j���;[��Sx�L��]�Y;�Yo�12�B9�e+�� ���@A	��T���&S�i&�j}���z�5[c#�����Z�-=;j `�%���Е��}��6cl�����,�,�%�m��<�RJ%��tCYݜS��63Q����5�<z�E)I�.%Ri(�B���j���M
����b84yx�faf�y�̂t�-Fo���9G0��)�zDE����8N��3�äQ?lR�6���;$k��t�2�`/��]�ޠ9���Y�Ñj�h�ZA��$��Y��m+��v�pA�=F$2/�]Ɂ]M	�B)��&��I�i�q�Љ�GVY���m����Dck��NE��;����p���7}��e5�{PhHC ��`9�/jk��tع�~K(��@=��4��$0�H����M���,;U�n3�H��
~�̱�Ѱ6��TM��Ϯ�j�����v-k�&���o2�dPK
�}��B�1�4��LP�:�{���%nŔ��3�R��I'��L���L�[V#�y�ސ׫�R��R��/���{1koòLH!�ej��jk%�/��,��Bd��EieT(�	�/q�-��[v���f&�-"b;ƪ�2�1�Pq�`�l&���w>�]�J�kN��Tr���Xb�:
�_aS���}��Zր 	Q���6_P�|���'Zv���f&ꑶs�lz��лؑ�,X���-M#����X�H6�
ɝ×��?xU*�3��lC��ir�GW�4����!��-;U�n3�e�r��Ilk�(�^�]`�y�,�ŝ/o9W�!�*A��Pc/��Z\7ɀ)XVe�X�	v�~���XsA���w�n٩�'���Gr�F��D�"�MI�����:�nòт���uL_���q���L���ٸ`���B�Ġ>��������n�sxb6�)���z��X�	�z���>&R\N$�ƅ�u�e�[�,UWI�	d���2Xh�¿�s�0f�ۦ�1%pWJ��2yI��,~�g=3��63Q���H�BtH�xgW�Z�8Bmo-~�^�����)��nГi��i���7��)����1�#�D$�	B�H���FSVo<M�?֚���kVK��MxW�&���]�%��,nòcv��- ��6*��a��ZE=��ݒ���b�encI�3�b�&����y���w����l�u ��U���N�����e���[�l�ؼ8��
�$�h�I�	������`$��)3��i��P;�U;��W��T�c����ǲq��c^�1���/L�|@=�E�^���bY0�A�Ii|qUe�r�͗Cl����22�U^|WNj�$��5t����l<Q���;.�-+H�)�M� �Ք�����Sj*���6,��6��g+`
�٦Z3g7/X6�-��AgYjk -m�B���>quv���f&�9;3n�c�����T�������^�ފeSb!����I 0�uj�b鵚���ܶ�a�MCEm��A.:X�w���[Ų�i�H1���b�ڋ��<v �~XPNa����?~��,�̏v����Sgj96¡S�֑�P� >�J�^����U��04��2G�(�x~�2}�u��ǯ�����Q_��dul/%�RP4��L����M����i�7��
%�H
`+rM��B�(�<��n�\\w@���]Cݔ�^�Ĩ;^�{u��-{�J��(t�}�b�x��s�S3�p.'��=)B��q���>9IuL��\lxl����\*KR��۱�&r�IU�%�)���߾���ona��ԓF�����3��q�=x��r�H�Y즀:�֥ՕW�T��$娳�-�Vl�\7�r��Q?	�ƭg���Ɍ���io��UZ�D.�uZ^ΙWLj0�xE�u%����g�^W�������g�3?�mf"���,{�;\�e�}�W���K�����Ws�8r�s�2�V -�CB2�_	��p�m�&�d��A�K��,�>�تuݖ����:rSolc:li���R4 =�é��D�������B;t�G��L��ԙe��]�Vc�\%|��I�@)Y�|��Ma�t�bǞ�N�٨�cWlK �k��s\I��kn��"v�Rw�ק]�ؿ:�g�w��??vV�����7U�=y�d)n鼑���$�m��q���shc��ؙ�$�8�#d}�Kfa"������r�do��żc0 0��	-:@N([&J��7���S-꧓6�.(�V@\b��A7K��������� �Q ����^A�����Ul��N���`,Fc���Ũ�� ��� �  R�߭�����0P��NB�tù��0CE,�O���H���Z��`���h���5�]\���|q�^P�:�֚�8�z�@�æѥxQ�1�.�Gw��.�fW��|�.�OӧF llU��X��18��[���x�x�LG��L��5����/��������[�wV^33����~9{��5E�E�5����W�}�������^3R�g?�����zMQ�W�
����� |D�W���\��ˌ�n=c:��S$��Uj�,��R-
��I!)Ϙ����-x�b}^�n^����EV���4�������!��ǿ�����G��b����D��ԙe�4��;�2`	����sc�Z\�\��u��m 1�*��TJkܵ(���nc���ї֫�2��*�#ջ7�q������%uI���C	(VՌ�i�(C�T�4��i>���\�	6�'`ډ�.���ۊ�����QB B�Y����tW���x���>�����i�[�4~�B�X�����%���0
Pc(�#R8������(����r��c(��qhg��ʌ��ͧ��! ;M��}��7_�/Ww�7��'VO����<�Vo��1�X������+����v�Qr��1�����"�%R4@ׇ�ضn�83��q���j�X�B@�D�z
��<�w�$���q��X�/%�[�4�p8ax����}��J���\�̛v���.�y��#ۉ"�?@�2�^�םTP�����nםb6Q����`E�����<R[�Hm)C�Y�?�8��`�%i�WZ8y�L�m�ƭcOgo�C����t��_������MOt�7�63�/f�&�=v�)"܀���jv1� ��u��Lm�+��ugX��+=i�6PLv��4v�r] ���籋�_�(ow=J�H�Zx�	�{�/�:�BjB�E
Kt�D��	����~[�<{��	53o�mfV��w���;7���; �����sH!Ņ#ԯt7nםk��@U�Jwΰk��#?�C_Ё:1��H����-�W�D��erP�:��/{@���Q�$�ss5e)	LJ]��x���{�㣕Dyϝgބ�<��x�L-G�����ǁ֔�w��B�Ǥf;_�m�2v����ژ��Pvu.�x�f��O
i�0� Ռ�|����"��Γ]���qLH�����1�r��h�5E��{��Y�i`�Gg޴��D�X<���s�Er!tl _P�h��c�����'����Ry�����9)�m/�ߞqtV�k��E���]��.U2��e�3�9Tcc� (v8͡ql!T������&ZT��ȷ���Mޅqj#wf��f&�E�G�\��jM�1*�w�c���k���0�4����bBkcO��	to��g�w8"����:�� ����Z���+�Զ�$im	9V��W[�\�Ō=׫{��8�&��`B���:T��0O/x�LGx���*Nţ�2$(�l�A�2ɸ�ql:��؜ZюsaL�~�:ڼ�����/g\�����R,��&a,�sc	E��{a�;Gx���s~����~�Nαc#����wM���ǦT�B�n��];��f���x��K�f.�Y
����,���DO��h�H���M�d,'��ǎ@F,5��dT8pVx��ViR]p����g=����#�T���Ԁ�c�d��m��T=�6f�1��&�g;��+E�����N3�~{\��TMHK�c�Yݏ��K�a\�`Ƣ�#띔����̌�QRci�F��R_~�~k*"'��,4Y��($A���!v*�M�1j�to\y{�y7�A%�e�u�נּ��e���:�ڍ$���hN{Gۘ�GQ*Aր� �����R�)K�XblH��b������!�G�v\QdJn�J�=�`J���py��[S1�ڀ?��쐙%�<��e�!�o�f����8��u���<X�i��q���g�8���Ǫ��\Q�z�7�īd�C������y���;����@�:��S�H��;�iӶp�]1��1&������$�,lE��+h���m�kp�>v!�q��8~?W{�ؕ��wL�q�8�:N���$�iBme	P�ژ^�o^��G��$i�e�.Daŋf@^/���Ő<��8?"uԖ#�F��B�7���Գf�����=;��w<.8��\tg�82sob��������@��-����B����D��jK�(x�8>�ؤ���TBM)��Xl������T���7�>����Қ=�=��FY�����v��<n�(��$@O*��wfs�ԙ:�Y1δ�j���"H_����򁸗.���_�|�.�@:��p�20�CW����:M��);;N�	��)a\�6���Z+��x�0���v���h�%M%��R�=Dld�.����q$�X8#��&^\#�X�]���l��|�"_@�_�#~�Qr�t�C�\D���0Y�RW�׭c��}�&���9������b(�>��Zg���z��8��Q%� ��r�������q�=�ZI��8��x���\��J5��w�xS�}���F،;��bB��z��/\h��FO�����V�Kk*
@����ֿjj��f&�x�ǅ�8fm�WF�	�QPQ���c�m R٩�q>&D�j"|���_y��G��pZ }�1�%�����??�㺳����5g8�~�{P���(���̒�J-VCV# ��A�D�aԞ6ǰ�yE��nF����
#	5��g�]�-|�O/>����Z)3�v��	�sgSIG��4��9��������G>�z��l���o�}�p�-U���5��������k�2�^��n�����nП���١ۿ��-ׯ���Q�6�5;J��(�?�]u{ˬp�������K��w�.�=N[����/�ï(���&�lr��g���~[�0�Կ&����_^���Y5�����؆Ocr�FD� ���a$1�~���}���7pKm����k��e���Uaao#�Z�1YI�7�Z@R1�ۀ�lK���8�
=�b$�1��Ly�������G�V]d�i�~�x�z�B}̷�ѼH|(�/[�QG��� `���R����K��t�_���pU��c�g\@��C����-�I^Q%3Fp�l.����6�>�T����'�����L����q�e�k�,A�"isq\)l�P��be�%߳~�n3��]:IGֹ�
b@~�9"�4�#0�4c��g={���>�?��G��6��8S�f���[��}�D��ƭ��v�YνXK=QǑ��AkB&3Lc���LN��:���%���/:9���Q���s���8hO����%�`���Ӳ����g��P/d+�&�8�R,����V�˸�t�V�i����"��?�|��0}|�a��cI9#��P���7��C~|Z�\���:�����bg�Dp�����?����iM�      �   ]   x�3���+K�+�/�Dbr��qq�'���g�s���{�* ��r��'��f��s�( x`%&s
KsJ*���=1z\\\ T*,�      �   J   x�3�tI,ILJ,N��())�����ON���/.��0�0з�M,��/(��JM.�O�*�+L��4�3�3������ P�       �     x��\mo�8�����r���s��ܺE�d�Kr[,�@�������������&���W@kӑf4g8Ό���>|�S���*Y�����0Y�/����6�7pYm�]����%����i���%���_V����\fծY6��f��x����_vMxO.�j�m���~�_�W�O�T�z�~�ޓ˴j���ʟ�/�=���n�^~_.V��	��[.����޻m�$�\J���:۬�N�x�ܦ�O�fu��6��j��}�n�2��A�wVi��X��{������	��BJ�	�5�OD��Q͛�n���@(˂J=*�a�"±�ڴ�gۇF�� ��g�d�C:D[���'+H��K0:�Z]>�v��F�۷�R�j�E��K�#��JN4h_j���|�:U���B��W>�l�3�4E4%kΙ�bBj����k�%Ȅ�IЎ��	��=U�����.�I����2�fv�i4ߪF������UcH���@@���V��ׅ{�U\Q�8C���#D5?VsØ��m�AmA���QTV�Ӊ�%0PdBI��5>�	���X69����rPIXSS.�,M��h�j��sb��Ě��F1����hϡ�*��<������I�O�ǿf�<c�=��4qbٶ̜~Dl��{p.X�����A[��'n�C���m0���R������U��V;0; N�ڸ����|���	�b�ٲ���9z}��Ԅ֔prBx-�L)f�� �z��7?�{�\�ϖ����g=��ߟf����ڱ�GG5z���6��:��^������W7g�M�o>~��\�{�ή��������C��l����v�y\ܟ]^�>�>��;{������|�4{h�mVg7��_N��R�n.��Xk�wn?���_\�L5v���F�D�+ K�c!������%�&��jg�t���J(EO���W�
^��� �r����p���x��Ģ��\l7���u��a��Iu�f�����cRL%:%d'[MGQ$D�#�u'k	e���qou�Zr�M �L)�� �;3��ة�z2���6.����������!Ze���-�>�!䔻���h���qrT���E�ȑ��#�6`A`�+	%�`��S.d+^	�$X1뙳�����	�	��Y��eS�7���k�7gV��/���#x�m�{̥0h�>������R9#�s,m�	�.#�X�5GٰLH�L^�#�H?Vxd��;?hZ.��ʉ֥��4��둦d�:�D�X�����#1.o��H��e#�C���̣e���,Z	����U�����'q��{%^���-���:1�A�$O��!c}�3�4�G��s�gz:����G��Å�v-0�熊*
>8����4N&څ�>�T.�h�KG����3�� ,vܳ�b:gG�N|��<,J�_�9䉑ྣ�d"��q�o����b��d�,����7��~���Mq�M�>{"����xy�zG�%��5r�#v�� S�IH��Lb:�c�$>��d��nG�ĳ��L&2��2�T/���̻ͻ3	>��ڤ�%#0�R��A]����p_�p�$� �Ix�Дɀ��2�ّ�R&9?ZV�d ��82�Ȥ*�aOD=�D��^=��z�d!%�R�-EY2��	[�"�+�Q2�1�#�|-;���#Sa��2o��g�/��c`&qd$l�H^f �=�d2��Cou�H'�?���#�{K,��'��l������Ti!�0D�g[9�������C�~`[9�`�+�82~`"9�&����i;�H��A�'�\*@�LnA��Cҹ�}���GJ�F��#½�%�%K�����z%
�JG b`v�t4����=���`�L*���1R���H�L&d~�c&��l��$�}2�����<&":����(uP�Ꞔ��ӛ�ك�A;T~ͧ���<�Z�ߡd2�t�qʞ�f�&Z�*��a=��Vu�s 2^��:��PQ���)"]i��;��cg2�h�V�1s���'�ۄǇKޣ����w���r�8�7w��Ͷ����F����j��BϞ*�W8��-R1;Le����H��� �Ua�AO.�$|K��7Դ�4��X�M/��WR��l��ۮg�]<���IW�OW����q�~j�_�px���֟�����q���t.������3ӌ�M�\d��}$�a��'�V��$��U;J8qI�L�
{�H۝�d%��й�[�q+]��$�)b'[�ñ�Hqw��.�"�Q��V�"mO�Wɑm%�
�@J�j�i���'v�e����V��6�&�N�"��`�v����E`�窤���[·�Z���=��~3<��)�v��MÁ�E���G�e�Q�@�~^QMo.�C�]oA��ݳ�[�������� �};QK�(�'��T�"& ��Ӌ��ixw�@K31���/F�'��%)�OTW�~�xs�_�_��S�����y�v.�yL��fpB艰E�3�׮ }���� �ږF�I�X	�lpi���]B�g��~m��^ž��SpF�"��GzaƗ{r�U��A�:2䝤E���έ��RM����x'i��}r��=�/*t������x��n�lG�����i�WI7�� �h�m�N�"��`���`�R1�H�l n��U:I�@�݇��JY�����$-6��IX����r����6��5�)��j�\�Ίn�0�N~ �O�*$�͘q������2WD+�$%�_�U���'^4\�8�;4az���)�qnSINZ���kV���]x+f/_�N��p~�n��IS��1!�C�rc)��g�O	��=��DJ������#M[��Ob�1!��Aє0����ք�QrK�e��a|�����]�B�~L8&�Q��u�R0ĥY[�)�vm1.�]Z�@��D�E�Yu�v�Nؖ��BP78=���E E�5O�{x`��S�};= ��"mI�um�n��Ѧ/�3n�r��I!�_`T��>�V����߼y�@��      �   �   x�3�
���())���O�,�KLNL�LLI,I�K��շs
����5�3�3P�M,��/(��JM.�/��LNM�/.*��+L/�+�2��+$����M/�a<6a���t7q��3'?91'#������� ͐�r�T��*��=... g Jd     