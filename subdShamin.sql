PGDMP     6    *                |            subd    15.5    15.5 2    $           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            %           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            &           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            '           1262    24866    subd    DATABASE     x   CREATE DATABASE subd WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Russian_Russia.1251';
    DROP DATABASE subd;
                postgres    false                        2615    24867    lb    SCHEMA        CREATE SCHEMA lb;
    DROP SCHEMA lb;
                postgres    false            (           0    0 	   SCHEMA lb    ACL        GRANT USAGE ON SCHEMA lb TO read_only_role;
GRANT USAGE ON SCHEMA lb TO insert_only_role;
GRANT USAGE ON SCHEMA lb TO update_only_role;
GRANT USAGE ON SCHEMA lb TO delete_only_role;
GRANT USAGE ON SCHEMA lb TO _mama;
GRANT USAGE ON SCHEMA lb TO manager;
GRANT USAGE ON SCHEMA lb TO papa;
                   postgres    false    6            �            1259    24872    worker    TABLE     �   CREATE TABLE lb.worker (
    id integer NOT NULL,
    date_recruitment date NOT NULL,
    gender character varying(1) NOT NULL,
    surname text NOT NULL,
    name text NOT NULL,
    birthdate date
);
    DROP TABLE lb.worker;
       lb         heap    postgres    false    6            )           0    0    TABLE worker    COMMENT     �   COMMENT ON TABLE lb.worker IS 'ТАБЛИЦА: Работник
id
Дата приема на работу
Пол сотрудника
Фамилия
Имя
Дата рождения';
          lb          postgres    false    215            *           0    0    TABLE worker    ACL     %  GRANT SELECT ON TABLE lb.worker TO read_only_role;
GRANT UPDATE ON TABLE lb.worker TO update_only_role;
GRANT INSERT ON TABLE lb.worker TO insert_only_role;
GRANT DELETE ON TABLE lb.worker TO delete_only_role;
GRANT SELECT ON TABLE lb.worker TO _mama;
GRANT SELECT ON TABLE lb.worker TO papa;
          lb          postgres    false    215            �            1259    24881    cardw_id_pn_seq    SEQUENCE     �   CREATE SEQUENCE lb.cardw_id_pn_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE lb.cardw_id_pn_seq;
       lb          postgres    false    6    215            +           0    0    cardw_id_pn_seq    SEQUENCE OWNED BY     9   ALTER SEQUENCE lb.cardw_id_pn_seq OWNED BY lb.worker.id;
          lb          postgres    false    216            �            1259    24886 
   department    TABLE     P   CREATE TABLE lb.department (
    id integer NOT NULL,
    name text NOT NULL
);
    DROP TABLE lb.department;
       lb         heap    postgres    false    6            ,           0    0    TABLE department    COMMENT     T   COMMENT ON TABLE lb.department IS 'ТАБЛИЦА: Отдел
id
Название';
          lb          postgres    false    217            -           0    0    TABLE department    ACL     =  GRANT SELECT ON TABLE lb.department TO read_only_role;
GRANT UPDATE ON TABLE lb.department TO update_only_role;
GRANT INSERT ON TABLE lb.department TO insert_only_role;
GRANT DELETE ON TABLE lb.department TO delete_only_role;
GRANT SELECT ON TABLE lb.department TO _mama;
GRANT INSERT ON TABLE lb.department TO papa;
          lb          postgres    false    217            �            1259    24891    department_id_seq    SEQUENCE     �   CREATE SEQUENCE lb.department_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE lb.department_id_seq;
       lb          postgres    false    217    6            .           0    0    department_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE lb.department_id_seq OWNED BY lb.department.id;
          lb          postgres    false    218            �            1259    24892    post    TABLE     n   CREATE TABLE lb.post (
    id integer NOT NULL,
    name text NOT NULL,
    fk_department integer NOT NULL
);
    DROP TABLE lb.post;
       lb         heap    postgres    false    6            /           0    0 
   TABLE post    COMMENT     u   COMMENT ON TABLE lb.post IS 'ТАБЛИЦА: Должность
id
Название
вн. ключ к отделу';
          lb          postgres    false    219            0           0    0 
   TABLE post    ACL     �   GRANT SELECT ON TABLE lb.post TO read_only_role;
