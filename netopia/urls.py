"""
URL configuration for netopia project.

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/5.0/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path, include
from drf_spectacular.views import SpectacularAPIView, SpectacularRedocView, SpectacularSwaggerView
from users.views import (CustomLoginView, RegisterView, CustomLogoutView, FrontPageView, 
                         CustomUserUpdateView, CustomUserDeleteView, SpeedTestView)
from departments.views import (DepartmentCreateView, DepartmentUpdateView, DepartmentDeleteView)

urlpatterns = [

    path('', FrontPageView.as_view(), name = 'front'),
    path('admin/', admin.site.urls),
    path('speed', SpeedTestView.as_view(), name='speed'),

    path('users/register/', RegisterView.as_view(), name='users-register'),
    path('users/login/', CustomLoginView.as_view(), name='login'),
    path('users/logout/', CustomLogoutView.as_view(), name = 'users-logout'),
    path('users/update/<int:pk>/', CustomUserUpdateView.as_view(), name = 'users-update'),
    path('users/delete/<int:pk>/', CustomUserDeleteView.as_view(), name='users-delete'),
    
    path('departments/create/', DepartmentCreateView.as_view(), name='departments-create'),
    path('departments/update/<int:pk>/', DepartmentUpdateView.as_view(), name='departments-update'),
    path('departments/delete/<int:pk>/', DepartmentDeleteView.as_view(), name='departments-delete'),

    path('api/v1/test/', include('users.urls')),
    path('api/v1/test/', include('departments.urls')),
    path('api/v1/test/schema/', SpectacularAPIView.as_view(), name='schema'),
    path('api/v1/test/schema/swagger-ui/', SpectacularSwaggerView.as_view(url_name='schema'), name='swagger-ui'),
    path('api/v1/test/schema/redoc/', SpectacularRedocView.as_view(url_name='schema'), name='redoc'),
]