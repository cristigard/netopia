import time
from django.db import connection
from django.contrib.auth import get_user_model
from django.contrib.auth import views as auth_views
from django.shortcuts import render
from rest_framework.response import Response
from rest_framework.exceptions import NotFound
from rest_framework.views import APIView
from rest_framework import serializers, viewsets, generics, routers, status
from .serializers import CustomUserSerializer
from departments.models import Department
from .models import SpeedTest
from .forms import CustomAuthenticationForm, CustomRegisterForm, CustomUserUpdateForm
from django.urls import reverse_lazy, reverse
from django.contrib.messages.views import SuccessMessageMixin
from django.contrib.auth.mixins import LoginRequiredMixin
from django.views import generic
from django.contrib.auth import get_user_model
from django.contrib import messages
from drf_spectacular.utils import extend_schema


UserModel = get_user_model()


#---DJANGO START---

class CustomLoginView(auth_views.LoginView):
    form_class = CustomAuthenticationForm
    template_name = 'users/login.html'
    login_url='login'
    next_page = reverse_lazy('front')


class CustomLogoutView(auth_views.LogoutView):
    next_page = reverse_lazy('login')


class RegisterView(SuccessMessageMixin, generic.CreateView):
    form_class = CustomRegisterForm
    template_name = 'users/register.html'
    success_url = reverse_lazy('front')
    success_message = "Contul tau a fost creat cu succes!"


class CustomUserUpdateView(generic.UpdateView):
    model = UserModel
    form_class = CustomUserUpdateForm
    template_name = 'users/update.html'

    def get_success_url(self):
        # Redirect to the same page or a specific URL after successful update
        return reverse_lazy('front')

    def form_valid(self, form):
        response = super().form_valid(form)
        messages.success(self.request, 'User information updated successfully.')
        return response

class CustomUserDeleteView(generic.DeleteView):
    model = UserModel
    template_name = 'users/delete.html'
    success_url = reverse_lazy('front')  # Redirect to a specific URL after successful deletion

    def delete(self, request, *args, **kwargs):
        response = super().delete(request, *args, **kwargs)
        messages.success(request, 'User has been deleted successfully.')
        return response


class FrontPageView(LoginRequiredMixin, generic.TemplateView):
    template_name = 'users/front.html'

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        # Add custom context
        context['departments'] = Department.objects.all()
        context['users'] = UserModel.objects.all()
        context['inactive_users'] = UserModel.objects.filter(is_active=False)
        return context


class SpeedTestView(generic.ListView):
    model = SpeedTest
    template_name = 'users/speed_test.html'
    context_object_name = 'speed_tests' 


#---DJANGO START---

#---DRF START ---

class CustomUserViewSet(viewsets.ModelViewSet):
    queryset = UserModel.objects.all()
    serializer_class = CustomUserSerializer

    @extend_schema(
        description='Retrieve a list of employees. This endpoint returns all employees in the system.'
    )
    def list(self, request, *args, **kwargs):
        return super().list(request, *args, **kwargs)

    @extend_schema(
        description='Retrieve an employee by ID. Provide the employee ID to get the details of a specific employee.'
    )
    def retrieve(self, request, *args, **kwargs):
        return super().retrieve(request, *args, **kwargs)

    @extend_schema(
        description='Create a new employee. Provide employee details to create a new employee in the system.'
    )
    def create(self, request, *args, **kwargs):
        return super().create(request, *args, **kwargs)

    @extend_schema(
        description='Update an existing employee. Provide employee details to update an existing employee in the system.'
    )
    def update(self, request, *args, **kwargs):
        return super().update(request, *args, **kwargs)

    @extend_schema(
        description='Partially update an existing employee. Provide the fields you want to update for an existing employee.'
    )
    def partial_update(self, request, *args, **kwargs):
        return super().partial_update(request, *args, **kwargs)

    @extend_schema(
        description='Delete an employee by ID. Provide the employee ID to delete a specific employee from the system.'
    )
    def destroy(self, request, *args, **kwargs):
        return super().destroy(request, *args, **kwargs)




#ORM
class UserListByDepartmentOrmView(generics.ListAPIView):
    serializer_class = CustomUserSerializer

    @extend_schema(
        description='Retrieve a list of users belonging to a specific department using ORM. The department is identified by its ID. This view returns a list of users who are associated with the specified department.',
    )

    def get(self, request, *args, **kwargs):
        # Use the inherited get method to add schema
        return super().get(request, *args, **kwargs)

    def get_queryset(self):
        department_id = self.kwargs.get('department_id')

        # Check if the department exists
        if not Department.objects.filter(id=department_id).exists():
            raise NotFound(detail="Department not found.")

        start_time=time.perf_counter()
        # Filter users by department_id
        queryset = UserModel.objects.filter(department_id=department_id)

        SpeedTest.objects.create(source='DEPT-BY-USER-ORM', speed=time.perf_counter()-start_time)

        
        # Check if any users exist for the given department_id
        if not queryset.exists():
            raise NotFound(detail="No users found for this department.")

        # print(queryset)
        return queryset




#PROCEDURE
class UserListByDepartmentProcView(generics.ListAPIView):
    serializer_class = CustomUserSerializer

    @extend_schema(
        description='Retrieve a list of users belonging to a specific department using a stored procedure. The department is identified by its ID. This view returns a list of users who are associated with the specified department.',
    )
    def get(self, request, *args, **kwargs):
        # Use the inherited get method to add schema
        return super().get(request, *args, **kwargs)

    def get_queryset(self):
        department_id = self.kwargs.get('department_id')

        # Check if the department exists
        if not Department.objects.filter(id=department_id).exists():
            raise NotFound(detail="Department not found.")

        start_time = time.perf_counter()

        # Fetch users from the department using raw SQL
        with connection.cursor() as cursor:
            cursor.callproc('GetUsersByDepartment', [department_id])
            rows = cursor.fetchall()

        # Measure and log the speed of the query
        SpeedTest.objects.create(source='DEPT-BY-USER-PROC', speed=time.perf_counter() - start_time)

        # Ensure we have at least one user, otherwise raise an error
        if not rows:
            raise NotFound(detail="No users found for this department.")

        # Convert rows into Django model instances
        users = [
            UserModel(
                id=row[0],
                password=row[1],
                last_login=row[2],
                is_superuser=row[3],
                username=row[4],
                is_staff=row[5],
                is_active=row[6],
                date_joined=row[7],
                email=row[8],
                first_name=row[9],
                last_name=row[10],
                department_id=row[11]
            ) for row in rows
        ]

        # Return the queryset-like object
        return users

#---DRF END ---
