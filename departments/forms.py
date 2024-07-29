from django import forms
from django.core.exceptions import ValidationError
from .models import Department
from django.contrib.auth import get_user_model



UserModel = get_user_model()


class DepartmentForm(forms.ModelForm):
    class Meta:
        model = Department
        fields = ['name', 'manager', 'parent']

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        # Exclude inactive users from the manager queryset
        self.fields['manager'].queryset = UserModel.objects.filter(is_active=True)

    def clean_manager(self):
        # Validate the manager field
        manager = self.cleaned_data.get('manager')

        if manager and Department.objects.filter(manager=manager).exists():
            # Raise a validation error for the manager field if the user is already a manager elsewhere
            raise ValidationError("The selected employee is already a manager in another department.")

        return manager

    def save(self, commit=True):
        # Save the form instance
        instance = super().save(commit=False)

        if commit:
            # Save the department instance
            instance.save()

            # If a manager is selected, update the manager field for the CustomUser
            manager = self.cleaned_data.get('manager')
            if manager:
                manager.department = instance
                manager.save()

        return instance

class DepartmentUpdateForm(forms.ModelForm):
    class Meta:
        model = Department
        fields = ['name', 'manager', 'parent']

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        if self.instance and self.instance.pk:
            # Exclude the current department from the parent field's queryset
            self.fields['parent'].queryset = Department.objects.exclude(pk=self.instance.pk)
        else:
            # For new departments, include all departments in the parent field's queryset
            self.fields['parent'].queryset = Department.objects.all()

        # Exclude inactive users from the manager field's queryset
        self.fields['manager'].queryset = UserModel.objects.filter(is_active=True)

    def clean_manager(self):
        # Validate the manager field
        manager = self.cleaned_data.get('manager')
        current_department = self.instance

        if manager:
            # Get IDs of managers in other departments, excluding the current department
            other_managers_ids = Department.objects.exclude(pk=current_department.pk).values_list('manager_id', flat=True).distinct()

            if manager.id in other_managers_ids:
                # Raise a validation error if the selected manager is already managing another department
                raise ValidationError("The selected employee is already a manager in another department.")

        return manager

    def save(self, commit=True):
        # Save the form instance
        instance = super().save(commit=False)

        if commit:
            # Save the department instance
            instance.save()

            # If a manager is selected, update the manager field for the CustomUser
            manager = self.cleaned_data.get('manager')
            if manager:
                manager.department = instance
                manager.save()

        return instance


