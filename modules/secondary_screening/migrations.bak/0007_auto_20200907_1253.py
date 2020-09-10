# Generated by Django 2.2.13 on 2020-09-07 09:53

from django.db import migrations
import multiselectfield.db.fields


class Migration(migrations.Migration):

    dependencies = [
    ]

    operations = [
        migrations.AlterField(
            model_name='riskassessment',
            name='reason',
            field=multiselectfield.db.fields.MultiSelectField(choices=[('HIGH RISK CONTACT', 'Referred to contact tracing because met the criteria for high risk contact'), ('OTHER', 'Other'), ('SUSPECT CASE', 'Moved to Holding Facility because met the criteria for Suspect Case of PRIORITY DISEASE (complete contact listing form'), ('NOT RELATED', 'Illness not related to PRIORITY DISEASE and the traveler obtain medical care at PoE and can continue with travel'), ('LOW EXPOSURE', 'Exposure to PRIORITY DISEASE is low and the traveler can continue travelling while self-monitoring'), ('LABORATORY TESTING', 'Waiting for Laboratory specimen taken and sent to laboratory for testing for PRIORITY DISEASE'), ('REFERRAL', 'Referred to a nearby health facility because the Illness is not related to PRIORITY DISEASE and require other treatment')], max_length=89),
        ),
    ]
