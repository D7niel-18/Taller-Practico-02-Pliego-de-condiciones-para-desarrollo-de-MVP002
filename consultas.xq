declare namespace file="http://expath.org/ns/file";
let $HTML :=
<html lang="es">
    <head>
        <meta charset="UTF-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <link rel="stylesheet" href="styles.css"/>
        <title>Inventario de Exoplanetas</title>
    </head>
    <body>
        <header>
            <h1>Inventario de Exoplanetas</h1>
            <nav>
                <ul>
                    <li><a href="#consulta1">Consulta 1 — Habitabilidad Oro</a></li>
                    <li><a href="#consulta2">Consulta 2 — Ranking Oxígeno</a></li>
                    <li><a href="#consulta3">Consulta 3 — Ficha de Navegación</a></li>
                </ul>
            </nav>
        </header>
        <main>
            <section id="consulta1">
                <h2>Consulta 1: Exoplanetas con temperatura entre 10 °C y 35 °C</h2>
                <div class="galeria">
                {
                    for $p in doc("exoplanetas.xml")/DeepSpaceInventory/Exoplaneta
                    let $temp := number($p/TemperaturaMedia)
                    where $temp >= 10 and $temp <= 35
                    return
                        <article class="planeta-card">
                            <h3>{ $p/NombreComun/text() }</h3>
                            <p class="temperatura">{ $p/TemperaturaMedia/text() } °C</p>
                        </article>
                }
                </div>
            </section>
            <section id="consulta2">
                <h2>Consulta 2: Exoplanetas con Oxígeno ordenados por distancia</h2>
                {
                    for $p in doc("exoplanetas.xml")/DeepSpaceInventory/Exoplaneta
                    where $p/Atmosfera/Componente = "Oxígeno"
                    order by $p/DistanciaAniosLuz ascending
                    return
                        <article class="planeta-ranking">
                            <h3>{ $p/NombreComun/text() }</h3>
                            <p class="distancia">{ $p/DistanciaAniosLuz/text() } años luz</p>
                            <p class="atmosfera">{ $p/Atmosfera/Componente/text() }</p>
                        </article>
                }
            </section>
            <section id="consulta3">
                <h2>Consulta 3: Ficha de Navegación — Gliese Prime</h2>
                {
                    for $p in doc("exoplanetas.xml")/DeepSpaceInventory/Exoplaneta
                    where $p/Codigo = "EP-1024-A"
                    return
                        <article class="ficha">
                            <h3>{ $p/NombreComun/text() }</h3>
                            <p><strong>Distancia a la Tierra: </strong> { $p/DistanciaAniosLuz/text() } años luz</p>
                            <p><strong>Composición atmosférica: </strong> { $p/Atmosfera/Componente/text() }</p>
                        </article>
                }
            </section>
        </main>
        <footer>
            <p>© 2026 Deep Space Inventory. Hecho por Daniel Jiménez Ramírez.</p>
            <a href="https://github.com/D7niel-18" target="_blank">
                <img src="https://cdn-icons-png.flaticon.com/512/2111/2111432.png" alt="GitHub" width="20" height="20"/> GitHub
            </a>
        </footer>
    </body>
</html>
return file:write("index.html", $HTML)
