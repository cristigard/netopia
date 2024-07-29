
from django.urls import path, include
from rest_framework.routers import DefaultRouter
from rest_framework_simplejwt.views import TokenObtainPairView, TokenRefreshView, TokenVerifyView
from .views import CustomUserViewSet, UserListByDepartmentOrmView,UserListByDepartmentProcView
from django.contrib.auth import views as auth_views



router = DefaultRouter()
router.register(r'employees', CustomUserViewSet)

urlpatterns = [
    path('', include(router.urls)),
    path('employees/by/orm/<int:department_id>/', UserListByDepartmentOrmView.as_view(), name='user-list-by-department-orm'),
    path('employees/by/proc/<int:department_id>/', UserListByDepartmentProcView.as_view(), name='user-list-by-department-proc'),
    path('token/', TokenObtainPairView.as_view(), name='token-obtain-pair'),
    path('token/refresh/', TokenRefreshView.as_view(), name='token-refresh'),
    path('token/verify/', TokenVerifyView.as_view(), name='token_verify'),
]