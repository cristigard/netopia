import uuid
from django.db import models
from django.contrib.auth.models import AbstractUser





class CustomUser(AbstractUser):
    email = models.EmailField(unique=True, blank=False)
    first_name = models.CharField(max_length=100)
    last_name = models.CharField(max_length=100)
    #avoid the premature access issue is to delay the call to get_user_model until it is actually needed('departments.Department')
    department = models.ForeignKey('departments.Department', on_delete=models.SET_NULL, null=True, blank=True)

    def save(self, *args, **kwargs):
        self.username = str(uuid.uuid4())
        super().save(*args, **kwargs)

    def __str__(self):
        return f'{self.last_name} {self.first_name}'

    class Meta:
        indexes = [
            models.Index(fields=['department']),
        ]


class SpeedTest(models.Model):
    source = models.CharField(max_length=20)
    speed = models.FloatField()