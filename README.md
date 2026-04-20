# Taller-Practico-02-Pliego-de-condiciones-para-desarrollo-de-MVP002
- Autor: Daniel Jiménez Ramírez
- Profesor: Willman Acosta
- Asignatura: Lenguaje de marcas

## Consultas de Negocio
- Consulta 1. Filtrar y mostrar en una "galería visual" los planetas con temperatura entre 10°C y 35°C (Habitabilidad Oro).
for $p in //DeepSpaceInventory/Exoplaneta where
  $p/TemperaturaMedia > 10 and $p/TemperaturaMedia < 35
return $p/Codigo/text()
- Consulta 2. Ranking de planetas más cercanos a la Tierra que contengan "Oxígeno" en su atmósfera.
  for $p in //DeepSpaceInventory/Exoplaneta 
    where $p/Atmosfera/Componente = "Oxígeno" 
    order by $p/DistanciaAniosLuz
  return $p/NombreComun/text()
- Consulta 3. Generador de "Ficha de Navegación" para un planeta concreto, extrayendo sus coordenadas y composición.

- Tecnologias usadas: HTML, CSS, XQuery, XML
- Editor usado: Visual Studio Code, BaseX
