Contenido

* Efectos digitales
* Introducción a MIR (Music Information Retrieval)
* Ejemplos en SuperCollider y Python
* Controladores MIDI y OSC
* Livecoding


# Resumen Día 1
* Audio digital
* Diferentes tipos de controladores, DIY, sensores, celulares/tablets y aplicaciones musicales
* Procesamiento en tiempo real
* Protocolos estándar ventajas y desventajas: MIDI y OSC
* Diferencias entre la programación gráfica, objetos, estructurada y funcional
* Desarrollo iterativo e incremental (código siempre funcionando y generando un resultado)
* Livecoding (interactivo)
* Ventajas del Software Libre
* Intro a MIR (Music Information Retrieval)

## Supercollider

Instalar [http://supercollider.github.io/](http://supercollider.github.io/) en computadora con Windows, MacOS, Linux (raspberry py incluido)

Ver ejemplos .scd en /sampler, /controladores, etc

* Servidor
* Buffers
* Synths
* [Controles MIDI/OSC]

## Controladores

Ver ejemplos .scd en /controladores

Mapeos: linlin, linexp

#### MIDI

Conectar y en SC: MIDIIn.connectAll;

#### OSC

Bajar [http://charlie-roberts.com/Control/](http://charlie-roberts.com/Control/) (free software) o [http://hexler.net/software/touchosc](http://hexler.net/software/touchosc) para Android/iOS e instalar en el celular/tablet. 

Configurar http://[IP]:[PORT] de la máquina que corra SuperCollider.

Opción: [http://osc.ammd.net/](http://osc.ammd.net/) (multiplatform desktop server application with built-in client interface, mouse & multitouch interfaces compatible with Chrome 49 or later)


# Resumen Día 2

* Synth con adsr, osciladores, LFO y noise
* OSC en una red local (ip + puerto)
  * Ejemplos en Supercollider
* Análisis de samples con MIR usando python notebook
  * Descriptores (BPM, HFC, dissonance, etc)
  * Valores estadísticos (mean, var, etc) vs frames
  * Clustering (agrupamiento) y gráficos x,y
  * Máquina de estados (sonora)
* Performances: Ideas para manejar la colaboración y bigdata en tiempos de internet
* [APIcultor](https://sonidosmutantes.github.io/apicultor/): Aplicaciones musicales con redpanal.org, MIR y API Rest
    * [https://sonidosmutantes.github.io/apicultor/](https://sonidosmutantes.github.io/apicultor/)
    
## MIR

Descriptores: [http://essentia.upf.edu/documentation/algorithms_reference.html]( http://essentia.upf.edu/documentation/algorithms_reference.html)

Ejemplo MIR en Python: taller-procesamiento/mir/extractTempo.py

# Resumen Día 3

* Técnicas para manipular sonidos obtenidos de formas pseudo-aleatorias
* Efecto freeze y sus variantes
 * Phase vocoder
 * Reverb
 * Síntesis granular
* Manejo de fases ("lock" on/off) 
* Ejemplos en puredata
* Ejemplos en supercollider
* Ejemplos en python usando lib pyo para DSP
 * Síntesis en tiempo real, estilo supercollider
* Usos en performances

Ver python notebooks (jupyter) en /freeze/python (teoría + implementación + ejemplos)

[Efecto freeze](Freeze.md) (detalle)

Cierre con performance sonora integrando toda la técnica y conceptos del taller: [http://redpanal.org/a/banda-de-mutantes-cierre-taller/](http://redpanal.org/a/banda-de-mutantes-cierre-taller/)
