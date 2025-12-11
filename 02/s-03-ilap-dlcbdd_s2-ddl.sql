create table status_laptop
(
    status_laptop_id number(5, 0)     not null,
    clave            varchar2(40)     not null,
    descripcion      varchar2(400)    not null,
    constraint pk50 primary key (status_laptop_id)
);


create table historico_status_laptop_f1_dlc_s2
(
    historico_status_laptop_id varchar2(40)    not null,
    fecha_status               date not null,
    status_laptop_id           number(5, 0)    not null,
    laptop_id                  varchar2(40),
    constraint pk32_1 primary key (historico_status_laptop_id),
    constraint refstatus_laptop_147 foreign key (status_laptop_id)
        references status_laptop (status_laptop_id)
);


create table tipo_procesador_r_dlc_s2
(
    tipo_procesador_id number(5, 0)     not null,
    clave              varchar2(40)     not null,
    descripcion        varchar2(400)    not null,
    constraint pk34_1 primary key (tipo_procesador_id)
);


create table tipo_tarjeta_video_r_dlc_s2
(
    tipo_tarjeta_video_id number(5, 0)     not null,
    clave                 varchar2(40)     not null,
    descripcion           varchar2(400)    not null,
    constraint pk38_1 primary key (tipo_tarjeta_video_id)
);


create table tipo_almacenamiento_r_dlc_s2
(
    tipo_almacenamiento_id number(5, 0)     not null,
    clave                  varchar2(40)     not null,
    descripcion            varchar2(400)    not null,
    constraint pk38_1_1_1_1_1 primary key (tipo_almacenamiento_id)
);


create table tipo_monitor_r_dlc_s2
(
    tipo_monitor_id number(5, 0)     not null,
    clave           varchar2(40)     not null,
    descripcion     varchar2(400)    not null,
    constraint pk38_1_1_1_1_1_1_1_1_1 primary key (tipo_monitor_id)
);


create table laptop_f2_dlc_s2
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
    constraint pk20_1 primary key (laptop_id),
    constraint reftipo_procesador_f2_dlc_s238 foreign key (tipo_procesador_id)
        references tipo_procesador_r_dlc_s2 (tipo_procesador_id),
    constraint reftipo_tarjeta_video_f2_dlc39 foreign key (tipo_tarjeta_video_id)
        references tipo_tarjeta_video_r_dlc_s2 (tipo_tarjeta_video_id),
    constraint reftipo_almacenamiento_f2_dl40 foreign key (tipo_almacenamiento_id)
        references tipo_almacenamiento_r_dlc_s2 (tipo_almacenamiento_id),
    constraint reftipo_monitor_f2_dlc_s241 foreign key (tipo_monitor_id)
        references tipo_monitor_r_dlc_s2 (tipo_monitor_id)
);


create table laptop_f5_dlc_s2
(
    laptop_id number(10, 0)    not null,
    foto      blob not null,
    constraint pk18 primary key (laptop_id)
);


create table laptop_inventario_f2_dlc_s2
(
    laptop_id        number(10, 0)    not null,
    fecha_status     date not null,
    sucursal_id      number(10, 0),
    status_laptop_id number(5, 0)     not null,
    constraint pk27 primary key (laptop_id),
    constraint refstatus_laptop_148 foreign key (status_laptop_id)
        references status_laptop (status_laptop_id),
    constraint reflaptop_f5_dlc_s259 foreign key (laptop_id)
        references laptop_f5_dlc_s2 (laptop_id)
);


create table sucursal_f2_dlc_s2
(
    sucursal_id number(10, 0)    not null,
    clave       varchar2(10)     not null,
    es_taller   number(1, 0)     not null,
    es_venta    number(1, 0)     not null,
    nombre      varchar2(40)     not null,
    latitud     binary_float not null,
    longitud    binary_float not null,
    url         varchar2(200)    not null,
    constraint pk1_1 primary key (sucursal_id)
);


create table sucursal_taller_f2_dlc_s2
(
    sucursal_id       number(10, 0)    not null,
    dia_descanso      number(1, 0)     not null,
    telefono_atencion varchar2(20)     not null,
    constraint pk5_1 primary key (sucursal_id),
    constraint refsucursal_f2_dlc_s243 foreign key (sucursal_id)
        references sucursal_f2_dlc_s2 (sucursal_id)
);


create table servicio_laptop_f2_dlc_s2
(
    num_servicio number(10, 0)     not null,
    laptop_id    number(10, 0)     not null,
    importe      number(8, 2)      not null,
    diagnostico  varchar2(2000)    not null,
    factura      blob,
    sucursal_id  number(10, 0)     not null,
    constraint pk28_1 primary key (num_servicio, laptop_id),
    constraint refsucursal_taller_f2_dlc_s246 foreign key (sucursal_id)
        references sucursal_taller_f2_dlc_s2 (sucursal_id),
    constraint reflaptop_f5_dlc_s260 foreign key (laptop_id)
        references laptop_f5_dlc_s2 (laptop_id)
);

create table sucursal_venta_f2_dlc_s2
(
    sucursal_id   number(10, 0)    not null,
    hora_apertura timestamp(6) not null,
    hora_cierre   timestamp(6) not null,
    constraint pk9_1 primary key (sucursal_id),
    constraint refsucursal_f2_dlc_s244 foreign key (sucursal_id)
        references sucursal_f2_dlc_s2 (sucursal_id)
);

