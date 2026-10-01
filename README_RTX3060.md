# FooocusPlus RTX 3060

Cambios locales preparados para una RTX 3060 de 12 GB:

- `run_3060_juggernaut.bat`: inicio con Juggernaut8, modo oscuro y descarga de modelos desde VRAM.
- `run_3060_realvis.bat`: inicio con el preset RealVisXL.
- `run_3060_personaje.bat`: inicio con el preset SDXL de bajo consumo.
- `run_3060_juggernaut_debug.cmd`: inicio con diagn?stico de GPU y carga detallada; `Ctrl+C` cancela el servidor.
- `webui.py`: bot?n **Preparar personaje: cara + cuerpo** en Image Prompt. Usa una referencia de cara y otra de cuerpo sin entrenar un LoRA.

## Uso

1. Instala las dependencias siguiendo el README original.
2. Coloca los checkpoints en `models/checkpoints` o configura las rutas de modelos de FooocusPlus.
3. Ejecuta uno de los `.bat`.
4. Para consistencia, sube un primer plano de la cara en la imagen 1, una referencia de cuerpo en la imagen 2 y pulsa **Preparar personaje**.

Los pesos de modelos no forman parte de este repositorio. Desc?rgalos desde sus p?ginas oficiales y revisa sus licencias.
