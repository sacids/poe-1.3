# Generated by Django 2.2.14 on 2020-08-06 14:03

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('travellers', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='symptom',
            name='title_en_us',
            field=models.CharField(max_length=100, null=True),
        ),
        migrations.AddField(
            model_name='symptom',
            name='title_sw',
            field=models.CharField(max_length=100, null=True),
        ),
        migrations.AddField(
            model_name='traveller',
            name='accept',
            field=models.IntegerField(default=0, null=True),
        ),
        migrations.AlterField(
            model_name='symptom',
            name='alias',
            field=models.CharField(max_length=100, null=True),
        ),
    ]
