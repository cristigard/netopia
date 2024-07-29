
from django.urls import path, include
from rest_framework.routers import DefaultRouter
from rest_framework_simplejwt.views import TokenObtainPairView, TokenRefreshView
from .views import DepartmentViewSet, DepartmentListByUserOrmView, DepartmentListByUserProcView


router = DefaultRouter()
router.register(r'departments', DepartmentViewSet)

urlpatterns = [
    path('', include(router.urls)),
    path('departments/by/orm/<int:user_id>/', DepartmentListByUserOrmView.as_view(), name='department-list-by-user-orm'),
    path('departments/by/proc/<int:user_id>/', DepartmentListByUserProcView.as_view(), name='department-list-by-user-proc'),

]