GRANT UPDATE ON TABLE lb.post TO update_only_role;
GRANT INSERT ON TABLE lb.post TO insert_only_role;
GRANT DELETE ON TABLE lb.post TO delete_only_role;
GRANT UPDATE ON TABLE lb.post TO papa;
          lb          postgres    false    219            �            1259    24969    post_fk_department_seq    SEQUENCE     �   CREATE SEQUENCE lb.post_fk_department_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE lb.post_fk_department_seq;
       lb          postgres    false    6    219            1           0    0    post_fk_department_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE lb.post_fk_department_seq OWNED BY lb.post.fk_department;
          lb          postgres    false    224            �            1259    24906    postw_id_seq    SEQUENCE     �   CREATE SEQUENCE lb.postw_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
    DROP SEQUENCE lb.postw_id_seq;
       lb          postgres    false    219    6            2           0    0    postw_id_seq    SEQUENCE OWNED BY     4   ALTER SEQUENCE lb.postw_id_seq OWNED BY lb.post.id;
          lb          postgres    false    220            �            1259    24954    worker_post    TABLE     u   CREATE TABLE lb.worker_post (
    id integer NOT NULL,
    fk_worker bigint NOT NULL,
    fk_post bigint NOT NULL
);
    DROP TABLE lb.worker_post;
       lb         heap    postgres    false    6            3           0    0    TABLE worker_post    COMMENT     �   COMMENT ON TABLE lb.worker_post IS 'ТАБЛИЦА: Работник_должность
