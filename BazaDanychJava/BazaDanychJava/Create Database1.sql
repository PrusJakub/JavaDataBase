/*==============================================================*/
/* DBMS name:      Microsoft SQL Server 2012                    */
/* Created on:     12.10.2017 14:25:37                          */
/*==============================================================*/


if exists (select 1
            from  sysobjects
           where  id = object_id('Marka')
            and   type = 'U')
   drop table Marka
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('Model')
            and   name  = 'RokProdukcji_FK'
            and   indid > 0
            and   indid < 255)
   drop index Model.RokProdukcji_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('Model')
            and   name  = 'Silnik_FK'
            and   indid > 0
            and   indid < 255)
   drop index Model.Silnik_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('Model')
            and   name  = 'MarkaPojazdu_FK'
            and   indid > 0
            and   indid < 255)
   drop index Model.MarkaPojazdu_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('Model')
            and   type = 'U')
   drop table Model
go

if exists (select 1
            from  sysobjects
           where  id = object_id('Rocznik')
            and   type = 'U')
   drop table Rocznik
go

if exists (select 1
            from  sysobjects
           where  id = object_id('Silnik')
            and   type = 'U')
   drop table Silnik
go

/*==============================================================*/
/* Table: Marka                                                 */
/*==============================================================*/
create table Marka (
   KrajPochodzenia      varchar(20)          not null,
   NazwaMarki           varchar(20)          not null,
   constraint PK_MARKA primary key nonclustered (NazwaMarki)
)
go

/*==============================================================*/
/* Table: Model                                                 */
/*==============================================================*/
create table Model (
   Nadwozie             varchar(10)          not null,
   NazwaModelu          varchar(20)          not null,
   Kolor                varchar(10)          not null,
   IDModelu             numeric              identity,
   Rok                  smallint             null,
   NrSilnika            bigint               null,
   NazwaMarki           varchar(20)          null,
   constraint PK_MODEL primary key nonclustered (IDModelu)
)
go

/*==============================================================*/
/* Index: MarkaPojazdu_FK                                       */
/*==============================================================*/
create index MarkaPojazdu_FK on Model (
NazwaMarki ASC
)
go

/*==============================================================*/
/* Index: Silnik_FK                                             */
/*==============================================================*/
create index Silnik_FK on Model (
NrSilnika ASC
)
go

/*==============================================================*/
/* Index: RokProdukcji_FK                                       */
/*==============================================================*/
create index RokProdukcji_FK on Model (
Rok ASC
)
go

/*==============================================================*/
/* Table: Rocznik                                               */
/*==============================================================*/
create table Rocznik (
   Rok                  smallint             not null,
   constraint PK_ROCZNIK primary key nonclustered (Rok)
)
go

/*==============================================================*/
/* Table: Silnik                                                */
/*==============================================================*/
create table Silnik (
   NrSilnika            bigint               not null,
   Pojemnosc            real                 not null,
   Moc                  smallint             not null,
   MomentObrotowy       smallint             not null,
   constraint PK_SILNIK primary key nonclustered (NrSilnika)
)
go

