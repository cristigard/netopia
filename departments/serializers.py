
from rest_framework import serializers
from django.core.exceptions import ValidationError
from .models import Department
from django.contrib.auth import get_user_model

UserModel = get_user_model()

class DepartmentSerializer(serializers.ModelSerializer):
    manager = serializers.PrimaryKeyRelatedField(
        queryset=UserModel.objects.filter(is_active=True), 
        required=False, 
        allow_null=True
    )
    parent = serializers.PrimaryKeyRelatedField(
        queryset=Department.objects.all(), 
        required=False, 
        allow_null=True
    )

    class Meta:
        model = Department
        fields = ['id', 'url', 'name', 'manager', 'parent']


    def validate_manager(self, value):
        """
        Check that the manager is not already managing another department,
        excluding the current department.
        """
        if value:
            # Get the current department instance if updating
            current_department = self.instance
            if current_department:
                # Exclude the current department from the check
                other_managers_ids = Department.objects.exclude(pk=current_department.pk).values_list('manager_id', flat=True).distinct()
            else:
                other_managers_ids = Department.objects.values_list('manager_id', flat=True).distinct()

            if value.id in other_managers_ids:
                raise serializers.ValidationError("The selected employee is already a manager in another department.")
        return value

    def validate_parent(self, value):
        """
        Check that the parent department is not the same as the current department.
        """
        current_department = self.instance
        if current_department and value and value.id == current_department.pk:
            raise serializers.ValidationError("A department cannot be its own parent.")
        return value


    def create(self, validated_data):
        """
        Create and return a new `Department` instance, including setting the manager's department.
        """
        instance = super().create(validated_data)

        # If a manager is selected, update the manager field for the CustomUser
        manager = validated_data.get('manager')
        if manager:
            manager.department = instance
            manager.save()

        return instance

    def update(self, instance, validated_data):
        """
        Update and return an existing `Department` instance, including updating the manager's department.
        """
        manager = validated_data.get('manager')
        
        # Update department details
        instance.name = validated_data.get('name', instance.name)
        instance.parent = validated_data.get('parent', instance.parent)
        instance.save()

        # Update the manager's department
        if manager:
            manager.department = instance
            manager.save()
        elif instance.manager:  # If the manager is removed
            instance.manager.department = None
            instance.manager.save()

        return instance