id
вн.ключ к работнику
вн.ключ к должности';
          lb          postgres    false    222            �            1259    24957    worker_post_id_seq    SEQUENCE     �   CREATE SEQUENCE lb.worker_post_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE lb.worker_post_id_seq;
       lb          postgres    false    222    6            4           0    0    worker_post_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE lb.worker_post_id_seq OWNED BY lb.worker_post.id;
          lb          postgres    false    223            �            1259    24911 	   cardw_new    VIEW     |   CREATE VIEW public.cardw_new AS
 SELECT worker.id AS id_pn,
    worker.gender,
    worker.surname AS fio
   FROM lb.worker;
    DROP VIEW public.cardw_new;
       public          postgres    false    215    215    215            5           0    0    TABLE cardw_new    ACL     1   GRANT SELECT ON TABLE public.cardw_new TO _mama;
          public          postgres    false    221            {           2604    24916    department id    DEFAULT     f   ALTER TABLE ONLY lb.department ALTER COLUMN id SET DEFAULT nextval('lb.department_id_seq'::regclass);
 8   ALTER TABLE lb.department ALTER COLUMN id DROP DEFAULT;
       lb          postgres    false    218    217            |           2604    24917    post id    DEFAULT     [   ALTER TABLE ONLY lb.post ALTER COLUMN id SET DEFAULT nextval('lb.postw_id_seq'::regclass);
 2   ALTER TABLE lb.post ALTER COLUMN id DROP DEFAULT;
       lb          postgres    false    220    219            }           2604    24970    post fk_department    DEFAULT     p   ALTER TABLE ONLY lb.post ALTER COLUMN fk_department SET DEFAULT nextval('lb.post_fk_department_seq'::regclass);
 =   ALTER TABLE lb.post ALTER COLUMN fk_department DROP DEFAULT;
       lb          postgres    false    224    219            z           2604    24915 	   worker id    DEFAULT     `   ALTER TABLE ONLY lb.worker ALTER COLUMN id SET DEFAULT nextval('lb.cardw_id_pn_seq'::regclass);
 4   ALTER TABLE lb.worker ALTER COLUMN id DROP DEFAULT;
       lb          postgres    false    216    215            ~           2604    24958    worker_post id    DEFAULT     h   ALTER TABLE ONLY lb.worker_post ALTER COLUMN id SET DEFAULT nextval('lb.worker_post_id_seq'::regclass);
 9   ALTER TABLE lb.worker_post ALTER COLUMN id DROP DEFAULT;
       lb          postgres    false    223    222                      0    24886 
   department 
   TABLE DATA                 lb          postgres    false    217   �3                 0    24892    post 
   TABLE DATA                 lb          postgres    false    219   ,5                 0    24872    worker 
   TABLE DATA                 lb          postgres    false    215   7                 0    24954    worker_post 
   TABLE DATA                 lb          postgres    false    222   �8       6           0    0    cardw_id_pn_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('lb.cardw_id_pn_seq', 31, true);
          lb          postgres    false    216            7           0    0    department_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('lb.department_id_seq', 12, true);
          lb          postgres    false    218            8           0    0    post_fk_department_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('lb.post_fk_department_seq', 20, true);
          lb          postgres    false    224            9           0    0    postw_id_seq    SEQUENCE SET     7   SELECT pg_catalog.setval('lb.postw_id_seq', 33, true);
          lb          postgres    false    220            :           0    0    worker_post_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('lb.worker_post_id_seq', 16, true);
          lb          postgres    false    223            �           2606    24922    worker cardw_pkey 
   CONSTRAINT     K   ALTER TABLE ONLY lb.worker
    ADD CONSTRAINT cardw_pkey PRIMARY KEY (id);
 7   ALTER TABLE ONLY lb.worker DROP CONSTRAINT cardw_pkey;
       lb            postgres    false    215            �           2606    24924    department department_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY lb.department
    ADD CONSTRAINT department_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY lb.department DROP CONSTRAINT department_pkey;
       lb            postgres    false    217            �           2606    24926    post postw_pkey 
   CONSTRAINT     I   ALTER TABLE ONLY lb.post
    ADD CONSTRAINT postw_pkey PRIMARY KEY (id);
 5   ALTER TABLE ONLY lb.post DROP CONSTRAINT postw_pkey;
       lb            postgres    false    219            �           2606    24963    worker_post worker_post_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY lb.worker_post
    ADD CONSTRAINT worker_post_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY lb.worker_post DROP CONSTRAINT worker_post_pkey;
       lb            postgres    false    222            �           2606    24977    post fk_department    FK CONSTRAINT     ~   ALTER TABLE ONLY lb.post
    ADD CONSTRAINT fk_department FOREIGN KEY (fk_department) REFERENCES lb.department(id) NOT VALID;
 8   ALTER TABLE ONLY lb.post DROP CONSTRAINT fk_department;
       lb          postgres    false    3202    217    219            �           2606    24987    worker_post fk_post    FK CONSTRAINT     s   ALTER TABLE ONLY lb.worker_post
    ADD CONSTRAINT fk_post FOREIGN KEY (fk_post) REFERENCES lb.post(id) NOT VALID;
 9   ALTER TABLE ONLY lb.worker_post DROP CONSTRAINT fk_post;
       lb          postgres    false    219    222    3204            �           2606    24982    worker_post fk_worker    FK CONSTRAINT     y   ALTER TABLE ONLY lb.worker_post
    ADD CONSTRAINT fk_worker FOREIGN KEY (fk_worker) REFERENCES lb.worker(id) NOT VALID;
 ;   ALTER TABLE ONLY lb.worker_post DROP CONSTRAINT fk_worker;
       lb          postgres    false    215    222    3200               6  x����J�@��y�����q%��@��M�+v�"�0-"��|��$ƦM^��yn$��ŸI ��{�\��ݓ��|�<_�ޜݎ���#:���}ZZ_�?�	O�pnǜ�;��Sk�|M_�T'���+}��?�m��pd9��Ȇ�3�9�/��s�$٬$@�@��d8�v:ѷ��&Y����b��?��Z�d��y~������ip�l@�a�1��������R�m�(�ꯎ���K�b���҃��\kdTV��h u���)�	���]m�+�t�"6�G���hY6��V���/�;��         �  x��UKJ�P�wo���6��őh�@I�V�XP�ؔ����QQq�[��-ܷ#Ͻ���tp4�8�{�y���J�n<����������Vݭ���򢙣�ؐz��&x�YS�Ð�N#�:s�&�`߬�f�[�����A}��V3�,�s\P�0lÆ��ܞ�Q������!�\%\�Kg���`�J�{�2�N��>[7��ѩG� d�TP2�ә��LE��Kg�Og*)���t0y�p��w~��6�a#�͊��I�����de%��J�ڨ�9�z�ML��K�Z�n9ҭ˿x�J9.�=��)+�|�qh���;�!H�xl�u��U_@G����C�=�}����B;))�5�_"��;��v҇�+�����������ށ=NiW����1!Ezn.�x��R:s���5���Ũ�C\)������}+��&�`�(��َ3�O�K         �  x����J�@��}��U����6��V�l�W
B7n�����.�t']�ڔ��}�;o��L�N[�"���L�{�=ǭU�}⸾G���ur{V�����G$�)+�h�R+ʽ'�`*��]V?���G\1���e�C⹤�U��s���帗�9g7�T\f�G2fr�������&XM!��-���>Qlk`\c!m�+J4�D���Vd<af'ْ��Uw`��I���x�5n!;��LyS�'j�S�]�nck����{9n���:��̙���J��`��sJnt�%�w�j�oT�d�B��	�e�*�$lى��[O ��[�h�}6����(�yd�ä�9깋]Xv�Bo��l��<�0ٶ~5����{-5tb�߁����W��         �   x��ѱ
�@�>_1��!�EM��Ĩa�i+V
�(����-�}���cB���>�p��g�z�iOM�Iᐓ�/���:�u�6�c:ޯ��_)E�;�ʤT�C�4)$E���ƌ�Hl7�WB�mL��طY�)m�6�Fdd�]�鿙,����X     