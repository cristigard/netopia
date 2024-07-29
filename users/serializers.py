from django.contrib.auth import get_user_model
from rest_framework import serializers
from departments.serializers import DepartmentSerializer
from departments.models import Department


UserModel = get_user_model()


from rest_framework import serializers
from django.contrib.auth import get_user_model

UserModel = get_user_model()

class CustomUserSerializer(serializers.ModelSerializer):
    password = serializers.CharField(write_only=True)

    class Meta:
        model = UserModel
        fields = ['id', 'email', 'password', 'first_name', 'last_name', 'department', 'is_active']

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)

        # Check if instance is provided (create or update operation)
        if self.instance:
            # If an update operation, include the department field
            self.fields['department'].required = False
        else:
            # If create operation, exclude the department field
            self.fields.pop('department', None)

    def create(self, validated_data):
        # Create a new user instance without the department field if not provided
        user = UserModel(
            email=validated_data['email'],
            first_name=validated_data['first_name'],
            last_name=validated_data['last_name'],
            is_active=validated_data.get('is_active', True),
        )
        user.set_password(validated_data['password'])
        user.save()
        return user

    def update(self, instance, validated_data):
        # Update user instance
        instance.email = validated_data.get('email', instance.email)
        instance.first_name = validated_data.get('first_name', instance.first_name)
        instance.last_name = validated_data.get('last_name', instance.last_name)
        instance.is_active = validated_data.get('is_active', instance.is_active)

        # Only update department if it is provided in the update data
        if 'department' in validated_data:
            instance.department = validated_data['department']

        # Only update password if provided
        if 'password' in validated_data:
            instance.set_password(validated_data['password'])

        instance.save()
        return instance