#let plantilla-pfc(
  autor: none,
  tutor:none,
  curso:none,
  nombre-ciclo:none,
  nombre-centro:none,
  titulo-pfc:none,
  indice-figuras:none,
  indice-tablas:none,
  indice-codigos:none,  
  anexos:none,
  bibliografia:none,
  doc
) = {
  //Portada##############################################  
  set text(lang: "es",region: "eu")
  set page(margin: (x:0mm, y:0mm))
  
  grid( columns: (3.5cm,1fr), rows: 1fr,
  grid.cell(fill: rgb(111, 197, 197))[
  #align(center+horizon)[#text(stroke: 2pt,30pt,font: "New Computer Modern Sans")[#rotate(-90deg,reflow: true)[PROYECTO #h(5mm) FINAL #h(5mm) DE #h(5mm) CICLO]]]
  ],
  [#grid(columns: 1fr, rows: (6cm,3cm,2cm,1fr,2cm,2cm,4cm),
  [#grid(columns: (50%,50%),rows: 100%, //stroke: 1pt+green,
  align(center+bottom)[#image("logos/logo-ies.png",width: 70%)],
  align(center+bottom)[#image("logos/logo-fp.png",height: 90%)]  
  )],
  align(center+horizon)[#text(20pt,nombre-centro)],
  align(center+horizon)[#text(18pt,nombre-ciclo)],
  grid.cell(inset:(x:1cm))[ #align(center+horizon)[#text(20pt)[#smallcaps(titulo-pfc)]]],
  align(center+horizon)[#text(20pt,autor)],
  align(center+horizon)[#text(20pt)[Tutor/a: #tutor]],
  align(center+horizon)[#text(18pt)[Curso: #curso]]
  )]  
  )
  pagebreak()

//Página 1 ###############################################
  set page(margin:(x:3cm,y:2.5cm))  
  grid(    
  columns: (1fr),
  rows: (1fr,4fr,1fr),
  align: (center+horizon),
  [],
  [#text(30pt)[#smallcaps(titulo-pfc)]],
  [#text(20pt,autor)])
  pagebreak()

  //Reglas para el documento #############################
  set text(12pt,font: "New Computer Modern")
  set par(first-line-indent: 1.5em,spacing: 2em, justify: true, leading: 1.5em)
  set enum(full: true)
  show link: set text(style: "italic")
  show ref: set text(style: "italic")  

  //caption en parte superior para las tablas
  show figure.where(kind:table):set figure.caption(position: top)  
  
  //forma de enumerar los títulos
  set heading( numbering: "1.")
  
  show outline.entry.where(level: 1,): it => {v(12pt, weak: true); strong(it)}
  outline(title: [Índice de Contenidos <indice>], indent:auto) 
  pagebreak()  
  
  if indice-figuras==1{
    outline(title: [Índice de Figuras], target: figure.where(kind: image))
    pagebreak()
  } 
  
  if indice-tablas==1{
    outline(title: [Índice de Tablas], target: figure.where(kind: table))
    pagebreak()
  }
  
  if indice-codigos==1{
    outline(title: [Índice de Código], target: figure.where(kind: "code"))
    pagebreak()
  }  

  //se empieza a enumerar las páginas después de los índices
  counter(page).update(1)
  
  set page (header: rect(stroke:(bottom:1pt+luma(175)),width: 100%)[
  #text(10pt,fill: luma(75),titulo-pfc)])

  //pie de página sin raya
  // set page(footer: context [#text(10pt,fill: luma(75),
  // [#autor #h(1fr) #counter(page).display("1/1", both: true,)])])  

  set page(footer:context [ #rect(
    width: 100%,stroke:(top:1pt+luma(175)))[#text(10pt,fill: luma(75))[#autor
    #h(1fr) #counter(page).display("1 / 1",both:true)]]]) 

  //corrige la ausencia de sangria de primera línea después de título,imagen,tabla ...
  show selector.or(heading, table, grid, figure): it => {
    it
    ""
    context v(-par.spacing - measure("").height)
  }
  
  //añade espacio antes y después de los títulos de los apartados.
  show heading: set block(above: 3em,below: 1.5em)
    
  doc //DOCUMENTO --> espacio para escribir

  //anexos y bibliografía   
  if anexos==1{
    pagebreak()    
    heading(numbering: none, "Anexos")
    set heading(numbering: "A", supplement: [Anexo])
    counter(heading).update(0)
    include "anexos.typ"
  }
  if bibliografia==1{
   pagebreak()   
   bibliography("bibliografia.bib")
  }  
  
}