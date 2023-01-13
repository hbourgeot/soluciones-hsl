from pydantic import BaseModel
from datetime import date, time


class Empleado(BaseModel):
  __tablename__ = "empleado"
  cedula: int
  nombre: str
  apellido: str
  direccion: str
  correo: str
  telefono: str
  fecha_contratacion: date


class PromotorLogin(BaseModel):
  usuario: str
  contra: str


class Promotor(BaseModel):
  codigo: int
  usuario: str
  contra: str
  cedula_empleado: int


class Proyectos(BaseModel):
  codigo: int
  nombre: str
  denominacion_comercial: str
  estado_actual: str


class Tareas(BaseModel):
  codigo: int
  descripcion: str
  duracion_estimada: time
  duracion_real: time
  fecha_real: date
  tipo: str


class Documentos(BaseModel):
  codigo: int
  documento_especificacion: str
  codigo_fuente: int
  descripcion: str
  tipo: str
  codigo_tarea: int


class Version(BaseModel):
  codigo: int
  fecha: date
  descripcion: str
  codigo_documentos: int


class EmpleadoTareas(BaseModel):
  id: int
  codigo_tarea: int
  cedula_empleado: int


class EmpleadoProyecto(BaseModel):
  id: int
  codigo_proyecto: int
  cedula_empleado: int
