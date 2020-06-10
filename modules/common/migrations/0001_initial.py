# Generated by Django 2.2.12 on 2020-06-05 10:00

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Module',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('title', models.CharField(max_length=100)),
                ('icon', models.CharField(max_length=30)),
                ('link', models.CharField(max_length=150)),
            ],
            options={
                'db_table': 'et_modules',
            },
        ),
        migrations.CreateModel(
            name='Module_Link',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('title', models.CharField(max_length=100)),
                ('icon', models.CharField(max_length=30)),
                ('link', models.CharField(max_length=150)),
                ('module', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='common.Module')),
            ],
            options={
                'db_table': 'et_module_links',
            },
        ),
    ]
