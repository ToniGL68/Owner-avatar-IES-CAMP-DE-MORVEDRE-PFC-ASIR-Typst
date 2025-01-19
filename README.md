# IES-CAMP-DE-MORVEDRE-PFC-ASIR-Typst
Plantilla en Typst para PFC IES Camp de Morvedre.

Leer el archivo "Como-usar-plantilla-typst-pfc.pdf"

Copiar en el archivo main.typ de tu proyecto:
#import "template-ies-cdm-pfc.typ": plantilla-pfc
  #show: plantilla-pfc.with(
    autor: [Nombre y Apellidos de Autor],
    tutor: [Nombre y Apellidos de Tutor],
    curso: [2024/2025],
    nombre-ciclo: [Administración de Sistemas en Red],
    nombre-centro: [IES Camp de Morvedre],
    titulo-pfc: [El título del PFC. Aparecerá en la portada, en la página 1 y en el encabezado de todas las páginas],  
    indice-figuras:1,
    indice-tablas:1,
    indice-codigos:1,
    anexos:1,
    bibliografia:1,    
   )
