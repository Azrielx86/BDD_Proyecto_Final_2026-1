create table tipo_procesador_f3_emc_s1
(
    tipo_procesador_id number(5, 0)     not null,
    clave              varchar2(40)     not null,
    descripcion        varchar2(400)    not null,
    constraint pk34_1_1 primary key (tipo_procesador_id)
);

create table tipo_tarjeta_video_f3_emc_s1
(
    tipo_tarjeta_video_id number(5, 0)     not null,
    clave                 varchar2(40)     not null,
    descripcion           varchar2(400)    not null,
    constraint pk38_1_1 primary key (tipo_tarjeta_video_id)
);

create table tipo_almacenamiento_f3_emc_s1
(
    tipo_almacenamiento_id number(5, 0)     not null,
    clave                  varchar2(40)     not null,
    descripcion            varchar2(400)    not null,
    constraint pk38_1_1_1_1_1_1 primary key (tipo_almacenamiento_id)
);

create table tipo_monitor_f3_emc_s1
(
    tipo_monitor_id number(5, 0)     not null,
    clave           varchar2(40)     not null,
    descripcion     varchar2(400)    not null,
    constraint pk38_1_1_1_1_1_1_1_1_1_1 primary key (tipo_monitor_id)
);

create table sucursal_f3_emc_s1
(
    sucursal_id number(10, 0)    not null,
    clave       varchar2(10)     not null,
    es_taller   number(1, 0)     not null,
    es_venta    number(1, 0)     not null,
    nombre      varchar2(40)     not null,
    latitud     binary_float not null,
    longitud    binary_float not null,
    url         varchar2(200)    not null,
    constraint pk1_2 primary key (sucursal_id)
);



create table sucursal_taller_f3_emc_s1
(
    sucursal_id       number(10, 0)    not null,
    dia_descanso      number(1, 0)     not null,
    telefono_atencion varchar2(20)     not null,
    constraint pk5_1_1 primary key (sucursal_id),
    constraint refsucursal_f3_emc_s132 foreign key (sucursal_id)
        references sucursal_f3_emc_s1 (sucursal_id)
);



create table servicio_laptop_f3_emc_s1
(
    num_servicio number(10, 0)     not null,
    laptop_id    number(10, 0)     not null,
    importe      number(8, 2)      not null,
    diagnostico  varchar2(2000)    not null,
    factura      blob,
    sucursal_id  number(10, 0)     not null,
    constraint pk28_1_1 primary key (num_servicio, laptop_id),
    constraint refsucursal_taller_f3_emc_s135 foreign key (sucursal_id)
        references sucursal_taller_f3_emc_s1 (sucursal_id)
);


create table laptop_f3_emc_s1
(
    laptop_id              number(10, 0)     not null,
    num_serie              varchar2(18)      not null,
    cantidad_ram           number(6, 0)      not null,
    caracteristicas_extras varchar2(2000)    not null,
    tipo_tarjeta_video_id  number(5, 0)      not null,
    tipo_procesador_id     number(5, 0)      not null,
    tipo_almacenamiento_id number(5, 0)      not null,
    tipo_monitor_id        number(5, 0)      not null,
    laptop_reemplazo_id    number(10, 0),
    constraint pk20_1_1 primary key (laptop_id),
    constraint reftipo_procesador_f3_emc_s127 foreign key (tipo_procesador_id)
        references tipo_procesador_f3_emc_s1 (tipo_procesador_id),
    constraint reftipo_tarjeta_video_f3_emc28 foreign key (tipo_tarjeta_video_id)
        references tipo_tarjeta_video_f3_emc_s1 (tipo_tarjeta_video_id),
    constraint reftipo_almacenamiento_f3_em29 foreign key (tipo_almacenamiento_id)
        references tipo_almacenamiento_f3_emc_s1 (tipo_almacenamiento_id),
    constraint reftipo_monitor_f3_emc_s130 foreign key (tipo_monitor_id)
        references tipo_monitor_f3_emc_s1 (tipo_monitor_id)
);

create table sucursal_venta_f3_emc_s1
(
    sucursal_id   number(10, 0)    not null,
    hora_apertura timestamp(6) not null,
    hora_cierre   timestamp(6) not null,
    constraint pk9_2 primary key (sucursal_id),
    constraint refsucursal_f3_emc_s133 foreign key (sucursal_id)
        references sucursal_f3_emc_s1 (sucursal_id)
);

create table laptop_inventario_f1_emc_s1
(
    laptop_id   number(10, 0)    not null,
    rfc_cliente varchar2(13),
    num_tarjeta varchar2(16),
    constraint pk26 primary key (laptop_id)
);

create table status_laptop
(
    status_laptop_id number(5, 0)     not null,
    clave            varchar2(40)     not null,
    descripcion      varchar2(400)    not null,
    constraint pk50 primary key (status_laptop_id)
);
