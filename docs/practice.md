# Buenas Practicas

* __Instalacion e implementacion__
    * Usar siempre la ultima version estable desde CDN o gestor de paquetes.
    * Mantener los archivos CSS y JS separados y correctamente enlazados.
    * Evitar modificar directamente los archivos de Bootstrap; usar variables Sass o un archivo propio.
* __Metodologia y estructura__
    * Seguir la filosofia __BEM__ para nombrar clases personalizadas.
    * Mantener consistencia en la estructura de bloques, elementos y modificadores.
    * Documentar las convenciones de nombres en el proyecto.
* __Clases de utilidad__
    * Usar clases de utilidad para ajustes rapidos (espaciado, tipografia, colores).
    * Evitar sobrecargar un elemento con demasiadas clases; priorizar claridad.
    * Preferir clases de utilidad en prototipos y pruebas rapidas, luego refactorizar si es necesario.
* __Componentes__
    * Aprovechar componentes nativos (botones, formularios, modales) antes de crear personalizados.
    * Usar modificadores (`.btn-primary`, `.alert-warning`) en lugar de redefinir estilos.
    * Revisar accesibilidad de cada componente (atributos ARIA, roles).
* __Personalizacion__
    * Sobrescribir variables Sass en un archivo propio para mantener escalabilidad.
    * Definir una paleta de colores corporativa en variables (`$primary`, `$secondary`).
    * Ajustar tipografia y espaciado mediante variables globales.
* __Sistema de grillas__
    * Usar el sistema de __12 columnas__ para mantener consistencia.
    * Documentar los breakpoints usados en el proyecto.
    * Evitar anidar demasiadas filas y columnas para no complicar el diseño.
* __Rendimiento y mantenimiento__
    * Eliminar dependencias innecesarias (ejemplo: JS de componentes no usados).
    * Minificar y combinar archivos CSS/JS en produccion.
    * Mantener un estilo modular y reutilizable en la documentacion.
* __Accesibilidad__
    * Usar etiquetas semanticas junto con clases de Bootstrap.
    * Verificar contraste de colores para cumplir estandares WCAG.
    * Incluir atributos ARIA en componentes interactivos.
* __Auditoria y formacion__
    * Revisar periodicamente el uso de clases y componentes.
    * Mantener guias internas de estilo y ejemplos de implementacion.
    * Crear ejercicios practicos para entrenar en el uso de utilidades y componentes.

[volver](../readme.md)