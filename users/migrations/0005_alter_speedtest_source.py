# Generated by Django 5.0.7 on 2024-07-29 07:48

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('users', '0004_alter_speedtest_source'),
    ]

    operations = [
        migrations.AlterField(
            model_name='speedtest',
            name='source',
            field=models.CharField(max_length=20),
        ),
    ]
