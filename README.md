# 🧃 Java Developer Test - Mini CRM System Diseño

**Author:** Brandon J.  
**Email:** [jmbrandon15@gmail.com]  
**Date:** Noviembre 2025
**IDE:** PowerDesing 
**Type:** Diseño de Base de Datos

---

## 📋 Descripción

Este proyecto se centra en el diseño de base datos para un Mini Sistema CRM, recabando los requerimientos funcionales para el sistema y recopilarlos en un archivo que documenta las Especificaciones de Requerimiento.
El diseño esta realizando en PowerDesign 16.5 con la generación de Caso de Uso, Modelado del Diseño, Script (adaptado a Oracle) y generación de reportes.

---

## 🧩 Implementación

✅ Caso de Uso para detectar las funciones de cada usuario.
✅ Modelo Conceptual para comprender la cardinalidad de las entidades
✅ Modelo Logico para comprender la integridad referencial entre tablas
✅ Modelo Físico será nuestro diseño pulido siguiendo las normas standard de la 3FN
✅ ERS Documentación de los requerimientos del proyecto y abordar más claramente que es lo que se hará y tener presente requerimientos no funcionales

---

## 🚀 Implementarlo

### PowerDesign

1 Tener Power Design para levantar el diseño (preferencia la V16.5). En caso, de no contar con el software, entrar a los modelos y acceder a los reportes de cada uno para observar el diseño.
2 Abrir el WorkSpace **.sws** para abrir el proyecto.
3 Si los modelos, solicitan buscar los archivos de diseño, entrar en cada carpeta, encontraran las respectivas extensiones de cada uno y un reporte sobre cada modelo.
4 Si desea generar el script del modelo físico, diríjase a Database -> Generate Database se generara un archivo sql para ocupar.

**Nota**: El modelo esta orientado a Oracle 11g, si desea adaptarlo a otro lenguaje SQL, se sugiere que entre en modelo Conceptual ir a **tools** -> Generate **Logical Data Model**. Le dará la opción de elegir a que SGBD quiera orientar, lo mismo pasara en Physical Data Model, pero generalmente, seguirá el mismo motor elegido en Logical Model.

---