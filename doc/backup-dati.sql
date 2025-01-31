PGDMP                       }            postgres    16.4    16.4 5    %           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            &           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            '           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            (           1262    5    postgres    DATABASE     {   CREATE DATABASE postgres WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Italian_Italy.1252';
    DROP DATABASE postgres;
                postgres    false            )           0    0    DATABASE postgres    COMMENT     N   COMMENT ON DATABASE postgres IS 'default administrative connection database';
                   postgres    false    4904                        3079    16384 	   adminpack 	   EXTENSION     A   CREATE EXTENSION IF NOT EXISTS adminpack WITH SCHEMA pg_catalog;
    DROP EXTENSION adminpack;
                   false            *           0    0    EXTENSION adminpack    COMMENT     M   COMMENT ON EXTENSION adminpack IS 'administrative functions for PostgreSQL';
                        false    2            �            1259    41185    areecontrollate    TABLE        CREATE TABLE public.areecontrollate (
    id integer NOT NULL,
    centro_id integer NOT NULL,
    area_id integer NOT NULL
);
 #   DROP TABLE public.areecontrollate;
       public         heap    postgres    false            �            1259    41184    areecontrollate_id_seq    SEQUENCE     �   CREATE SEQUENCE public.areecontrollate_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.areecontrollate_id_seq;
       public          postgres    false    225            +           0    0    areecontrollate_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.areecontrollate_id_seq OWNED BY public.areecontrollate.id;
          public          postgres    false    224            �            1259    24758    areeinteresse    TABLE     �   CREATE TABLE public.areeinteresse (
    id integer NOT NULL,
    latitudine double precision NOT NULL,
    longitudine double precision NOT NULL,
    denominazione_ufficiale character varying(100) NOT NULL,
    stato character varying(100) NOT NULL
);
 !   DROP TABLE public.areeinteresse;
       public         heap    postgres    false            �            1259    16655    centrimonitoraggio    TABLE     5  CREATE TABLE public.centrimonitoraggio (
    id integer NOT NULL,
    nome character varying NOT NULL,
    indirizzo character varying NOT NULL,
    cap character varying NOT NULL,
    numero_civico character varying NOT NULL,
    provincia character varying NOT NULL,
    stato character varying NOT NULL
);
 &   DROP TABLE public.centrimonitoraggio;
       public         heap    postgres    false            �            1259    16654    centrimonitoraggio_id_seq    SEQUENCE     �   CREATE SEQUENCE public.centrimonitoraggio_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.centrimonitoraggio_id_seq;
       public          postgres    false    219            ,           0    0    centrimonitoraggio_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.centrimonitoraggio_id_seq OWNED BY public.centrimonitoraggio.id;
          public          postgres    false    218            �            1259    24757    coordinatemonitoraggio_id_seq    SEQUENCE     �   CREATE SEQUENCE public.coordinatemonitoraggio_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.coordinatemonitoraggio_id_seq;
       public          postgres    false    221            -           0    0    coordinatemonitoraggio_id_seq    SEQUENCE OWNED BY     V   ALTER SEQUENCE public.coordinatemonitoraggio_id_seq OWNED BY public.areeinteresse.id;
          public          postgres    false    220            �            1259    16642    operatoriregistrati    TABLE     w  CREATE TABLE public.operatoriregistrati (
    id integer NOT NULL,
    nome character varying(100) NOT NULL,
    cognome character varying(100) NOT NULL,
    codice_fiscale character varying(16) NOT NULL,
    email character varying(100) NOT NULL,
    userid character varying(50) NOT NULL,
    password character varying(100) NOT NULL,
    centro_monitoraggio_id integer
);
 '   DROP TABLE public.operatoriregistrati;
       public         heap    postgres    false            �            1259    16641    operatoriregistrati_id_seq    SEQUENCE     �   CREATE SEQUENCE public.operatoriregistrati_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.operatoriregistrati_id_seq;
       public          postgres    false    217            .           0    0    operatoriregistrati_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.operatoriregistrati_id_seq OWNED BY public.operatoriregistrati.id;
          public          postgres    false    216            �            1259    24796    parametriclimatici    TABLE     �  CREATE TABLE public.parametriclimatici (
    id integer NOT NULL,
    centro_monitoraggio_id integer NOT NULL,
    coordinate_monitoraggio_id integer NOT NULL,
    operatore_id integer NOT NULL,
    data_rilevazione date NOT NULL,
    velocita_vento double precision NOT NULL,
    score_vento integer NOT NULL,
    nota_vento text,
    umidita double precision NOT NULL,
    score_umidita integer NOT NULL,
    nota_umidita text,
    pressione double precision NOT NULL,
    score_pressione integer NOT NULL,
    nota_pressione text,
    temperatura double precision NOT NULL,
    score_temperatura integer NOT NULL,
    nota_temperatura text,
    precipitazioni double precision NOT NULL,
    score_precipitazioni integer NOT NULL,
    nota_precipitazioni text,
    altitudine_ghiacciai double precision NOT NULL,
    score_altitudine_ghiacciai integer NOT NULL,
    nota_altitudine_ghiacciai text,
    massa_ghiacciai double precision NOT NULL,
    score_massa_ghiacciai integer NOT NULL,
    nota_massa_ghiacciai text,
    CONSTRAINT chk_score_altitudine_ghiacciai CHECK (((score_altitudine_ghiacciai >= 1) AND (score_altitudine_ghiacciai <= 5))),
    CONSTRAINT chk_score_massa_ghiacciai CHECK (((score_massa_ghiacciai >= 1) AND (score_massa_ghiacciai <= 5))),
    CONSTRAINT chk_score_precipitazioni CHECK (((score_precipitazioni >= 1) AND (score_precipitazioni <= 5))),
    CONSTRAINT chk_score_pressione CHECK (((score_pressione >= 1) AND (score_pressione <= 5))),
    CONSTRAINT chk_score_temperatura CHECK (((score_temperatura >= 1) AND (score_temperatura <= 5))),
    CONSTRAINT chk_score_umidita CHECK (((score_umidita >= 1) AND (score_umidita <= 5)))
);
 &   DROP TABLE public.parametriclimatici;
       public         heap    postgres    false            �            1259    24795    parametriclimatici_id_seq    SEQUENCE     �   CREATE SEQUENCE public.parametriclimatici_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.parametriclimatici_id_seq;
       public          postgres    false    223            /           0    0    parametriclimatici_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.parametriclimatici_id_seq OWNED BY public.parametriclimatici.id;
          public          postgres    false    222            i           2604    41188    areecontrollate id    DEFAULT     x   ALTER TABLE ONLY public.areecontrollate ALTER COLUMN id SET DEFAULT nextval('public.areecontrollate_id_seq'::regclass);
 A   ALTER TABLE public.areecontrollate ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    225    224    225            g           2604    24761    areeinteresse id    DEFAULT     }   ALTER TABLE ONLY public.areeinteresse ALTER COLUMN id SET DEFAULT nextval('public.coordinatemonitoraggio_id_seq'::regclass);
 ?   ALTER TABLE public.areeinteresse ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    221    220    221            f           2604    16658    centrimonitoraggio id    DEFAULT     ~   ALTER TABLE ONLY public.centrimonitoraggio ALTER COLUMN id SET DEFAULT nextval('public.centrimonitoraggio_id_seq'::regclass);
 D   ALTER TABLE public.centrimonitoraggio ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    218    219    219            e           2604    16645    operatoriregistrati id    DEFAULT     �   ALTER TABLE ONLY public.operatoriregistrati ALTER COLUMN id SET DEFAULT nextval('public.operatoriregistrati_id_seq'::regclass);
 E   ALTER TABLE public.operatoriregistrati ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    216    217    217            h           2604    24799    parametriclimatici id    DEFAULT     ~   ALTER TABLE ONLY public.parametriclimatici ALTER COLUMN id SET DEFAULT nextval('public.parametriclimatici_id_seq'::regclass);
 D   ALTER TABLE public.parametriclimatici ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    223    222    223            "          0    41185    areecontrollate 
   TABLE DATA           A   COPY public.areecontrollate (id, centro_id, area_id) FROM stdin;
    public          postgres    false    225   �J                 0    24758    areeinteresse 
   TABLE DATA           d   COPY public.areeinteresse (id, latitudine, longitudine, denominazione_ufficiale, stato) FROM stdin;
    public          postgres    false    221   �K                 0    16655    centrimonitoraggio 
   TABLE DATA           g   COPY public.centrimonitoraggio (id, nome, indirizzo, cap, numero_civico, provincia, stato) FROM stdin;
    public          postgres    false    219   ?b                 0    16642    operatoriregistrati 
   TABLE DATA           �   COPY public.operatoriregistrati (id, nome, cognome, codice_fiscale, email, userid, password, centro_monitoraggio_id) FROM stdin;
    public          postgres    false    217   rd                  0    24796    parametriclimatici 
   TABLE DATA           �  COPY public.parametriclimatici (id, centro_monitoraggio_id, coordinate_monitoraggio_id, operatore_id, data_rilevazione, velocita_vento, score_vento, nota_vento, umidita, score_umidita, nota_umidita, pressione, score_pressione, nota_pressione, temperatura, score_temperatura, nota_temperatura, precipitazioni, score_precipitazioni, nota_precipitazioni, altitudine_ghiacciai, score_altitudine_ghiacciai, nota_altitudine_ghiacciai, massa_ghiacciai, score_massa_ghiacciai, nota_massa_ghiacciai) FROM stdin;
    public          postgres    false    223   h       0           0    0    areecontrollate_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.areecontrollate_id_seq', 72, true);
          public          postgres    false    224            1           0    0    centrimonitoraggio_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.centrimonitoraggio_id_seq', 26, true);
          public          postgres    false    218            2           0    0    coordinatemonitoraggio_id_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.coordinatemonitoraggio_id_seq', 363, true);
          public          postgres    false    220            3           0    0    operatoriregistrati_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.operatoriregistrati_id_seq', 36, true);
          public          postgres    false    216            4           0    0    parametriclimatici_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.parametriclimatici_id_seq', 49, true);
          public          postgres    false    222            �           2606    41190 $   areecontrollate areecontrollate_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.areecontrollate
    ADD CONSTRAINT areecontrollate_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.areecontrollate DROP CONSTRAINT areecontrollate_pkey;
       public            postgres    false    225            w           2606    16662 *   centrimonitoraggio centrimonitoraggio_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.centrimonitoraggio
    ADD CONSTRAINT centrimonitoraggio_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY public.centrimonitoraggio DROP CONSTRAINT centrimonitoraggio_pkey;
       public            postgres    false    219            {           2606    32996 )   areeinteresse coordinatemonitoraggio_pkey 
   CONSTRAINT     g   ALTER TABLE ONLY public.areeinteresse
    ADD CONSTRAINT coordinatemonitoraggio_pkey PRIMARY KEY (id);
 S   ALTER TABLE ONLY public.areeinteresse DROP CONSTRAINT coordinatemonitoraggio_pkey;
       public            postgres    false    221            y           2606    41216 "   centrimonitoraggio indirizzounique 
   CONSTRAINT     v   ALTER TABLE ONLY public.centrimonitoraggio
    ADD CONSTRAINT indirizzounique UNIQUE (indirizzo, cap, numero_civico);
 L   ALTER TABLE ONLY public.centrimonitoraggio DROP CONSTRAINT indirizzounique;
       public            postgres    false    219    219    219            q           2606    16651 :   operatoriregistrati operatoriregistrati_codice_fiscale_key 
   CONSTRAINT        ALTER TABLE ONLY public.operatoriregistrati
    ADD CONSTRAINT operatoriregistrati_codice_fiscale_key UNIQUE (codice_fiscale);
 d   ALTER TABLE ONLY public.operatoriregistrati DROP CONSTRAINT operatoriregistrati_codice_fiscale_key;
       public            postgres    false    217            s           2606    16649 ,   operatoriregistrati operatoriregistrati_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.operatoriregistrati
    ADD CONSTRAINT operatoriregistrati_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.operatoriregistrati DROP CONSTRAINT operatoriregistrati_pkey;
       public            postgres    false    217            u           2606    16653 2   operatoriregistrati operatoriregistrati_userid_key 
   CONSTRAINT     o   ALTER TABLE ONLY public.operatoriregistrati
    ADD CONSTRAINT operatoriregistrati_userid_key UNIQUE (userid);
 \   ALTER TABLE ONLY public.operatoriregistrati DROP CONSTRAINT operatoriregistrati_userid_key;
       public            postgres    false    217                       2606    24803 *   parametriclimatici parametriclimatici_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.parametriclimatici
    ADD CONSTRAINT parametriclimatici_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY public.parametriclimatici DROP CONSTRAINT parametriclimatici_pkey;
       public            postgres    false    223            }           2606    32992 "   areeinteresse unique_denominazione 
   CONSTRAINT     p   ALTER TABLE ONLY public.areeinteresse
    ADD CONSTRAINT unique_denominazione UNIQUE (denominazione_ufficiale);
 L   ALTER TABLE ONLY public.areeinteresse DROP CONSTRAINT unique_denominazione;
       public            postgres    false    221            �           2606    41220 "   areecontrollate uniquesucentroarea 
   CONSTRAINT     k   ALTER TABLE ONLY public.areecontrollate
    ADD CONSTRAINT uniquesucentroarea UNIQUE (centro_id, area_id);
 L   ALTER TABLE ONLY public.areecontrollate DROP CONSTRAINT uniquesucentroarea;
       public            postgres    false    225    225            �           2606    41196 ,   areecontrollate areecontrollate_area_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.areecontrollate
    ADD CONSTRAINT areecontrollate_area_id_fkey FOREIGN KEY (area_id) REFERENCES public.areeinteresse(id) ON DELETE CASCADE;
 V   ALTER TABLE ONLY public.areecontrollate DROP CONSTRAINT areecontrollate_area_id_fkey;
       public          postgres    false    225    221    4731            �           2606    41191 .   areecontrollate areecontrollate_centro_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.areecontrollate
    ADD CONSTRAINT areecontrollate_centro_id_fkey FOREIGN KEY (centro_id) REFERENCES public.centrimonitoraggio(id) ON DELETE CASCADE;
 X   ALTER TABLE ONLY public.areecontrollate DROP CONSTRAINT areecontrollate_centro_id_fkey;
       public          postgres    false    219    4727    225            �           2606    24764 *   operatoriregistrati fk_centro_monitoraggio    FK CONSTRAINT     �   ALTER TABLE ONLY public.operatoriregistrati
    ADD CONSTRAINT fk_centro_monitoraggio FOREIGN KEY (centro_monitoraggio_id) REFERENCES public.centrimonitoraggio(id) ON DELETE SET NULL;
 T   ALTER TABLE ONLY public.operatoriregistrati DROP CONSTRAINT fk_centro_monitoraggio;
       public          postgres    false    4727    217    219            �           2606    32997 -   parametriclimatici parametriclimatici_area_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.parametriclimatici
    ADD CONSTRAINT parametriclimatici_area_id FOREIGN KEY (coordinate_monitoraggio_id) REFERENCES public.areeinteresse(id) NOT VALID;
 W   ALTER TABLE ONLY public.parametriclimatici DROP CONSTRAINT parametriclimatici_area_id;
       public          postgres    false    4731    221    223            �           2606    24804 A   parametriclimatici parametriclimatici_centro_monitoraggio_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.parametriclimatici
    ADD CONSTRAINT parametriclimatici_centro_monitoraggio_id_fkey FOREIGN KEY (centro_monitoraggio_id) REFERENCES public.centrimonitoraggio(id);
 k   ALTER TABLE ONLY public.parametriclimatici DROP CONSTRAINT parametriclimatici_centro_monitoraggio_id_fkey;
       public          postgres    false    223    219    4727            �           2606    24814 7   parametriclimatici parametriclimatici_operatore_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.parametriclimatici
    ADD CONSTRAINT parametriclimatici_operatore_id_fkey FOREIGN KEY (operatore_id) REFERENCES public.operatoriregistrati(id);
 a   ALTER TABLE ONLY public.parametriclimatici DROP CONSTRAINT parametriclimatici_operatore_id_fkey;
       public          postgres    false    223    217    4723            "   �   x�-���@!Ϥ�}���l�ul�=9/�in��� ���^�������_��@��)�����HNVGG��,\��|]�
