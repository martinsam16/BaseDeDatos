/*create database Alquiler char set utf-8;*/
use dbAlquiler;

create table if not exists persona(
    codper int PRIMARY key auto_increment,
    nomper VARCHAR(100),
    apeper VARCHAR(100),
    dniper VARCHAR(8),
    telper VARCHAR(9)
);