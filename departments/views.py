import time
from django.db import connection
from django.shortcuts import render
from rest_framework import serializers, viewsets, generics, routers, status
from .models import Department
from .serializers import DepartmentSerializer
from rest_framework.exceptions import NotFound
from users.serializers import CustomUserSerializer
from django.contrib.messages.views import SuccessMessageMixin
from .forms import DepartmentForm, DepartmentUpdateForm
from django.contrib.auth import get_user_model
from django.contrib import messages
from django.urls import reverse_lazy
from django.views import generic
from users.models import SpeedTest
from drf_spectacular.utils import extend_schema



UserModel = get_user_model()


#-----DJANGO START-----

class DepartmentCreateView(generic.CreateView):
    model = Department
    form_class = DepartmentForm
    template_name = 'departments/create.html'
    success_url = reverse_lazy('front')

    def form_valid(self, form):
        response = super().form_valid(form)
        messages.success(self.request, 'Department created successfully!')
        return response

class DepartmentUpdateView(generic.UpdateView):
    model = Department
    form_class = DepartmentUpdateForm
    template_name = 'departments/update.html'
    success_url = reverse_lazy('front')

    def form_valid(self, form):
        response = super().form_valid(form)
        messages.success(self.request, 'Department updated successfully!')
        return response

class DepartmentDeleteView(SuccessMessageMixin, generic.DeleteView):
    model = Department
    template_name = 'departments/delete.html'
    pk_url_kwarg = 'pk'
    success_url = reverse_lazy('front')
    success_message = "Department '{object_name}' deleted successuly!"

    def get_success_message(self, cleaned_data):
        return self.success_message.format(object_name=str(self.object.name))



#-----DJANGO END-----

#-----DRF START-----

class DepartmentViewSet(viewsets.ModelViewSet):
    queryset = Department.objects.all()
    serializer_class = DepartmentSerializer

    @extend_schema(
        description='Retrieve a list of departments. This endpoint returns all departments in the system.'
    )
    def list(self, request, *args, **kwargs):
        return super().list(request, *args, **kwargs)

    @extend_schema(
        description='Retrieve a department by ID. Provide the department ID to get the details of a specific department.'
    )
    def retrieve(self, request, *args, **kwargs):
        return super().retrieve(request, *args, **kwargs)

    @extend_schema(
        description='Create a new department. Provide department details to create a new department in the system.'
    )
    def create(self, request, *args, **kwargs):
        return super().create(request, *args, **kwargs)

    @extend_schema(
        description='Update an existing department. Provide department details to update an existing department in the system.'
    )
    def update(self, request, *args, **kwargs):
        return super().update(request, *args, **kwargs)

    @extend_schema(
        description='Partially update an existing department. Provide the fields you want to update for an existing department.'
    )
    def partial_update(self, request, *args, **kwargs):
        return super().partial_update(request, *args, **kwargs)

    @extend_schema(
        description='Delete a department by ID. Provide the department ID to delete a specific department from the system.'
    )
    def destroy(self, request, *args, **kwargs):
        return super().destroy(request, *args, **kwargs)



class DepartmentListByUserOrmView(generics.RetrieveAPIView):
    serializer_class = DepartmentSerializer

    @extend_schema(
        description='Retrieve the department associated with a specific user. Provide the user ID to get the department details. This endpoint uses ORM to fetch the department information from the database.',
    )
    def get(self, request, *args, **kwargs):
        # Use the inherited get method to add schema
        return super().get(request, *args, **kwargs)

    def get_object(self):
        user_id = self.kwargs.get('user_id')

        # Measure start time
        start_time = time.perf_counter()

        # Check if the user exists
        user = UserModel.objects.filter(id=user_id).first()
        if not user:
            raise NotFound(detail="Employee not found.")
        
        # Check if the user has an associated department
        department = user.department
        if not department:
            raise NotFound(detail="No department found for this user.")
        
        # Measure end time and log speed
        SpeedTest.objects.create(source='DEPT-BY-USER-ORM', speed=time.perf_counter() - start_time)

        return department


class DepartmentListByUserProcView(generics.RetrieveAPIView):
    serializer_class = DepartmentSerializer

    @extend_schema(
        description='Retrieve the department associated with a specific user. Provide the user ID to get the department details. This endpoint uses a stored procedure to fetch the department information from the database.',
    )
    def get(self, request, *args, **kwargs):
        # Use the inherited get method to add schema
        return super().get(request, *args, **kwargs)

    def get_object(self):
        user_id = self.kwargs.get('user_id')

        # Check if the user exists
        if not UserModel.objects.filter(id=user_id).exists():
            raise NotFound(detail="Employee not found.")

        start_time = time.perf_counter()
        
        # Fetch the department associated with the user using raw SQL
        with connection.cursor() as cursor:
            cursor.callproc('GetDepartmentsByUser', [user_id])
            row = cursor.fetchone()

        # Measure and log the speed of the query
        SpeedTest.objects.create(source='DEPT-BY-USER-PROC', speed=time.perf_counter() - start_time)

        # Ensure we have exactly one department, otherwise raise an error
        if not row:
            raise NotFound(detail="No department found for this user.")

        # Convert the single row into a Django model instance
        department = Department(
            id=row[0],
            name=row[1],
            manager_id=row[2],
            parent_id=row[3]
        )

        # Return the department instance
        return department

#-----DRF START-----
