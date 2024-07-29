from django.db import models
from django.contrib.auth import get_user_model






UserModel = get_user_model()

class Department(models.Model):
    name = models.CharField(max_length=255, unique=True)
    manager = models.ForeignKey(UserModel, on_delete=models.SET_NULL, null=True, blank=True, related_name='subordinates')
    parent = models.ForeignKey('self', on_delete=models.CASCADE, related_name='children', blank=True, null=True)

    def __str__(self):
        return self.name
