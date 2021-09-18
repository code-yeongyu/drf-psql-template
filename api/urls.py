from django.urls import path
from rest_framework.routers import DefaultRouter

# import here your viewsets

router = DefaultRouter(trailing_slash=False)
# register your router here like:
#router.register(r'path'), viewset, basename='basename')

urlpatterns = [
    # add here your generic or function views, like:
    # path('path', views.function_name, name='name'),
]
urlpatterns += router.urls