x�L�E8��2o���vq)+ۊ��.��d�ҝw�&&��1����>��܈������������P<�Խ�ȗc�dj?Ӟ��\M�{�K���1�!�#:2'��zTD��.jdrTˢD� jO"�AnT�^g:Gݡ�7[�� ��0L4            x�m��vIr�횧hO����,��h�Y�w�᜝#� �%4���ݠ O�D��5tdʜ��T�nV������,��23�ƍ�i*ל697�q�	MM�OCr]��I���U�v}��v��o���2��I�6�i՜������[om��_��m�﷏�N�#glc��e�����w!��T?�����"kr��B�]٠�������r�ylo��C�hd�L
�N�nb�2ʦ1,U��7�t�خώ6Q6u��6�q5�2�r��M�����~l��h�*_�Z��]>�`bY�F�b��u���r�i/�se��s�h�`yc|�q�����a��G�7�T��n�F��R���F��^ﷷ�+S�7�p��X�a֟jo�#�U���u;�.4�x� ��y��T<����>[�l���b��:W]��{�(ɋ��'r�1Y�Y�8;k��f7��d��M��Ħ����?�uM�,��CS�q؂��v8��{�bc�����ԧ.��D#ϲ���x;��f6�w���5���eWw� D�8��F��~��n���c��i�|��J0��5�pu�^�n�a�n瓂s
�V��K`@'��	� g.O��vs1��2/l�I��O8m&��Z��ϯ��i��=�]��A�"S8���3@|�������B�\� =pV����M��uN�Z��y�]�o����L����4PDe�i�$�!E0?�6�弮Uht��K@� �!Sc�߶���9�|��L�-�\[L��1�PR-�YB��%��fׯ^�w��B3�g\�W��)c\j��L�Տ��y�9��-�M�?�RJ���+��%qc�(���𰀣-�

G�ޓвs������<%٭��z6L2�̓��`gl��!�6�r��r&-��:�Q�D�ɼD�'�SAV�v׎�]�"��>�Cm}N� ��I!�}`�R:|���UW���X$�ZdΪ^��$�b��C�}Ƒ��0:+10���L���W"b�7�X����d�N�n#�3[t$}C��Z��>v�qB�����@g��D���L�z\E���mχ�n39�h��9�$'8���T,�<7�u{�\Y��o��x��K�d�Lmp|����1&�DFd�֨d�=��'B�M�Ŧ]����J���+�,�`kj���IgM!�%�Qճܴ^wO��ņde�kkeh�4𧚺,��QK����`����@��pI����H�z�+%A�ռ~b����7��V^�Rv��ðz�n�����(Cc&A�}��.�YX䢃��(QG���FűD>�8U��ʨg�����of3'�Q�q?���(���p'AؐB��v7��/ݮ�S̗�F�gO~Q�M)�8K�H�	J����ѭ>�=lѦRm��,�e�E��]���nV���zf{_��D�3�BԆwT��%�"���z���
�x�:-�R`��ܑX�5�U��u{T'��$N����~>p!5|BD�T��٦);$��T�k �4�I��p׮��ꆺ� ��MLE�D6���R��BQ�dxqtG0b�rE��xp��#,YI�aX�:�Eo���-���a\C��'|�yX.�I��
%1?k�x�
J���y9����0�H& dD��/Y�����>��)J���QKwUy\�*�R4_ �b�$M��%Ϩ���w��L��PH^���z�+��3�EHu� *X�!��D��wŉ�z���R �Ө?Aɠ���c]�d=�S�j""r���Ωn�eg�Q��!
��!V	]�������1���k�*�fA8u�qDU&���������~�#��qU@�Q~��+b�!V�� #с�9���cO5��t Gs_�H=� GGM�'B�5U�v,9ퟯ۝h]�G�P�"n2?p@��U��(����w� I��1U]B�Yӟ�bc!�\}Y���n�>ڦ*�S�@��Q7�?���j%�D����z���v��LG�3L�@x�6
{�H�^�����h@�p<�!������w��/��r@]<ڥZP[�N̊>�P�Ilg�n��B��8��y��Z�4N�aN��>s�۫�9p���0m�#����$�Ĕ���G��k[�t]`3�v�KA��T'�D^�.�i7�Þbp����������IB�)�M=���n����p�G�5@�(-�IF� �p�������~sэ�����4�7�kf��&�Cd��8��?����|���Ͷ8P�2c�ۥ���3M��^]!*����?Z�Re�ES���O깄��bw�<Z5��7�R`�+I�%%�E�#�tޭ^w�x�=Zg��I?�o]&��p����u�~M�iw���p������(���:�j�I�Nq��Jr��o6�mwy��l���q�Π��Ԕq.zӎ��~�o�ڳ��w����o�!�TtAe5�p��yI;�����ZD�j�ī����?u�������˥-a0"��P��%%��3��ۯ����v�tPV��Q�bq�Z�_��)τ��~s��G��橘KΩ�ǚnQ<K���0yR5��v�~aEL&�
��1�!vڮ�\��ռ�����vs��n���Ԉ:Х��%ލ¬�!B�R	�a36uYғ��m�Հy!J�S�[�z�o��;:���)A�:��F�C�b�u���cY�����%@�X�,)�D�� �@��+X�#^���۞�#no������z��7]�]�""��jhZB�HK��A��k�o�,���Q8�?٦�����a�٭޴��曟	:L0"q�C���}�N(c��d�u��/Ĳ���r���Tt��Y��	��:���=xs��"��2�� =�Q�^��9^�ϯ5ѩ&�_�xkp'ق6�ꬔD�NQ��?���_h��.��=����F�+]�*I��MB��Օ4���~<�z���#�S��ͬ�M��P�4,��O�n���́�*��z�!�AU��+���+Rj�� �)O�Q_[^�!T�<��t����:�i�	^�8;�q���	��zA ���w�a?�Kc0H� �H�iXl$~��Ɂū���}f�=Y����iO6�Te�š_\p���q�����y��=���{b���<���HS�(xꦥ�l���AH��F~կ;��Sk�m*u��Rn!�6e��ݞ�����`i�b-pC����u���Z��~i׷Ԟ���}\Ԙi�&���*��,�Ǣbi�K����v��4=�����ǋY��i\����7E]&���YL����(J�J�U�޸L��Md ����M�v;�Ue	R���.i|�6U��&*;?��^t�?��~\~��JP����N #��[N����76���tg�JI���ę���c���L���4.��Tw(�`=XQ���8�R�S��k/�qa��dI"��KQ����~�.����"(7{��yV�I�$��R���m4�vJ�����8�>!2�_h�x��EC�c<#�����ի�?[Z�zں?!L�k*��M_]���;bkʾ5���k����&>�H�q�Q�W�p�o���� ~B�����b�/�O�-�9����6����|������G��GO�F;��.F~�BV��)��]��W?o�]ϿF�� 4*��Ɇ��Z��r��_���}X���C?�Y�9����v����u����ⲃ�Ӯך_�)/tXW�v-=��s��z� ���=����Llic��Lk�f�>v������)
�F
hF�S�� ���M��(�����zr4ӊ�O���h�t��l(b����w�Y�jhrIk{�M��<�ɜ�������i���g����tsc�,b�扩��P������0^?��F��?��.=����8�ݰ]�@}����/4Ӭ:��c�IZPiHB��g�vL,ݓJ�c�a�a���\k���Z>MǢnZJ�y3P�� O�Qץ�&�����[\�Ӭ�WC���홱��G�AS"(���>`��\�_���6�"�i����jҚ'��5ȶ&@����D��m�{f�hN�&8�~�D��U��ʽS������}f�o�;�C�b
�J�|i�_h����ci�� 9  "-8u}J�-��vRK��r��8�Of%���Jo���eF��{ӭ��}�F���:ަ�)F3(��%�`s��ُԆn�{jJ����ވ M�ȀF����r6�NE㵳��3k#k������̗��ʾ��my5�8�nu˩����S]��� h��k�G�Y궘��i�-��L�!�X����4����Ve��+-a��S�b�L-
���o���r����e�j|��R�d��~�.툛�Q@�r�e�	�9M&(1��k:��}{{;l���[d���8�)٦���=j}iWM،�$Vg#�%�(A�KKU>��&eI͙Q���Ïۖkah�"����Q}}h/[~�/[ޕ -�b�oY�(C�z	ŏ����>�:v�d��������9��j��-a��1�\^��oڛ���>P@����N �G���C{s;��<Lh���3�6\Nn�ؓN��k���������	���,��ӄ�a�m�a������$�TfD
y��|�����g�F��Ӏi@ϊ��ĭ��N���E���Y�1�:�Gȕ8�-Zz�9�x���Z�lE|���2՛�VYN.>����B��Ҕ�]��y3�ِ��ݓ�_�ܒf%�)PQM���}�xZ��z������:K�d�f��s������p�����g*���H��N�(��8��~�^W�·��䢼`
Qm�j�D����vX�V�ð�ݳu�K����1��$�����O�lw�W��s�M"��bv�;k��������zMK;�[βtI��U\uNऩ�����?V?��v��uKX���%��'t��+����#4��(�K moo������ј�1	x���d�2�T�J��L^���?���h�4a�����F�%\����؟/��h��3�x<$v�&�0i�C*-6{��V?l���0�u���̂��$���Q�A��T�2�<]<�.h��������%^�~�.�uْ��YX��?�� �/72�,}g1�'������]�܏���nN�����qYJ���4�7	*��Wwx5��i����F�Ϧ@��;�VȣWݨ�@s�D�ڙ��v��o��͡7�Y�g���O�͡��SW��̳��Q3}�����o󵯋T�����-��;9�Fon����eo��p͢�)���cwvu���`O��`C���O~�T�~	W.l��A�n�ݨ�@�dߗ��ӛ�/�]܋ͮw$(�@R詚���l)czhA҈4-�4�zۏ��ݗ<k�u�a�5u;P��&�QƂQ�?U��n�?�kMr�ݍ��ӥ�?L}J�V[��T�虨���a�j�zYr�rvJ���?}Y��-��L'*�䫥��y{�o	��R��ԁ�r�
���.�C~����h����vN�'uM�G�M�i�e[�S��}|A��n���:��l�B�6?N:�b|B>��Q}�H}X��g���v�s9�T��Q��j�4#S�Wg��Ҭ���������o���w��?���՛�T�em���w��3�᛿z5vw�7SMy�P~D�;�i��!���5I.Tv��� (�D�Z�ir��5�ӳ��[ڏ{@�z1v����9�����_�
         #  x�m�Mn�0���)x�B�~l//�qԁW݌$B�"U���C�T��a����E�Ze�����@O�2���x�x��&(�dU�r�ch聝G�dbǎ�/�;��f�� g�(��~�C��� !;�T���j��5��B���
�V$�I�)
5�^(0��3����o�k�#yHd����O;
���$P�����0�֨L��e��M'�TO�'�s<]^V�	�^��J������}R�9�0����d� ����8Ĭ�!*<cP���5�}M"��NC�w��rG����z����DA/�,U��T�L�pE�jA�?�dK�9a���&S'��?�E=��"	����s�m�u�]24��^�{Y��|�Z����G���y\��o�U$XPZQɵ�`�����U&B&�b��*��|&�
��R,�Q�U�-)c�34ہ���1�#R���*?y~=+ש�23Aj& ����l�2��)o>��,��,�/�A%���)�h�f�'�|���-�c��#��dY���Zx         �  x��U�r�8�}�yI�/�L
��4l��n�3��/����w$uڙ�cK���s����_[C�ִ��R*���uFR��J�JR��u}+��2=�`�(����#)�"�Q�.�ֲ�j]b_|���;1�B�Ȃ=z��x1��]1Z�{ڝ��l��X7y�#��"�T�9�o��d�H��֟�X,ɀ7:0o`�8қ�8II1ݙ�ִ����r��[N�q4l�;�9j�9��w�7[�
��Ż�RgS@�5�`�~`���
A�uYѴ.�v1�k����'�E&�F $ݚ����v%ݮ�n�?9u�� �N�Wda@]����Y��,�>�����u5[��"�{����y'�ϏU��e�,�����YsEu�ոA�n�6c��j�W���W�H9C����Q����B����/���Kh˱���0���ձ�Rj���s�ʂ��vF��A�h�%�ZE�7I�̞|!DEӗmF��̷9��c��)d�wΩz��p��p\����e�=�P�Z�o��i���Hd�����"�]d�{U�E����4k���v8��̗�d<9���K���Ġ*<�"��~��|Q C:Z�3{ʋjK� ��"�t��`!�P�f�Z�y�)�$�@jOkvK��YB����e�u�*/�~`݈�gx���r��0�K`]�yd�_.�4�	L�
c��t�^W.�2��B�8��m�6c��	XQ)nƠH��-�Ô+��<>���$�N�c�����J�ʈ��Ҧ�|b�y�.�c�|���ήmgZFL(�G2�^�M��7tM����Y^����HX���U����ͨ������F���P����q|��q�^!b�ԫ@���N^�\ύ�/(|s@���v�T�c�;�dOns��+e�ǹ>�߹��߇����Q�j�          i  x��V���6�ɯP�&r��2U�d�I�mx-��-yd��|M�%? �d�ڻ��L<P| ��If%��E[+訝e���y�Nc&?���̰�N���?W��~�L
�w�2˾L�r������c`
Q~�3�M�:L����Dذ��8��`W�.{?]�V8�?��-2���������a`ءk���4�����A�4�E_������
@y}�R&��WK��Ê��2���W��ǅ!�TJ8�e�9�4����6�nQ�X�6��\���8T�|>�}����CKL-a�����Tc�v�@��q�k7��G�d�͂��
&[ ���gt=Y�%��C�U�0\�W[j�Z�Z	fw����Ӧm��Y�c8�42���}��+�sh�s��U��BV�1��y!����3�{���?a�a-�m2��RtL!$FH�)F����Ј��8�wKL& A��	.�Xۦ㗝�-B-�5���E��`pn��P9��~ڧ�2q���W�Wg?��8	>��@z���@��g�҅2��0��R����K �Cu�C��؎��Du����u��.܀i���Z,G�*��>���5���nӥ��CIr�\D�v��]��wC�i��	��t5xC����(�8F�eRm�P����v� ��(�YB�.���F��peJb�İ�QOB45�Z@�h�Ao��,;\�R�g �@f+����̒�������Z�}
A�<>�PF�S 9*�D$]x��-�}�pH�e��ڔ��׷���l�J:ل�<���B ��+r���!�)Bu�!���(m��u�f��J��R���{6�6f�lYDq*	A�q� C����MFX_$��LK��� !ƒ7>�@~K,TS@�&U}5U���*΁��{f�r�N��w'?�9��ٟ��"N�qN�2�~;C�b�=̍�F0;\�y;�ޏ'z �� �*��)b�ywb>��ı����0�6�PH�4	�R$�Dv�Q��˳��#�}%���Vf�����b���:����!q���T��7�����fCe��0��"��������._�\'x)���]uۤ7:ݻ�_w��59�<     