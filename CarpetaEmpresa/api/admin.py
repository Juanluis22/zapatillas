from django.contrib import admin
# Register your models here.
from api.models import Producto, Client, Venta, VentaProducto, Proveedor, Orden

admin.site.register(Producto)
admin.site.register(Client)
admin.site.register(Venta)
admin.site.register(VentaProducto)
admin.site.register(Proveedor)
admin.site.register(Orden)