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

Instalar http://supercollider.github.io/ en computadora con Windows, MacOS, Linux (raspberry py incluido)

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

Bajar http://charlie-roberts.com/Control/ (free software) o http://hexler.net/software/touchosc para Android/iOS e instalar en el celular/tablet. 

Configurar http://[IP]:[PORT] de la máquina que corra SuperCollider.


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
* APIcultor: Aplicaciones musicales con redpanal.org, MIR y API Rest
    * https://github.com/sonidosmutantes/apicultor

## MIR

Descriptores: http://essentia.upf.edu/documentation/algorithms_reference.html

Ejemplo MIR en Python: taller-procesamiento/mir/extractTempo.py

