# calcular_dv_colombia_sql
Función para calculador del Dígito de Verificación (DV) para el Número de Identificación Tributaria (NIT) en Colombia.

## Descripción

Este repositorio ofrece una función en SQL Server que permite calcular el Dígito de Verificación (DV) del NIT colombiano basándose en el algoritmo estandar.

## Uso
```sql 
SELECT dbo.CalcularDigitoVerificacion('tu_nit_sin_dv')
```
### Ejemplo:
```sql
SELECT NoIdentificacion, dbo.CalcularDigitoVerificacion(noidentificacion) AS DV, Nombre
FROM personas 
```

