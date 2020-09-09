# Generated by Django 2.2.13 on 2020-09-09 07:13

from django.db import migrations, models
import multiselectfield.db.fields


class Migration(migrations.Migration):

    dependencies = [
        ('secondary_screening', '0010_auto_20200909_1012'),
    ]

    operations = [
        migrations.AlterField(
            model_name='riskassessment',
            name='decision',
            field=models.CharField(choices=[('Denied', 'Denied /Delayed Travel'), ('Conditional', 'Allowed to proceed with condition'), ('Allowed', 'Allowed to Proceed with entry/Exit formalities')], default='Denied', max_length=50),
        ),
        migrations.AlterField(
            model_name='riskassessment',
            name='reason',
            field=multiselectfield.db.fields.MultiSelectField(choices=[('SUSPECT CASE', 'Moved to Holding Facility because met the criteria for Suspect Case of PRIORITY DISEASE (complete contact listing form'), ('HIGH RISK CONTACT', 'Referred to contact tracing because met the criteria for high risk contact'), ('LOW EXPOSURE', 'Exposure to PRIORITY DISEASE is low and the traveler can continue travelling while self-monitoring'), ('OTHER', 'Other'), ('NOT RELATED', 'Illness not related to PRIORITY DISEASE and the traveler obtain medical care at PoE and can continue with travel'), ('LABORATORY TESTING', 'Waiting for Laboratory specimen taken and sent to laboratory for testing for PRIORITY DISEASE'), ('REFERRAL', 'Referred to a nearby health facility because the Illness is not related to PRIORITY DISEASE and require other treatment')], max_length=89),
        ),
    ]
