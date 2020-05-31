# Generated by Django 2.2.12 on 2020-05-30 22:22

from django.db import migrations
import phone_field.models


class Migration(migrations.Migration):

    dependencies = [
        ('travellers', '0002_auto_20200531_0115'),
    ]

    operations = [
        migrations.AlterField(
            model_name='internationaltraveller',
            name='phone_number',
            field=phone_field.models.PhoneField(help_text='Contact Phone Number', max_length=31, null=True),
        ),
    ]
