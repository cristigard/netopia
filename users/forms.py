from django import forms
from django.contrib.auth import get_user_model
from django.core.exceptions import ValidationError
from django.contrib.auth.forms import UserCreationForm, AuthenticationForm
from departments.models import Department


UserModel = get_user_model()


class CustomAuthenticationForm(AuthenticationForm):
    username = forms.EmailField(label = 'Email')


class CustomRegisterForm(UserCreationForm):
    
    class Meta:
        model = UserModel
        fields = ['first_name', 'last_name', 'email', 'password1', 'password2']




class CustomUserUpdateForm(forms.ModelForm):

    class Meta:
        model = UserModel
        fields = ['first_name', 'last_name', 'email',  'department', 'is_active']
