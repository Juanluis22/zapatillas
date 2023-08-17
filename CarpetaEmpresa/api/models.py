from django.db import models
from django.core.validators import MinValueValidator, MaxValueValidator
from django.core.validators import MinLengthValidator,MaxLengthValidator
import datetime

# Create your models here.

class Orden(models.Model):
    OrdenName = models.CharField(max_length=200)
    OrdenDescription = models.CharField(blank=True, max_length=200)
    OrdenPrice = models.DecimalField(max_digits=10, decimal_places=2,validators=[MinValueValidator(0)])
    productoModelo = models.CharField(blank=True, max_length=200)
    productoTalla = models.CharField(max_length=2, blank=True, validators=[MinLengthValidator(2), MaxLengthValidator(2), MinValueValidator('28'), MaxValueValidator('47')])
    productoImage = models.ImageField(null=True, blank=True, upload_to='images/')
    # create_at = models.DateTimeField(default=datetime.datetime.now)
    def __str__ (self):
        return self.OrdenName

class Proveedor(models.Model):
    proveedorName = models.CharField(max_length=200)
    proveedorDescription = models.CharField(blank=True, max_length=200)
    proveedorPrice = models.DecimalField(max_digits=10, decimal_places=2)
    proveedorImage = models.ImageField(null=True, blank=True, upload_to='images/')
    # create_at = models.DateTimeField(default=datetime.datetime.now)
    def __str__ (self):
        return self.proveedorName


class Producto(models.Model):
    productoName = models.CharField(max_length=200)
    productoDescription = models.CharField(blank=True, max_length=200)
    productoPrice = models.DecimalField(max_digits=10, decimal_places=2,validators=[MinValueValidator(0)])
    productoModelo = models.CharField(blank=True, max_length=200)
    productoTalla = models.CharField(max_length=2, blank=True, validators=[MinLengthValidator(2), MaxLengthValidator(2), MinValueValidator('28'), MaxValueValidator('47')])
    productoImage = models.ImageField(null=True, blank=True, upload_to='images/')
    # create_at = models.DateTimeField(default=datetime.datetime.now)
    def __str__ (self):
        return self.productoName

class Person(models.Model):
    nombre = models.CharField('Nombre', max_length = 100)
    apellido = models.CharField('Apellido', max_length = 200)
    foto = models.ImageField(null=True, blank=True, upload_to='fotos/')
    class Meta:
        abstract = True

class Client(Person):
    email = models.EmailField(blank=True)

    def __str__(self):
        return '{0},{1}'.format(self.apellido,self.nombre)

class Venta(models.Model) :
    client = models.ForeignKey(Client,on_delete=models.CASCADE, verbose_name='Cliente ok', null=False)
    fecha = models.DateTimeField(default=datetime.datetime.now)
    description = models.TextField(blank = True)
    def __str__ (self):
        return '{0}'.format(self.id)


class VentaProducto(models.Model):
    venta = models.ForeignKey(Venta, on_delete=models.CASCADE, verbose_name='Nro Venta', null=False)
    producto = models.ForeignKey(Producto,on_delete=models.CASCADE, verbose_name='Producto', null=False)
    cantidad = models.PositiveIntegerField(default=0)
    preciounit = models.FloatField()
    modified = models.DateTimeField(auto_now=True)
    created_at = models.DateTimeField(auto_now_add=True)
    state = models.BooleanField(default = True)
    def __str__(self):
        return f'{self.venta} to {self.producto}'

    class Meta:
        indexes = [
                models.Index(fields=['venta', 'producto',]),
            ]