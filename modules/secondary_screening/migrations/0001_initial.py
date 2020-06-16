# Generated by Django 2.2.13 on 2020-06-15 09:11

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('travellers', '__first__'),
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
    ]

    operations = [
        migrations.CreateModel(
            name='Decision',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
            ],
            options={
                'db_table': 'ss_decisions',
            },
        ),
        migrations.CreateModel(
            name='DecisionReason',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
            ],
            options={
                'db_table': 'ss_decision_reasons',
            },
        ),
        migrations.CreateModel(
            name='RiskFactor',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('disease', models.ForeignKey(on_delete=django.db.models.deletion.PROTECT, to='travellers.Disease')),
            ],
            options={
                'db_table': 'ss_risk_factors',
            },
        ),
        migrations.CreateModel(
            name='TravellerRiskFactor',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('answer', models.CharField(choices=[('yes', 'Yes'), ('no', 'No'), ('unknown', 'Unknown')], default='unknown', max_length=50)),
                ('risk_factor', models.ForeignKey(on_delete=django.db.models.deletion.DO_NOTHING, to='secondary_screening.RiskFactor')),
                ('traveller', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='travellers.Traveller')),
            ],
            options={
                'db_table': 'ss_traveller_risk_factors',
            },
        ),
        migrations.CreateModel(
            name='TravellerDecisionTaken',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('created_at', models.DateTimeField(verbose_name='Created At Date')),
                ('decision', models.ForeignKey(on_delete=django.db.models.deletion.DO_NOTHING, to='secondary_screening.Decision')),
                ('traveller', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='travellers.Traveller')),
            ],
            options={
                'db_table': 'ss_traveller_decision_taken',
            },
        ),
        migrations.CreateModel(
            name='TravellerDecisionReason',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('reason', models.ForeignKey(on_delete=django.db.models.deletion.DO_NOTHING, to='secondary_screening.DecisionReason')),
                ('traveller', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='travellers.Traveller')),
            ],
            options={
                'db_table': 'ss_traveller_decision_reasons',
            },
        ),
        migrations.CreateModel(
            name='ScreeningTravellerSymptom',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('symptom', models.ForeignKey(on_delete=django.db.models.deletion.DO_NOTHING, to='travellers.Symptom')),
                ('traveller', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='travellers.Traveller')),
            ],
            options={
                'db_table': 'ss_traveller_symptoms',
            },
        ),
        migrations.CreateModel(
            name='RiskAssessment',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('decision', models.CharField(choices=[('Conditional', 'Allowed to proceed with condition'), ('Allowed', 'Allowed to Proceed with entry/Exit formalities'), ('Denied', 'Denied /Delayed Travel')], default='MC', max_length=50)),
                ('reason', models.CharField(choices=[('OTHER', 'Other'), ('LOW EXPOSURE', 'Exposure to PRIORITY DISEASE is low and the traveler can continue travelling while self-monitoring'), ('LABORATORY TESTING', 'Waiting for Laboratory specimen taken and sent to laboratory for testing for PRIORITY DISEASE'), ('SUSPECT CASE', 'Moved to Holding Facility because met the criteria for Suspect Case of PRIORITY DISEASE (complete contact listing form'), ('REFERRAL', 'Referred to a nearby health facility because the Illness is not related to PRIORITY DISEASE and require other treatment'), ('NOT RELATED', 'Illness not related to PRIORITY DISEASE and the traveler obtain medical care at PoE and can continue with travel'), ('HIGH RISK CONTACT', 'Referred to contact tracing because met the criteria for high risk contact')], default='MC', max_length=50)),
                ('other_reason', models.TextField()),
                ('traveller', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='travellers.Traveller')),
                ('user', models.ForeignKey(on_delete=django.db.models.deletion.PROTECT, to=settings.AUTH_USER_MODEL)),
            ],
            options={
                'db_table': 'ss_risk_assessment',
            },
        ),
        migrations.CreateModel(
            name='DiseaseSurveyQns',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('title', models.TextField()),
                ('category', models.CharField(choices=[('MC', 'Multiple Choice'), ('FF', 'Free Form')], default='MC', max_length=50)),
                ('disease', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='travellers.Disease')),
            ],
            options={
                'db_table': 'ss_disease_survey_qns',
            },
        ),
        migrations.CreateModel(
            name='DiseaseSurveyAns',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('title', models.TextField()),
                ('disease', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='travellers.Disease')),
                ('question', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='secondary_screening.DiseaseSurveyQns')),
                ('traveller', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='travellers.Traveller')),
            ],
            options={
                'db_table': 'ss_disease_survey_ans',
            },
        ),
    ]
